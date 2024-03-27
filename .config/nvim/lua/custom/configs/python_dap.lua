-- Define the Python debugger adapter
local dap = require('dap')

dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' },
}

-- Define the configuration for Python debugging
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.input('Path to python executable: ', vim.fn.getcwd() .. '/venv/bin/python')
    end,
  },
}

-- Define a function to connect to the debugger
function ConnectToDockerPythonDebugger()
  local host = '127.0.0.1' -- Make sure the debugger is exposed on this host in your Docker container
  local port = 5678 -- Use the same port you specified when starting debugpy in the Docker container
  dap.connect('python', {
    host = host,
    port = port
  })
end
