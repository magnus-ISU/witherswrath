execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s add WhiteShieldDive
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:1b}
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s add ProximityShieldSlam
execute at @e[type=wither,tag=ominousWither,limit=1] run function wither:wither/phase2/white_shield_burst
schedule function wither:wither/phase2/white_shield_slam 60t
