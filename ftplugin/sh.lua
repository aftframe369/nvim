if vim.fn.getline(1) == "" then
	vim.fn.append(0, "#!/bin/bash")
end
