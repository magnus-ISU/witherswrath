# Fight tick loop - started from ominous_init, runs only while a fight is active
# Reschedule only while the ominous wither is alive; naturally stops when fight ends
execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:tick 10t

# Health tracking for ominous wither
execute as @e[type=wither,tag=ominousWither,limit=1] store result score @s Health run data get entity @s Health

# Health caps - prevent healing above phase thresholds
execute as @e[type=wither,tag=ominousWither,tag=!Wither] if score @s Health matches 298.. run data modify entity @s Health set value 298.0f
execute as @e[type=wither,tag=ominousWither,tag=!Dash] if score @s Health matches 100.. run data modify entity @s Health set value 98.0f

# wArcher shield: while any wArcher is alive, keep the Ominous Wither immune and glowing
execute if entity @e[type=wither_skeleton,tag=wArcher] run data merge entity @e[type=wither,tag=ominousWither,limit=1] {active_effects:[{id:"minecraft:resistance",amplifier:4,duration:-1,show_particles:0b}],Glowing:1b}

# When all wArchers are dead, kill their phantom mounts and lift the shield
execute unless entity @e[type=wither_skeleton,tag=wArcher] if entity @e[type=phantom,tag=wArcher] run kill @e[type=phantom,tag=wArcher]
execute unless entity @e[type=wither_skeleton,tag=wArcher] if entity @e[type=phantom,tag=wArcher] run effect clear @e[type=wither,tag=ominousWither] resistance
execute unless entity @e[type=wither_skeleton,tag=wArcher] if entity @e[type=phantom,tag=wArcher] run data merge entity @e[type=wither,tag=ominousWither,limit=1] {Glowing:0b}
