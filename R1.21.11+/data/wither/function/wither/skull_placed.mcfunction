# Triggered by advancement when a player places a wither skeleton skull
# Revoke immediately so it can fire again on the next placement
advancement revoke @s only wither:wither/skull_placed

# Check 5 ticks later - wither spawns after its 3-skull structure is completed
schedule function wither:wither/ominous_check 5t
