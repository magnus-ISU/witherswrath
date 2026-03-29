# Ran by advancements for attacking the Wither
advancement revoke @s only wither:wither/hit6_wither

execute unless data storage wither:options {toggleanimation:Default} run return 0

execute as @e[type=wither,tag=ominousWither,scores={Health=101..150},tag=!ProximityShield,tag=!WhiteShieldDive] run function wither:wither/phase2/white_shield_dive

execute unless entity @e[type=wither,tag=ominousWither,tag=ProximityShield] run return 0
execute unless entity @e[type=wither,tag=ominousWither,tag=ProximityShieldDown] run return 0

execute as @e[type=wither,tag=ominousWither] at @s run function wither:wither/phase2/swarm
