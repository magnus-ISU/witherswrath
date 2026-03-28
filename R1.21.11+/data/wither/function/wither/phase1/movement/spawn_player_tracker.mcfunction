# Spawn the shift marker at the nearest player to the wither
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon marker ~ ~ ~ {Tags:["shiftMarker"]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run tp @e[type=marker,tag=shiftMarker,limit=1] @p
