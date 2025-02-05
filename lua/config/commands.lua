local function run_cmake_command(command)
    local project_root = vim.fn.getcwd()
    local possible_dirs = { "build", "harman/build", "out/build", "cmake-build" }
    local build_dir = nil

    for _, dir in ipairs(possible_dirs) do
        if vim.fn.isdirectory(project_root .. "/" .. dir) == 1 then
            build_dir = dir
            break
        end
    end

    -- If no existing build directory, use the first option and create it
    if build_dir == nil then
        build_dir = possible_dirs[1]
        vim.fn.mkdir(project_root .. "/" .. build_dir, "p")
    end

    local cmd = string.format("cd %s && %s", build_dir, command)

    vim.cmd("botright split | resize 10 | terminal bash -c '" .. cmd .. "'")
end

vim.api.nvim_create_user_command("CMake", function()
    run_cmake_command("cmake ..")
end, {})

vim.api.nvim_create_user_command("Build", function()
    run_cmake_command("cmake .. && cmake --build .")
end, {})
