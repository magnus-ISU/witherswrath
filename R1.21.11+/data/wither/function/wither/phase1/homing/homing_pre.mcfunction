execute if entity @e[type=wither,tag=ominousWither,scores={Health=..599}] unless entity @e[limit=1,sort=nearest,tag=hStand,type=minecraft:armor_stand] if data storage wither:options {togglehoming:Enabled} run function wither:wither/phase1/homing/homing
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..599}] if entity @e[limit=1,sort=nearest,tag=hStand,type=minecraft:armor_stand] if data storage wither:options {togglehoming:Enabled} run schedule function wither:wither/phase1/homing/homing_tick 1t

execute unless score enraged wenraged matches 1 run schedule function wither:wither/phase1/homing/homing_pre 20s
execute if score enraged wenraged matches 1 run schedule function wither:wither/phase1/homing/homing_pre 10s
