# Recursive raycast downward - checks if wither is >20 blocks above ground
# Hit solid ground - wither is close enough, do nothing
execute unless block ~ ~ ~ minecraft:air run return 0

scoreboard players add #raycast stages 1

# If >20 blocks of air below wither, trigger ground slam
execute if score #raycast stages matches 21.. run function wither:wither/dive/ground_slam
execute if score #raycast stages matches 21.. run return 0

# Continue raycast downward
execute positioned ~ ~-1 ~ run function wither:wither/dive/raycast_down
