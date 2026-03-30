# Undo landing marker to wither, retry tick next game tick (different random skeleton)
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run tp @e[type=marker,tag=spellstormSwarmMarker,limit=1] ~ ~ ~
schedule function wither:wither/phase2/spellstorm/spellstorm_soul_tick 1t
tag @a remove spellstormTarget
tag @a remove spellstormGrounded
