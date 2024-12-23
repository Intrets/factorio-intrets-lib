require("mod_name")

local function load_picture(name, picture_name)
    local full_name = get_mod_namespace() .. "/graphics/" .. name .. "/" .. picture_name
    local image_name = full_name .. ".png"
    local size_name = full_name .. ".lua"
    local size = require(size_name)
    size.filename = image_name
    return size
end

rpicture = {
    load_picture = load_picture
}