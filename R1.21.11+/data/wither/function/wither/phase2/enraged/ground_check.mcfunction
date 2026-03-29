# Every 10 seconds during phase 3 or proximity-shield melee, check if wither is >20 blocks above ground
execute as @e[type=wither,tag=ominousWither,tag=Phase3,tag=!Slamming,tag=!Diving,limit=1] at @s run scoreboard players set #raycast stages 0
execute as @e[type=wither,tag=ominousWither,tag=Phase3,tag=!Slamming,tag=!Diving,limit=1] at @s positioned ~ ~-1 ~ run function wither:wither/dive/raycast_down

execute as @e[type=wither,tag=ominousWither,tag=ProximityShield,tag=!Slamming,tag=!Diving,limit=1] at @s run scoreboard players set #raycast stages 0
execute as @e[type=wither,tag=ominousWither,tag=ProximityShield,tag=!Slamming,tag=!Diving,limit=1] at @s positioned ~ ~-1 ~ run function wither:wither/dive/raycast_down

# Reschedule while phase 3 or proximity shield is active
execute if entity @e[type=wither,tag=ominousWither,tag=Phase3] run schedule function wither:wither/phase2/enraged/ground_check 200t
execute if entity @e[type=wither,tag=ominousWither,tag=ProximityShield] run schedule function wither:wither/phase2/enraged/ground_check 200t
