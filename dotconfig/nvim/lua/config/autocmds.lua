-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

local copyright_header = [[
// Copyright 2025 lambda-os.com
]]

-- Autocmd to insert the copyright header on BufNewFile for C++ file types
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.{cpp,c,hpp,h}",
    callback = function()
        -- Alternative check for empty buffer (compatible with older Neovim versions)
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        if #lines == 1 and lines[1] == "" then
            -- Insert the copyright header at the beginning of the buffer
            vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(copyright_header, "\n"))
            -- Move the cursor below the inserted text (optional)
            vim.api.nvim_win_set_cursor(0, {vim.api.nvim_buf_line_count(0), 0})
        end
    end,
})

