# Smooth 1-tick rise loop for nether star displays placed from item frames
execute unless entity @e[type=item_display,tag=nether_star,tag=ns_rising] run return 0

execute as @e[type=item_display,tag=nether_star,tag=ns_rising] at @s run tp @s ~ ~0.025 ~
schedule function wither:nether_star/rise 1t
