# Descend until wither reaches nearest player's Y level
# Tag wither if still 2+ blocks above a player within 5 horizontal blocks
execute as @e[type=wither,tag=ominousWither,limit=1] at @s positioned ~ ~-300 ~ if entity @a[dx=10,dy=298,dz=10] run tag @s add diving

# If still above player, descend
execute as @e[type=wither,tag=ominousWither,tag=diving,limit=1] at @s run tp @s ~ ~-2.5 ~
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run particle poof ~ ~ ~ 0.5 0.5 0.5 0.1 20 normal

# If still diving, schedule next tick
execute if entity @e[type=wither,tag=ominousWither,tag=diving] run schedule function wither:wither/dive/divetick 1t

# If reached player level, land
execute as @e[type=wither,tag=ominousWither,tag=!diving,limit=1] run function wither:wither/dive/land
execute unless entity @e[type=wither,tag=ominousWither,tag=diving] run schedule function wither:wither/dive/divecooldown 1t

# Clean up tag
tag @e[type=wither,tag=ominousWither] remove diving
