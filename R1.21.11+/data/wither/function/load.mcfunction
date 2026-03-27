scoreboard objectives add checkHealth dummy
scoreboard objectives add playerCount dummy
scoreboard objectives add witherCheck dummy
scoreboard objectives add skullposX dummy
scoreboard objectives add skullposY dummy
scoreboard objectives add skullposZ dummy
scoreboard objectives add playerposX dummy
scoreboard objectives add playerposY dummy
scoreboard objectives add playerposZ dummy
scoreboard objectives add skulllaunchmotX dummy
scoreboard objectives add skulllaunchmotY dummy
scoreboard objectives add skulllaunchmotZ dummy
scoreboard objectives add burstcount dummy
scoreboard objectives add rules dummy
scoreboard objectives add stages dummy
scoreboard objectives add wither.temp.x dummy
scoreboard objectives add wither.temp.y dummy
scoreboard objectives add wither.temp.z dummy
scoreboard objectives add wither.temp.px dummy
scoreboard objectives add wither.temp.py dummy
scoreboard objectives add wither.temp.pz dummy
scoreboard objectives add fightInitAge dummy
scoreboard objectives add divecooldown dummy
scoreboard objectives add beamTimer dummy
scoreboard objectives add beamStep dummy

execute if entity @e[type=minecraft:wither,tag=ominousWither] run tellraw @a ["",{"text":"[ᴡɪᴛʜᴇʀ'ꜱ ᴡʀᴀᴛʜ] ","bold":true,"color":"#322A32"},{"text":"ᴛʜᴇ ᴘᴀᴄᴋ ᴡᴀꜱ (ʀᴇ)ʟᴏᴀᴅᴇᴅ ᴡʜɪʟᴇ ᴀɴ ᴏᴍɪɴᴏᴜꜱ ᴡɪᴛʜᴇʀ ᴡᴀꜱ ᴀʟɪᴠᴇ... ᴋɪʟʟɪɴɢ ɪᴛ!!!","bold":true,"color":"dark_red"}]
execute if entity @e[type=minecraft:wither,tag=ominousWither] run function wither:wither/fix

# prevents storage from being set if already initialized previously (saves current settings if any)
execute unless data storage wither:options {initialized:2} run function wither:initialize_storage

# Backfill new toggles for existing installs (only sets if key doesn't exist yet)
execute unless data storage wither:options {togglebeam:Enabled} unless data storage wither:options {togglebeam:Disabled} run data modify storage wither:options togglebeam set value Enabled

# Wither detection is now event-driven (skull_placed advancement + ominous_check)
# tick.mcfunction is started by ominous_init when a fight begins

