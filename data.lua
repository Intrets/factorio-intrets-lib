require("util.table")

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
