require("util.table")

function prototype_get_created_script_trigger(trigger_name)
    return {
        type = "direct",
        action_delivery =
        {
            type = "instant",
            target_effects =
            {
                {
                    type = "script",
                    effect_id = trigger_name,
                },
            }
        }
    }
end

function prototype_add_created_script_trigger(prototype, trigger_name)
    table.insert(rtable.table_get_or_init_table(prototype, "created_effect"), prototype_get_created_script_trigger(trigger_name))
end
