scoreboard objectives remove Health
scoreboard objectives remove wcharge1
scoreboard objectives remove checkHealth
scoreboard objectives remove wticktime
scoreboard objectives remove wchargereset
scoreboard objectives remove wenraged
scoreboard objectives remove skullposX
scoreboard objectives remove skullposY
scoreboard objectives remove skullposZ
scoreboard objectives remove playerposX
scoreboard objectives remove playerposY
scoreboard objectives remove playerposZ
scoreboard objectives remove skulllaunchmotX
scoreboard objectives remove skulllaunchmotY
scoreboard objectives remove skulllaunchmotZ
scoreboard objectives remove burstcount
scoreboard objectives remove spawn
scoreboard objectives remove playerCount
scoreboard objectives remove wither.temp.x
scoreboard objectives remove wither.temp.y
scoreboard objectives remove wither.temp.z
scoreboard objectives remove wither.temp.px
scoreboard objectives remove wither.temp.py
scoreboard objectives remove wither.temp.pz
scoreboard objectives remove fightInitAge
scoreboard objectives remove beamTimer
scoreboard objectives remove beamStep

scoreboard objectives remove rules
scoreboard objectives remove stages

team remove Wither

advancement revoke @a only wither:wither/defeated_skeleton
advancement revoke @a only wither:wither/defeated_wither
advancement revoke @a only wither:wither/skull_placed
advancement revoke @a only wither:wither/hit_wither
advancement revoke @a only wither:wither/hit2_wither
advancement revoke @a only wither:wither/hit3_wither
advancement revoke @a only wither:wither/hit4_wither
advancement revoke @a only wither:wither/hit5_wither
advancement revoke @a only wither:wither/hit6_wither
advancement revoke @a only wither:wither/hit7_wither
advancement revoke @a only wither:wither/pre_hit_wither
advancement revoke @a only wither:wither/placed_star_in_frame

schedule clear wither:wither/phase1/check_player_tick
schedule clear wither:wither/skull/launch
schedule clear wither:wither/phase1/music_phase1
schedule clear wither:wither/phase2/music_phase2
schedule clear wither:wither/phase2/charge/charge
schedule clear wither:wither/phase2/charge/charge2
schedule clear wither:wither/phase2/charge/charge_pre
schedule clear wither:wither/phase2/charge/charge_tick
schedule clear wither:wither/phase2/charge/charge_reset
schedule clear wither:wither/phase2/beam/beam_pre
schedule clear wither:wither/phase2/beam/beam_ascend
schedule clear wither:wither/phase2/beam/beam_aim_tick
schedule clear wither:wither/phase2/beam/beam_fire_left
schedule clear wither:wither/phase2/beam/beam_fire_center
schedule clear wither:wither/phase2/beam/beam_fire_right
schedule clear wither:wither/phase2/beam/beam_end
schedule clear wither:wither/phase2/dashes/dash
schedule clear wither:wither/phase2/dashes/dash_to
schedule clear wither:wither/phase2/dashes/end_loop
schedule clear wither:wither/phase1/homing/homing
schedule clear wither:wither/phase1/homing/homing_pre
schedule clear wither:wither/phase1/homing/homing_tick
schedule clear wither:wither/phase1/homing/homing_5tick
schedule clear wither:wither/phase2/enraged/skulls/skulls
schedule clear wither:wither/phase2/enraged/skulls/stop_skulls
schedule clear wither:wither/phase2/enraged/skulls/rotation
schedule clear wither:wither/phase2/enraged/skulls/kill_skulls
schedule clear wither:wither/phase2/enraged/skulls/1
schedule clear wither:wither/phase2/enraged/skulls/2
schedule clear wither:wither/phase2/enraged/skulls/3
schedule clear wither:wither/skull/launch_end
schedule clear wither:wither/skull/burst/launch_burst_loop
schedule clear wither:wither/skull/burst/launch_burst_loop_reset
schedule clear wither:wither/unstuck/check
schedule clear wither:wither/lifecycle/timeout
schedule clear wither:wither/phase1/hover_cooldown
schedule clear wither:wither/phase1/movement/spawn_player_tracker
schedule clear wither:wither/fight_start/part
schedule clear wither:wither/fight_start/tick
schedule clear wither:wither/fight_start/bedrock
schedule clear wither:wither/fight_start/init
schedule clear wither:wither/fight_start/init_ring_explode
schedule clear wither:wither/fight_start/arrival_explosion_tick2
schedule clear wither:wither/fight_start/arrival_explosion_clear
schedule clear wither:wither/dive/dive_explosion_tick2
schedule clear wither:wither/dive/dive_explosion_clear
schedule clear wither:wither/lifecycle/spawn
schedule clear wither:wither/midpoint/midpoint2
schedule clear wither:wither/midpoint/midpoint_tick
schedule clear wither:wither/midpoint/midpoint_part_tick
schedule clear wither:wither/midpoint/midpoint_bedrock
schedule clear wither:wither/midpoint/midpoint_end
schedule clear wither:wither/midpoint/midpoint_ground
schedule clear wither:wither/midpoint/spawns/blaze1
schedule clear wither:wither/midpoint/spawns/blaze2
schedule clear wither:wither/midpoint/spawns/blaze3
schedule clear wither:wither/midpoint/spawns/blaze4
schedule clear wither:wither/midpoint/spawns/blaze5
schedule clear wither:wither/midpoint/spawns/blaze6
schedule clear wither:wither/midpoint/spawns/blaze7
schedule clear wither:wither/midpoint/spawns/blaze8
schedule clear wither:wither/midpoint/spawns/blaze9
schedule clear wither:wither/midpoint/spawns/blaze10
schedule clear wither:wither/midpoint/spawns/blaze11
schedule clear wither:wither/midpoint/spawns/blaze12
schedule clear wither:wither/midpoint/spawns/blaze13
schedule clear wither:wither/midpoint/spawns/blaze14
schedule clear wither:wither/midpoint/spawns/blaze15
schedule clear wither:wither/midpoint/spawns/blaze16
schedule clear wither:wither/midpoint/spawns/blaze17
schedule clear wither:wither/midpoint/spawns/blaze18
schedule clear wither:wither/midpoint/spawns/blaze19
schedule clear wither:wither/midpoint/spawns/blaze20
schedule clear wither:wither/midpoint/spawns/blaze21
schedule clear wither:wither/midpoint/spawns/blaze22
schedule clear wither:wither/midpoint/spawns/blaze23
schedule clear wither:wither/midpoint/spawns/blaze24
schedule clear wither:wither/midpoint/spawns/blaze25
schedule clear wither:wither/midpoint/spawns/blaze26
schedule clear wither:wither/midpoint/spawns/blaze27
schedule clear wither:wither/midpoint/spawns/blaze28
schedule clear wither:wither/midpoint/spawns/blaze29
schedule clear wither:wither/midpoint/spawns/blaze30
schedule clear wither:wither/midpoint/particles/down1
schedule clear wither:wither/midpoint/particles/down2
schedule clear wither:wither/midpoint/particles/down3
schedule clear wither:wither/midpoint/particles/down4
schedule clear wither:wither/midpoint/particles/down5
schedule clear wither:wither/midpoint/particles/clear_lev
schedule clear wither:wither/passive/skull
schedule clear wither:wither/passive/spawn
schedule clear wither:wither/passive/spawn_captain
schedule clear wither:tick
schedule clear wither:wither/ominous_check
schedule clear wither:5_tick
schedule clear wither:wither/phase2/spellstorm/spellstorm_soul_tick
schedule clear wither:xp/xp
schedule clear wither:xp/xp1
schedule clear wither:xp/xp2
schedule clear wither:xp/xp3
schedule clear wither:xp/xp4
schedule clear wither:xp/xp5
schedule clear wither:xp/xp6
schedule clear wither:xp/xp7
schedule clear wither:xp/xp8
schedule clear wither:xp/xp9
schedule clear wither:xp/xp10
schedule clear wither:nether_star/stop_rising
schedule clear wither:nether_star/rise
schedule clear wither:wither/phase2/white_shield_slam
schedule clear wither:wither/phase2/proximity_shield_down
schedule clear wither:wither/phase2/init_proximity_shield

data remove storage temp Head


stopsound @a record

kill @e[type=armor_stand,tag=wither_spin]
kill @e[type=armor_stand,tag=wither_stasis]
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run tp @s ~ -200 ~
kill @e[type=wither,tag=ominousWither,limit=1]
kill @e[type=wither_skull]
kill @e[type=item_display,tag=nether_star]
kill @e[type=item,tag=OminousNetherStar]
kill @e[tag=wither_dash]
kill @e[tag=wSkel]
kill @e[tag=wArcher]
kill @e[type=armor_stand,tag=hStand]
kill @e[type=armor_stand,tag=starxp]
kill @e[type=armor_stand,tag=chargew]
kill @e[type=armor_stand,tag=midpointpos]
kill @e[type=armor_stand,tag=ArrivalExplosionAnchor]
kill @e[type=armor_stand,tag=DiveExplosionAnchor]
tag @a remove ClearResistance
kill @e[tag=beamCrystalL]
kill @e[tag=beamCrystalC]
kill @e[tag=beamCrystalR]
kill @e[tag=beamTargetLeft]
kill @e[tag=beamTargetRight]
kill @e[tag=beamTargetCenter]
tag @a remove beamTarget1
tag @a remove beamTarget2
tag @a remove beamTarget3
kill @e[type=marker,tag=wSpawnMarker]
kill @e[type=marker,tag=shiftMarker]
kill @e[type=marker,tag=spellstormSwarmMarker]
ride @e[type=wither,tag=ominousWither,limit=1] dismount
kill @e[type=armor_stand,tag=witherMount]
execute at @e[type=item,tag=OminousNetherStar,limit=1] run kill @e[type=experience_orb,sort=nearest,distance=..10]

execute as @e[type=player] run attribute @s minecraft:gravity modifier remove 1

forceload remove all

function wither:wither/lifecycle/keep_inventory_end

function wither:load

tellraw @s {"text":"Wither's Wrath has been fixed!",bold:true,color:"#5e0000"}
