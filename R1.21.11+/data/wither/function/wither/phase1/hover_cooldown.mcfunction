# Remove Hovering tag after 5 second cooldown, allowing the wither to be mounted again
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s remove Hovering
