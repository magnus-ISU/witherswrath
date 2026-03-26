# Fight tick loop - started from ominous_init, runs only while a fight is active
# Reschedule only while the ominous wither is alive; naturally stops when fight ends
execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:tick 10t

# Health tracking for ominous wither
execute as @e[type=wither,tag=ominousWither,limit=1] store result score @s Health run data get entity @s Health

# Health caps - prevent healing above phase thresholds
execute as @e[type=wither,tag=ominousWither,tag=!Wither] if score @s Health matches 298.. run data modify entity @s Health set value 298.0f
execute as @e[type=wither,tag=ominousWither,tag=!Dash] if score @s Health matches 100.. run data modify entity @s Health set value 98.0f

# wArcher shield: while any wArcher is alive, keep the Ominous Wither immune and glowing
execute if entity @e[type=wither_skeleton,tag=wArcher] run data merge entity @e[type=wither,tag=ominousWither,limit=1] {Health:298.0f,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:-1,show_particles:0b}],Glowing:1b}

# When all wArchers are dead, kill their phantom mounts and lift the shield
execute unless entity @e[type=wither_skeleton,tag=wArcher] if entity @e[type=phantom,tag=wArcher] run kill @e[type=phantom,tag=wArcher]
execute unless entity @e[type=wither_skeleton,tag=wArcher] run effect clear @e[type=wither,tag=ominousWither] resistance
execute unless entity @e[type=wither_skeleton,tag=wArcher] run data merge entity @e[type=wither,tag=ominousWither,limit=1] {Glowing:0b}

# Teleport wither above player if they're 128-150 blocks away
execute at @e[type=wither,tag=ominousWither,limit=1] unless entity @a[distance=..128] as @a[distance=128..150,sort=nearest,limit=1] at @s run tp @e[type=wither,tag=ominousWither,limit=1] ~ ~30 ~

# Aerial dive: if wither is >20 blocks above a player and within 5 blocks horizontal, slam down
execute if score ominousWither divecooldown matches 0 as @e[type=wither,tag=ominousWither,limit=1] at @s positioned ~-5 ~-300 ~-5 if entity @a[dx=10,dy=280,dz=10] run function wither:wither/dive/dive

# Force chunk load the ominous wither
execute at @e[type=wither,tag=ominousWither,limit=1] run forceload add ~ ~

# Destroy nether portals in a 3x3x3 around all players within 150 blocks of the wither
execute at @e[type=wither,tag=ominousWither,limit=1] as @a[distance=..150] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace nether_portal
