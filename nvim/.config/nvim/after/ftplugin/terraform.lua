-- Auto-run `tofu init -backend=false` for terraform/opentofu modules that
-- haven't been initialized yet, so tofu-ls can resolve symbols (go-to-def, etc).
-- Cached per-directory for the lifetime of the session.

local initialized = vim.g._tofu_init_seen or {}
vim.g._tofu_init_seen = initialized

local bufname = vim.api.nvim_buf_get_name(0)
if bufname == "" then return end
local dir = vim.fs.dirname(vim.fn.fnamemodify(bufname, ":p"))
if initialized[dir] then return end
initialized[dir] = true

if vim.uv.fs_stat(dir .. "/.terraform") then return end

vim.notify("tofu init: starting in " .. dir, vim.log.levels.INFO)

vim.system({ "tofu", "init", "-backend=false" }, { cwd = dir }, function(out)
    vim.schedule(function()
        if out.code == 0 then
            vim.notify("tofu init: finished in " .. dir, vim.log.levels.INFO)
            local attached_bufs = {}
            for _, c in ipairs(vim.lsp.get_clients({ name = "tofu_ls" })) do
                for buf in pairs(c.attached_buffers) do
                    attached_bufs[buf] = true
                end
                c:stop()
                vim.wait(5000, function() return c.is_stopped and c:is_stopped() end, 50)
            end
            for buf in pairs(attached_bufs) do
                if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
                    vim.api.nvim_buf_call(buf, function() vim.cmd("edit") end)
                end
            end
        else
            vim.notify(
                "tofu init failed in " .. dir .. "\n" .. (out.stderr or ""),
                vim.log.levels.WARN
            )
        end
    end)
end)
