# Wither detection - runs every 10 ticks via schedule
# Reschedule self
schedule function wither:tick 10t

# Detect new withers (no ominousWither or normalWither tag yet)
# If ominousWither already exists OR no Bad Omen player nearby → make it normalWither
# If no ominousWither exists AND Bad Omen player nearby → start ominous fight
execute as @e[type=minecraft:wither,tag=!ominousWither,tag=!normalWither,limit=1] at @s unless entity @e[type=wither,tag=ominousWither] if entity @a[distance=..16,nbt={active_effects:[{id:"minecraft:bad_omen"}]}] run function wither:wither/ominous_init
execute as @e[type=minecraft:wither,tag=!ominousWither,tag=!normalWither,limit=1] run tag @s add normalWither


# Health tracking for ominous wither
execute as @e[type=wither,tag=ominousWither,limit=1] store result score @s Health run data get entity @s Health

# Clear schedules if no ominous wither exists
execute unless entity @e[type=wither,tag=ominousWither] run schedule clear wither:wither/phase2/charge/chargepre
execute unless entity @e[type=wither,tag=ominousWither] run schedule clear wither:wither/phase1/homing/homingpre
execute unless entity @e[type=wither,tag=ominousWither] run schedule clear wither:wither/passive/spawn

# Health caps - prevent healing above phase thresholds
execute as @e[type=wither,tag=ominousWither,tag=!Wither] if score @s Health matches 298.. run data modify entity @s Health set value 298.0f
execute as @e[type=wither,tag=ominousWither,tag=!Dash] if score @s Health matches 100.. run data modify entity @s Health set value 98.0f
