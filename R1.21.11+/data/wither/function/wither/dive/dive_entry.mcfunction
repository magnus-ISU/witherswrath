# Aerial dive: wither >12 blocks above a player and within 5 blocks horizontal (same volume as before)
execute at @s positioned ~-5 ~-300 ~-5 if entity @a[dx=10,dy=288,dz=10] run function wither:wither/dive/dive
