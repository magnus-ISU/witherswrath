execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s add ProximityShield
execute as @e[type=wither,tag=ominousWither,limit=1] run attribute @s minecraft:gravity base set 100
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s remove WhiteShieldDive
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:0b}
schedule function wither:wither/phase2/enraged/ground_check 200t
