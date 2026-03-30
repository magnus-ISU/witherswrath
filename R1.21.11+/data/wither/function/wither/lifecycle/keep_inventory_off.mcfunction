execute if entity @e[type=minecraft:wither,tag=ominousWither] run return 0
gamerule keep_inventory false
schedule clear wither:wither/lifecycle/keep_inventory_tick
schedule clear wither:wither/lifecycle/keep_inventory_off
