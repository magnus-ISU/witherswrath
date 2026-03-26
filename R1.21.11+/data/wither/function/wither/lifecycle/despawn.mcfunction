# Despawn wither when no players are within 150 blocks - executed as and at the wither
# Prevent normal death sequence from triggering
scoreboard players set witherCheck witherCheck 0

# Clear weather
weather clear

# Sphere explosion (same as initial spawn)
function wither:wither/fight_start/init_sphere_summons

# Remove the wither without loot
tp @s ~ -200 ~
kill @s

# Clean up the fight
function wither:wither/fix
