# Check if ominous wither fight is still active
# If wither died (no entity but witherCheck flag set), run cleanup
execute if score witherCheck witherCheck matches 1 unless entity @e[type=wither,tag=ominousWither] run function wither:wither/fix

# Update witherCheck flag based on entity existence
execute if entity @e[type=wither,tag=ominousWither] run scoreboard players set witherCheck witherCheck 1
execute unless entity @e[type=wither,tag=ominousWither] run scoreboard players set witherCheck witherCheck 0

# Reschedule if fight is still active
execute unless entity @e[type=item,sort=nearest,tag=nether_star] if entity @e[type=wither,tag=ominousWither] run schedule function wither:wither_check 1t
