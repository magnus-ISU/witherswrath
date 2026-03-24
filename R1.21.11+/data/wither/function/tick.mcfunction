
# Checks for alive wither every tick - ONLY if summoned by player with Bad Omen
execute as @e[type=minecraft:wither,tag=!theWither,tag=!normalWither,limit=1] at @s if entity @a[distance=..16,nbt={active_effects:[{id:"minecraft:bad_omen"}]}] run tag @s add justSummoned
execute as @e[type=minecraft:wither,tag=justSummoned,limit=1] at @s run function wither:wither/fight_once
# Tag normal withers (no Bad Omen nearby) so they're not re-checked
execute as @e[type=minecraft:wither,tag=!theWither,tag=!normalWither,tag=!justSummoned,limit=1] run tag @s add normalWither


# CHECKS HEALTH EVERY TICK (only for ominous withers)
execute at @p as @e[type=minecraft:wither,tag=theWither,limit=1,sort=nearest] store result score @s checkHealth run data get entity @s Health
execute at @p as @e[type=minecraft:wither,tag=theWither,limit=1,sort=furthest] store result score @s checkHealth run data get entity @s Health
execute as @e[type=wither,tag=theWither,limit=1,sort=nearest] store result score @s Health run data get entity @s Health


# WITHER CHECK
execute unless score witherCount witherCount matches 1.. run schedule clear wither:wither/phase2/charge/chargepre
execute unless score witherCount witherCount matches 1.. run schedule clear wither:wither/phase1/homing/homingpre
execute unless score witherCount witherCount matches 1.. run schedule clear wither:wither/passive/spawn


# WITHER HEALTH NEVER ABOVE HALF AFTER HITTING IT (only for ominous withers)

execute as @e[type=wither,tag=theWither,tag=!Wither] if score @s Health matches 298.. run data modify entity @s Health set value 298.0f
execute as @e[type=wither,tag=theWither,tag=!Dash] if score @s Health matches 100.. run data modify entity @s Health set value 98.0f
