
local biter_die_effects = require("__base__.prototypes.entity.biter-die-effects")

table.insert(rtable.table_get_or_init_table(data.raw["entity-ghost"]["entity-ghost"], "created_effect"),
    {
        type = "direct",
        action_delivery =
        {
            type = "instant",
            target_effects =
            {
                {
                    type = "script",
                    effect_id = "workaround-ghost-built",
                },
            }
        }
    })

table.insert(rtable.table_get_or_init_table(data.raw["item-request-proxy"]["item-request-proxy"], "created_effect"),
    {
        type = "direct",
        action_delivery =
        {
            type = "instant",
            target_effects =
            {
                {
                    type = "script",
                    effect_id = "workaround-ghost-built",
                },
            }
        }
    })