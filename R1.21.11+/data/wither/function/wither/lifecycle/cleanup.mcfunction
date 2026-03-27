team remove Wither
scoreboard players set wCharge wcharge1 1
scoreboard players set wspawn spawn 0
scoreboard players set wChargereset wchargereset 0
scoreboard players set enraged wenraged 0
scoreboard players set ominousWither divecooldown 0
tag @e[type=wither,tag=ominousWither] remove shieldActive
schedule clear wither:wither/dive/land

# Clear all fight schedules
schedule clear wither:wither/phase2/charge/charge
schedule clear wither:wither/phase2/charge/charge2
schedule clear wither:wither/phase2/charge/chargepre
schedule clear wither:wither/phase2/charge/chargetick
schedule clear wither:wither/phase2/charge/chargereset
schedule clear wither:wither/phase2/dashes/dash
schedule clear wither:wither/phase2/dashes/dashto
schedule clear wither:wither/phase2/dashes/endloop
schedule clear wither:wither/phase1/homing/homing
schedule clear wither:wither/phase1/homing/homingpre
schedule clear wither:wither/phase1/homing/homingtick
schedule clear wither:wither/phase1/homing/homing5tick
schedule clear wither:wither/phase1/musicphase1
schedule clear wither:wither/phase1/check_player_tick
schedule clear wither:wither/phase2/musicphase2
schedule clear wither:wither/phase2/enraged/skulls/killskulls
schedule clear wither:wither/phase2/enraged/skulls/skulls
schedule clear wither:wither/phase2/enraged/skulls/stopskulls
schedule clear wither:wither/phase2/enraged/skulls/rotation
schedule clear wither:wither/skull/launch
schedule clear wither:wither/skull/launch_end
schedule clear wither:wither/skull/burst/launch_burst_loop
schedule clear wither:wither/skull/burst/launch_burst_loop_reset
schedule clear wither:wither/passive/spawn
schedule clear wither:wither/passive/spawn_captain
schedule clear wither:wither/passive/skull
schedule clear wither:wither/phase2/beam/beampre
schedule clear wither:wither/phase2/beam/beamascend
schedule clear wither:wither/phase2/beam/beamaimtick
schedule clear wither:wither/phase2/beam/beamfire_left
schedule clear wither:wither/phase2/beam/beamfire_center
schedule clear wither:wither/phase2/beam/beamfire_right
schedule clear wither:wither/phase2/beam/beamend
schedule clear wither:wither/fight_start/part
schedule clear wither:wither/fight_start/init_ring_explode
schedule clear wither:wither/unstuck/check
schedule clear wither:wither/lifecycle/timeout

    schedule function wither:xp/xp 1t

# MUSIC
    execute as @a run stopsound @a record minecraft:wither.phase2
    execute at @e[type=item_display,tag=nether_star,limit=1] run playsound minecraft:wither.death hostile @a ~ ~ ~ 1 1
    execute at @e[type=item_display,tag=nether_star,limit=1] run playsound minecraft:ui.toast.challenge_complete player @a ~ ~ ~ 1 0.9
    execute at @e[type=item_display,tag=nether_star,limit=1] run playsound minecraft:music.creative music @a
    execute at @e[type=item_display,tag=nether_star,limit=1] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 100 .85

# PEACE
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=wither_skeleton,distance=..100]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[tag=wSkel]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[tag=wither_dash]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[tag=wArcher]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=zombie,distance=..80]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=creeper,distance=..80]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=armor_stand,tag=hStand,distance=..100]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=armor_stand,tag=chargew,distance=..100]
    kill @e[type=marker,tag=wSpawnMarker]
    kill @e[tag=beamCrystalL]
    kill @e[tag=beamCrystalC]
    kill @e[tag=beamCrystalR]
    kill @e[tag=beamTargetSide]
    kill @e[tag=beamTargetCenter]
    tag @a remove beamSideTarget
    tag @a remove beamCenterTarget

# Remove force-loaded chunks
forceload remove all
