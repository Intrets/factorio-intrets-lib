require("util.table")

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

data:extend({
    {
        type = "custom-input",
        name = "reload-script-controls",
        key_sequence = "F7",
        consuming = "game-only",
    },
    {
        type = "custom-input",
        name = "run-reset-test",
        key_sequence = "F8",
        consuming = "game-only",
    },
    {
        type = "custom-input",
        name = "toggle-debug-catch-all-events",
        key_sequence = "F10",
        consuming = "game-only",
    }
})
