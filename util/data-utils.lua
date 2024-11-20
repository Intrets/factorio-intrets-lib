require("mod_name")
require("util.picture")

local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local function process_args(result, name, args, defaults)
    for key, value in pairs(args) do
        result[key] = value
    end

    if args ~= nil then
        for key, default_value in pairs(defaults) do
            if args[key] == nil then
                if type(default_value) == "function" then
                    result[key] = default_value(name)
                else
                    result[key] = default_value
                end
            else
                result[key] = args[key]
            end
        end
    else
        for key, default_value in pairs(defaults) do
            if type(default_value) == "function" then
                result[key] = default_value(name)
            else
                result[key] = default_value
            end
        end
    end

    return result
end

local default_item_values = {
    ["subgroup"] = "storage",
    ["order"] = function(name) return "b[" .. name .. "]" end,
    ["inventory_move_sound"] = item_sounds.metal_small_inventory_move,
    ["pick_sound"] = item_sounds.metal_small_inventory_pickup,
    ["drop_sound"] = item_sounds.metal_small_inventory_move,
    ["place_result"] = function(name) return name end,
    ["stack_size"] = 20,
    ["default_import_location"] = "nauvis",
    ["random_tint_color"] = item_tints.iron_rust,
}

function make_item(args)
    local item = {
        type = "item",
        name = args.name,
        icon = get_mod_namespace() .. "/graphics/" .. args.name .. "/icon.png",
    }

    return process_args(item, args.name, args, default_item_values)
end

local default_entity_values = {
    flags = { "placeable-neutral", "player-creation" },
    minable = function(name) return { mining_time = 0.1, result = name } end,
    max_health = 150,
    damaged_trigger_effect = hit_effects.entity(),
    picture = function(name) return rpicture.load_picture(name, "sprite") end,
}

function make_entity(args)
    local item = {
        type = args.prototype,
        name = args.name,
        icon = get_mod_namespace() .. "/graphics/" .. args.name .. "/icon.png",
    }

    return process_args(item, args.name, args, default_entity_values)
end

local default_recipe_values = {
}

function make_recipe(args)
    local recipe = {
        type = "recipe",
        name = args.name,
    }

    return process_args(recipe, args.name, args, default_recipe_values)
end
