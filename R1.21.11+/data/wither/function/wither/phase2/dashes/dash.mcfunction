tag @s remove Dash

# Don't dash during beam attack
execute if entity @e[type=wither,tag=ominousWither,tag=Beam] run return 0

execute if score reset wchargereset matches 0 unless entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=chargew] unless entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=wStand] run data merge entity @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] {NoAI: 1b}
execute if score reset wchargereset matches 0 unless entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=chargew] unless entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=wStand] run execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @e[type=player,limit=1,sort=nearest] feet

execute if score reset wchargereset matches 0 unless entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=chargew] unless entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=wStand] run function wither:wither/phase2/dashes/dash_to

schedule function wither:wither/phase2/dashes/end_loop 5t

execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:wither/phase2/dashes/dash 3s
