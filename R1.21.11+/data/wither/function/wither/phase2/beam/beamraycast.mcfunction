# Beam Raycast - recursive step, 0.5 blocks per step
# Stops at solid blocks or after 150 blocks (300 steps)

# Stop at solid blocks - spawn terminal creeper
execute unless block ~ ~ ~ #minecraft:replaceable run function wither:wither/phase2/beam/beamcreeper_terminal
execute unless block ~ ~ ~ #minecraft:replaceable run return 0

# Safety limit - spawn terminal creeper
scoreboard players add #beam_steps beamStep 1
execute if score #beam_steps beamStep matches 300.. run function wither:wither/phase2/beam/beamcreeper_terminal
execute if score #beam_steps beamStep matches 300.. run return 0

# Spawn creeper every 6 steps (= 3 blocks)
scoreboard players add #beam_spacing beamStep 1
execute if score #beam_spacing beamStep matches 6.. run function wither:wither/phase2/beam/beamcreeper
execute if score #beam_spacing beamStep matches 6.. run scoreboard players set #beam_spacing beamStep 0

# Step forward 0.5 blocks and recurse
execute positioned ^ ^ ^0.5 run function wither:wither/phase2/beam/beamraycast
