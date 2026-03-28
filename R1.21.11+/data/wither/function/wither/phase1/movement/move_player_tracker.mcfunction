# Move marker to nearest player (to the wither) if player has moved >8 blocks from it
execute at @e[type=marker,tag=shiftMarker,limit=1] if entity @a[distance=..8] run return 0
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run tp @e[type=marker,tag=shiftMarker,limit=1] @p
execute as @e[type=marker,tag=shiftMarker,limit=1] at @s run spreadplayers ~ ~ 0 2 false @s
# Restore marker Y to player's actual Y (spreadplayers snaps to ground)
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run data modify entity @e[type=marker,tag=shiftMarker,limit=1] Pos[1] set from entity @p Pos[1]
