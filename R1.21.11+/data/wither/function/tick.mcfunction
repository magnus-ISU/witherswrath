# Fight tick loop - started from ominous_init, runs only while a fight is active
# Reschedule only while the ominous wither is alive; naturally stops when fight ends
execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:tick 10t

# Health tracking for ominous wither
execute as @e[type=wither,tag=ominousWither,limit=1] store result score @s Health run data get entity @s Health

# Health caps - prevent healing above phase thresholds
execute as @e[type=wither,tag=ominousWither,tag=!Wither] if score @s Health matches 298.. run data modify entity @s Health set value 298.0f
execute as @e[type=wither,tag=ominousWither,tag=!Dash] if score @s Health matches 100.. run data modify entity @s Health set value 98.0f
