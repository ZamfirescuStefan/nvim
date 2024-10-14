return {
    'mfussenegger/nvim-dap',
    dependencies = { 
        'nvim-neotest/nvim-nio',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'jay-babu/mason-nvim-dap.nvim'
    },
    config = function()

        local dap = require('dap')
        local dapui = require('dapui')

        -- Setup dapui and virtual text for better debugging experience
        dapui.setup()
        require("nvim-dap-virtual-text").setup()

        -- Detect the operating system
        local os_name = vim.loop.os_uname().sysname

        -- Configure DAP adapter based on OS
        if os_name == "Darwin" then  -- macOS (use LLDB)
            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                command = 'codelldb',
                args = {"--port", "${port}"},

            }
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        }

        elseif os_name == "Linux" then  -- Linux (use GDB)

            -- Adapter configuration for GDB (Linux)
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = '/home/szamfirescu/.vscode/extensions/ms-vscode.cpptools-1.21.6/debugAdapters/bin/OpenDebugAD7',  -- Path to cpptools on Linux
            }

            -- Configuration for C++ debugging with GDB on Linux
            dap.configurations.cpp = {
                {
                    name = "Launch GDB",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    setupCommands = {
                        {
                            text = '-enable-pretty-printing',
                            description = 'Enable pretty printing',
                            ignoreFailures = false
                        },
                    },
                    miDebuggerPath = '/usr/bin/gdb',  -- Path to GDB on Linux
                    miDebuggerArgs = '',
                    externalConsole = false,  -- Set this to true if you want an external console
                },
            }

        end

        -- Automatically open dap-ui when starting/stopping debugging
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Key mappings for debugging
        vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint)
        vim.keymap.set('n', '<Leader>dc', dap.continue)
        vim.keymap.set('n', '<Leader>ds', dap.terminate)

        vim.keymap.set('n', '<Leader>do', dapui.toggle)

        vim.keymap.set('n', '<F1>', dap.continue)
        vim.keymap.set('n', '<F2>', dap.step_into)
        vim.keymap.set('n', '<F3>', dap.step_over)
        vim.keymap.set('n', '<F4>', dap.step_out)
        vim.keymap.set('n', '<F5>', dap.step_back)
        vim.keymap.set('n', '<F9>', dap.restart)
    end
}
