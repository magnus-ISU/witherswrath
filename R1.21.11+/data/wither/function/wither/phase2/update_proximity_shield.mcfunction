# execute as @e[type=wither,tag=ominousWither,tag=ProximityShield,limit=1] at @s if entity @a[distance=..16] run tag @s add ProximityShieldDown
execute as @e[type=wither,tag=ominousWither,tag=ProximityShield,limit=1] at @s unless entity @a[distance=..16] run function wither:wither/phase2/proximity_shield_up
execute as @e[type=wither,tag=ominousWither,tag=ProximityShield,limit=1] at @s unless entity @a[distance=..16] run schedule function wither:wither/phase2/proximity_shield_down 30t
