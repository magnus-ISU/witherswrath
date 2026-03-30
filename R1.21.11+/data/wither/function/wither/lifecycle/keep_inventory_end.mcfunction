execute if data storage wither:fight {keepInventoryFightActive:1b} if data storage wither:fight {savedKeepInventory:1b} run gamerule keep_inventory true
execute if data storage wither:fight {keepInventoryFightActive:1b} unless data storage wither:fight {savedKeepInventory:1b} run gamerule keep_inventory false
execute if data storage wither:fight {keepInventoryFightActive:1b} run data remove storage wither:fight savedKeepInventory
execute if data storage wither:fight {keepInventoryFightActive:1b} run data remove storage wither:fight keepInventoryFightActive
