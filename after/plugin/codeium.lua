vim.keymap.set("n", "<Tab>", function() 
	return vim.fn["codeium#Accept"]()
end)

vim.keymap.set("i", "<Tab>", function() 
	return vim.fn["codeium#Accept"]()
end)

vim.keymap.set("n", "<S-Tab>", function() 
	return vim.fn["codeium#Clear"]()
end)

vim.keymap.set("i", "<S-Tab>", function() 
	return vim.fn["codeium#Clear"]()
end)

