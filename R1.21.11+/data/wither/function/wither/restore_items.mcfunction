# Item tracking and restoration for nonrenewable items (mace, elytra)
# wHasMace/wHasElytra: 0 = doesn't have, 1 = has in inventory, 2 = died with it, needs restore

# 1. Restore items to respawned players first (clears 2 before anything can overwrite)
execute as @a[scores={wHasMace=2},nbt={DeathTime:0s}] unless items entity @s container.* minecraft:mace run give @s minecraft:mace 1
execute as @a[scores={wHasMace=2},nbt={DeathTime:0s}] run scoreboard players set @s wHasMace 0
execute as @a[scores={wHasElytra=2},nbt={DeathTime:0s}] unless items entity @s container.* minecraft:elytra run give @s minecraft:elytra 1
execute as @a[scores={wHasElytra=2},nbt={DeathTime:0s}] run scoreboard players set @s wHasElytra 0

# 2. Detect deaths and mark for restore (1 → 2)
execute as @a[scores={wDeathCount=1..,wHasMace=1}] run scoreboard players set @s wHasMace 2
execute as @a[scores={wDeathCount=1..,wHasElytra=1}] run scoreboard players set @s wHasElytra 2
execute as @a[scores={wDeathCount=1..}] run scoreboard players set @s wDeathCount 0

# 3. Scan inventories for players within 150 blocks (initialize new players, skip pending restores)
execute at @e[type=wither,tag=ominousWither,limit=1] run scoreboard players add @a[distance=..150] wHasMace 0
execute at @e[type=wither,tag=ominousWither,limit=1] run scoreboard players add @a[distance=..150] wHasElytra 0
execute at @e[type=wither,tag=ominousWither,limit=1] as @a[distance=..150,scores={wHasMace=..1}] store success score @s wHasMace if items entity @s container.* minecraft:mace
execute at @e[type=wither,tag=ominousWither,limit=1] as @a[distance=..150,scores={wHasElytra=..1}] store success score @s wHasElytra if items entity @s container.* minecraft:elytra

execute as @a if items entity @s armor.chest minecraft:elytra run scoreboard players set @s wHasElytra 1

# Continue while fight is active or restores are still pending
execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:wither/restore_items 1t
execute unless entity @e[type=wither,tag=ominousWither] if entity @a[scores={wHasMace=2}] run schedule function wither:wither/restore_items 1t
execute unless entity @e[type=wither,tag=ominousWither] if entity @a[scores={wHasElytra=2}] run schedule function wither:wither/restore_items 1t
