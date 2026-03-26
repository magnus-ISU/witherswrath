# Runs every 5t after skull placement until all withers are tagged
# Any wither that finishes invul without being converted is a normal wither
execute as @e[type=minecraft:wither,tag=!ominousWither,tag=!normalWither,nbt={Invul:0}] run tag @s add normalWither

# Convert untagged withers (still in invul) near a player with Bad Omen
execute as @e[type=minecraft:wither,tag=!ominousWither,tag=!normalWither] at @s unless entity @e[type=wither,tag=ominousWither] if entity @a[distance=..32,nbt={active_effects:[{id:"minecraft:bad_omen"}]}] run function wither:wither/ominous_init

# Keep checking while any untagged wither exists
execute if entity @e[type=minecraft:wither,tag=!ominousWither,tag=!normalWither] run schedule function wither:wither/ominous_check 5t
