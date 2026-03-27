# If there is no player to dive towards, remove the Diving tag
execute as @e[type=wither,tag=ominousWither,limit=1] at @s positioned ~-10 ~-300 ~-10 unless entity @a[dx=20,dy=298,dz=20] run tag @s remove Diving

# Land if we aren't diving
execute as @e[type=wither,tag=ominousWither,tag=!Diving,limit=1] run function wither:wither/dive/land

# Descend and emit particles while still diving
execute as @e[type=wither,tag=ominousWither,tag=Diving,limit=1] at @s run tp @s ~ ~-2.5 ~
execute as @e[type=wither,tag=ominousWither,tag=Diving,limit=1] at @s run particle poof ~ ~ ~ 0.5 0.5 0.5 0.1 20 normal

# Schedule next tick if still diving
execute if entity @e[type=wither,tag=ominousWither,tag=Diving] run schedule function wither:wither/dive/divetick 1t
