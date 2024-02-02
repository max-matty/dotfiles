return {
	"mfussenegger/nvim-dap",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},

	config = function()
		local dap = require("dap")
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/max/.config/local/share/nvim/mason/bin/OpenDebugAD7",
		}
		dap.configurations.c = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				-- program = "Debug",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
		}

		vim.api.nvim_set_hl(0, "blue", { fg = "#0000FF" })
		vim.api.nvim_set_hl(0, "green", { fg = "#008000" })
		vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
		vim.api.nvim_set_hl(0, "red", { fg = "#FF0000" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		local dapui = require("dapui")
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})

		require("nvim-dap-virtual-text").setup({
			highlight_changed_variables = true,
		})
	end,
}
