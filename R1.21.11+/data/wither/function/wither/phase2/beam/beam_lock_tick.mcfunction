# Teleport beam-targeted players to their locked positions every tick
execute at @e[type=marker,tag=beamLock1,limit=1] run tp @a[tag=beamTarget1,limit=1] ~ ~ ~
execute at @e[type=marker,tag=beamLock2,limit=1] run tp @a[tag=beamTarget2,limit=1] ~ ~ ~
execute at @e[type=marker,tag=beamLock3,limit=1] run tp @a[tag=beamTarget3,limit=1] ~ ~ ~

# Continue while beam is active
execute if entity @e[type=wither,tag=ominousWither,tag=Beam] run schedule function wither:wither/phase2/beam/beam_lock_tick 1t
