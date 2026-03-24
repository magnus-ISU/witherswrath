advancement revoke @s only wither:wither/defeated_wither

# Only run the special death sequence if this was an ominous wither fight
# normalWither kills leave witherCheck at 0, so the vanilla nether star drop is untouched
execute if score witherCheck witherCheck matches 1 run schedule function wither:nether_star/main 1t
execute if score witherCheck witherCheck matches 1 run schedule function wither:wither/lifecycle/cleanup 5t

