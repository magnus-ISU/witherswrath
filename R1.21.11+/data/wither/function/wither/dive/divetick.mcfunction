execute if score ominousWither divecooldown matches 2..12 run scoreboard players remove ominousWither divecooldown 1
execute if score ominousWither divecooldown matches 2..12 run schedule function wither:wither/dive/divetick 1t
execute if score ominousWither divecooldown matches 1 run schedule function wither:wither/dive/divecooldown 1t

execute if score ominousWither divecooldown matches 3..12 as @e[type=wither,tag=ominousWither,limit=1] at @s run tp @s ~ ~-2.5 ~
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run particle poof ~ ~ ~ 0.5 0.5 0.5 0.1 20 normal
execute if score ominousWither divecooldown matches 2 run schedule function wither:wither/dive/land 1t
