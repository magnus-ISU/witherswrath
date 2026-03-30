# spellstormWorking = skeleton to move; nearest player to Ominous Wither = anchor
execute at @e[type=wither,tag=ominousWither,limit=1] as @a[sort=nearest,limit=1,distance=..512] run tag @s add spellstormTarget
execute unless entity @a[tag=spellstormTarget,limit=1] run return 0

scoreboard players set .pGround spellstormTmp 0
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-1 ~ #minecraft:air run scoreboard players set .pGround spellstormTmp 1
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-2 ~ #minecraft:air run scoreboard players set .pGround spellstormTmp 1
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-3 ~ #minecraft:air run scoreboard players set .pGround spellstormTmp 1

execute if score .pGround spellstormTmp matches 0 run schedule function wither:wither/phase2/spellstorm_soul_tick 9t
execute if score .pGround spellstormTmp matches 0 run return 0

execute unless entity @e[type=marker,tag=spellstormSwarmMarker,limit=1] at @e[type=wither,tag=ominousWither,limit=1] run summon marker ~ ~ ~ {Tags:["spellstormSwarmMarker"]}

execute as @a[tag=spellstormTarget,limit=1] at @s run tp @e[type=marker,tag=spellstormSwarmMarker,limit=1] ~ ~ ~
execute as @e[type=marker,tag=spellstormSwarmMarker,limit=1] at @s run spreadplayers ~ ~ 0 8 false @s
execute as @a[tag=spellstormTarget,limit=1] run data modify entity @e[type=marker,tag=spellstormSwarmMarker,limit=1] Pos[1] set from entity @s Pos[1]

execute as @e[type=marker,tag=spellstormSwarmMarker,limit=1] at @s run function wither:wither/phase2/spellstorm_cave_adjust

scoreboard players set .pGround2 spellstormTmp 0
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-1 ~ #minecraft:air run scoreboard players set .pGround2 spellstormTmp 1
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-2 ~ #minecraft:air run scoreboard players set .pGround2 spellstormTmp 1
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-3 ~ #minecraft:air run scoreboard players set .pGround2 spellstormTmp 1

execute if score .pGround2 spellstormTmp matches 1 at @e[type=marker,tag=spellstormSwarmMarker,limit=1] run summon minecraft:lightning_bolt ~ ~ ~
execute if score .pGround2 spellstormTmp matches 0 at @a[tag=spellstormTarget,limit=1] run summon minecraft:lightning_bolt ~ ~ ~
execute if score .pGround2 spellstormTmp matches 0 run schedule function wither:wither/phase2/spellstorm_soul_tick 5s

execute at @e[type=marker,tag=spellstormSwarmMarker,limit=1] as @e[type=wither_skeleton,tag=spellstormWorking,limit=1] run tp @s ~ ~ ~
