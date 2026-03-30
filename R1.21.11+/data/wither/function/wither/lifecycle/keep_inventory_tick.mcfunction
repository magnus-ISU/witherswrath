schedule function wither:wither/lifecycle/keep_inventory_tick 500t
execute unless entity @e[type=minecraft:wither,tag=ominousWither] run schedule clear wither:wither/lifecycle/keep_inventory_off
execute unless entity @e[type=minecraft:wither,tag=ominousWither] run schedule function wither:wither/lifecycle/keep_inventory_off 200t
