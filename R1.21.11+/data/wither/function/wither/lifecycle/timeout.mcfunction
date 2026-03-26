# 20-minute fight timeout - despawn the wither if it's still alive
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run function wither:wither/lifecycle/despawn
