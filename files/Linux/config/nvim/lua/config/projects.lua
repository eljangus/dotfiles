-- project switcher: pinned dirs plus the git root of every recently opened file
local pinned = { "~/dotfiles", "~/Uni", "~/org", "~/.config/quickshell/Lily" }

return function()
    local seen, list = {}, {}
    local function add(dir)
        if dir and not seen[dir] and vim.fn.isdirectory(dir) == 1 then -- skip what this machine doesn't have
            seen[dir] = true
            list[#list + 1] = dir
        end
    end
    for _, dir in ipairs(pinned) do add(vim.fs.normalize(dir)) end
    for _, file in ipairs(vim.v.oldfiles) do
        if vim.startswith(file, "/") then add(vim.fs.root(file, ".git")) end
    end

    local actions = require("telescope.actions")
    local state = require("telescope.actions.state")
    require("telescope.pickers").new({}, {
        prompt_title = "Projects",
        finder = require("telescope.finders").new_table({
            results = list,
            entry_maker = function(dir)
                return { value = dir, display = vim.fn.fnamemodify(dir, ":~"), ordinal = dir }
            end,
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        -- cd into it, then find a file with telescope
        attach_mappings = function(buf)
            actions.select_default:replace(function()
                local entry = state.get_selected_entry()
                actions.close(buf)
                if entry then
                    vim.fn.chdir(entry.value)
                    vim.schedule(require("telescope.builtin").find_files)
                end
            end)
            return true
        end,
    }):find()
end
