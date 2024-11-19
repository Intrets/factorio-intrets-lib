require("util.mod_name")

local function do_part(name, part)
    local test = get_mod_namespace()
    local full_name = "prototypes." .. name .. "." .. name .. "-" .. part
    local status, module = pcall(require, full_name)
    if status then
        assert(module)
        return module
    else
        local not_found_string = "module " .. full_name .. " not found;"
        local match_result = module:find(not_found_string, 1, true)
        if match_result == nil then
            assert(false, module)
        end

        return nil
    end
end

local function do_all_part(part)
    local prototypes_names = require(get_mod_namespace() .. ".prototypes-names")

    result = {}
    for _, name in pairs(prototypes_names) do
        local module = do_part(name, part)
        if module ~= nil then
            result[name] = module
        end
    end
    return result
end

function do_data() return do_all_part("data") end

function do_data_updates() return do_all_part("data-updates") end

function do_data_final_fixes() return do_all_part("data-final-fixes") end

function do_control() return do_all_part("control") end

return {
    do_data = do_data,
    do_data_updates = do_data_updates,
    do_data_final_fixes = do_data_final_fixes,
    do_control = do_control,
}
