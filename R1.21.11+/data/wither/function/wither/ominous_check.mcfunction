# Called 5t after a wither skull is placed
# If the new wither is near a player with Bad Omen, start the ominous fight; otherwise tag as normal
execute as @e[type=minecraft:wither,tag=!ominousWither,tag=!normalWither,limit=1] at @s unless entity @e[type=wither,tag=ominousWither] if entity @a[distance=..16,nbt={active_effects:[{id:"minecraft:bad_omen"}]}] run function wither:wither/ominous_init
execute as @e[type=minecraft:wither,tag=!ominousWither,tag=!normalWither,limit=1] run tag @s add normalWither
