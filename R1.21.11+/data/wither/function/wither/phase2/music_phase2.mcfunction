execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] as @e[type=minecraft:player,distance=..200] at @s run playsound minecraft:wither.phase2 record @a ~ ~ ~ 1 1

execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:wither/phase2/music_phase2 233s
