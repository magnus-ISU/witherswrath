# Despawn wither when no players are within 150 blocks - executed as and at the wither
# Prevent normal death sequence from triggering

# Clear weather
weather clear

# Sphere explosion (same as initial spawn)
function wither:wither/fight_start/arrival_explosion_start

# Remove the wither without loot
tp @s ~ -200 ~
kill @s

# Clean up the fight
function wither:wither/fix
