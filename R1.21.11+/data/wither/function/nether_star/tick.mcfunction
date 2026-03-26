# Stop if no display entities exist
execute unless entity @e[type=item_display,tag=nether_star] run return 0

# Rotate display (vehicle) and apply particles
execute as @e[type=item_display,tag=nether_star] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[type=item_display,tag=nether_star] at @s run particle end_rod ^0 ^0.3 ^0.75 0 0 0 0 2 normal
execute as @e[type=item_display,tag=nether_star] at @s run particle electric_spark ~ ~0.8 ~ 0.01 0 0.01 1 2 normal
execute as @e[type=item_display,tag=nether_star] at @s run particle end_rod ^0 ^1.4 ^0.75 0 0 0 0 2 normal
execute as @e[type=item_display,tag=nether_star] at @s if block ^ ^-1 ^ #air run tp ~ ~-.005 ~

# Clean up orphaned displays (item passenger was picked up)
tag @e[type=item_display,tag=nether_star] add ns_orphaned
execute as @e[type=item,tag=OminousNetherStar] on vehicle run tag @s[type=item_display,tag=nether_star] remove ns_orphaned
kill @e[type=item_display,tag=ns_orphaned]

schedule function wither:nether_star/tick 4t
