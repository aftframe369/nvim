local M = {}

function init()
	local dap = require("dap")
	local ui = require("dapui")

	dap.adapters.gdb = {
		type = "executable",
		command = "gdb",
		args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
	}

	dap.configurations.c = {
		{
			name = "Launch",
			type = "gdb",
			request = "launch",
			program = function()
				-- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				return vim.fn.getcwd() .. '/target/main.o'
			end,
			args = {}, -- provide arguments if needed
			cwd = "${workspaceFolder}",
			stopAtBeginningOfMainSubprogram = false,
		},
	}

	dap.listeners.after.event_initialized['me.dap.keys'] = function()
		vim.keymap.set("n", "<down>", dap.step_over)
		vim.keymap.set("n", "<left>", dap.step_out)
		vim.keymap.set("n", "<right>", dap.step_into)

	end
	local reset_keys = function()
		pcall(vim.keymap.del, "n", "<down>")
		pcall(vim.keymap.del, "n", "<left>")
		pcall(vim.keymap.del, "n", "<right>")
	end
	dap.listeners.after.event_terminated['me.dap.keys'] = reset_keys
	dap.listeners.after.disconnected['me.dap.keys'] = reset_keys

	ui.setup()

	vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

	dap.listeners.before.attach.dapui_config = function()
		ui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		ui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		ui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		ui.close()
	end
end

M.init = init;

M.keymaps = {
	-- Debugger
	{
		"<leader>dt",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "Toggle Breakpoint",
		nowait = true,
		remap = false,
	},
	{
		"<leader>dn",
		function()
			vim.cmd("DapNew")
		end,
		desc = "Run debug",
		nowait = true,
		remap = false,
	},
	{
		"<leader>dc",
		function()
			require("dap").continue()
		end,
		desc = "Continue",
		nowait = true,
		remap = false,
	},
	{
		"<leader>di",
		function()
			require("dap").step_into()
		end,
		desc = "Step Into",
		nowait = true,
		remap = false,
	},
	{
		"<leader>do",
		function()
			require("dap").step_over()
		end,
		desc = "Step Over",
		nowait = true,
		remap = false,
	},
	{
		"<leader>du",
		function()
			require("dap").step_out()
		end,
		desc = "Step Out",
		nowait = true,
		remap = false,
	},
	{
		"<leader>dl",
		function()
			require("dap").run_last()
		end,
		desc = "Run Last",
		nowait = true,
		remap = false,
	},
	{
		"<leader>dq",
		function()
			require("dap").terminate()
			require("dapui").close()
			require("nvim-dap-virtual-text").toggle()
		end,
		desc = "Terminate",
		nowait = true,
		remap = false,
	},
	{
		"<leader>db",
		function()
			require("dap").list_breakpoints()
		end,
		desc = "List Breakpoints",
		nowait = true,
		remap = false,
	},
	{
		"<leader>de",
		function()
			require("dap").set_exception_breakpoints({ "all" })
		end,
		desc = "Set Exception Breakpoints",
		nowait = true,
		remap = false,
	},
}

return M
