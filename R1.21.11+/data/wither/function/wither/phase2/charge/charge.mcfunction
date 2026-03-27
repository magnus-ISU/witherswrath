# Don't charge during beam attack
execute if entity @e[type=wither,tag=ominousWither,tag=Beam] run return 0

execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Team:"Wither",Tags: ["wStand"], Invisible: 1b, Invulnerable: 1b, NoBasePlate: 1b, NoGravity: 1b, Marker: 1b}
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] run tp @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=wStand] ^ ^ ^ facing entity @p feet

execute unless score enraged wenraged matches 1 run schedule function wither:wither/phase2/charge/charge2 1s
execute if score enraged wenraged matches 1 run schedule function wither:wither/phase2/charge/charge2 10t

