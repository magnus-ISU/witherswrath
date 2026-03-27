# Beam Raycast - recursive step, 0.5 blocks per step
# Stops after 150 blocks (300 steps), or after penetrating 6 blocks of solid material
# Beam-proof blocks (obsidian, bedrock, etc.) stop the beam instantly with no explosion

# Beam-proof blocks stop instantly (no terminal creeper)
execute if block ~ ~ ~ #wither:beam_proof run return 0

# Track penetration through solid blocks (6 blocks = 12 steps at 0.5 blocks/step)
# Spawn terminal creepers inside solid blocks for extra destruction
execute unless block ~ ~ ~ #minecraft:replaceable run scoreboard players add #beam_penetration beamStep 1
execute unless block ~ ~ ~ #minecraft:replaceable run function wither:wither/phase2/beam/beamcreeper_terminal
execute if score #beam_penetration beamStep matches 12.. run return 0

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
