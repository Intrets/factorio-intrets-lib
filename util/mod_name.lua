local mod_name = nil
local mod_namespace = nil

local function generate_names()
    local _, message = pcall(require, "123")

    mod_name = message:match("__(.-)__")
    mod_namespace = "__" .. mod_name .. "__"
end

function get_mod_name()
    if mod_name == nil then
        generate_names()
    end

    return mod_name
end

function get_mod_namespace()
    if mod_namespace == nil then
        generate_names()
    end

    return mod_namespace
end