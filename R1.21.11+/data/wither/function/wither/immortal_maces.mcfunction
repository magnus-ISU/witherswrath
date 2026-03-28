# Protect maces and elytra near the wither from despawning/damage every tick
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run function wither:wither/immortal_maces_tick

# Continue while fight is active
execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:wither/immortal_maces 1t
