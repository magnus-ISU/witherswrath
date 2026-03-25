advancement revoke @s only wither:wither/defeated_wither

# Advancement only fires for the ominousWither-tagged entity, so always run the special death sequence
schedule function wither:nether_star/main 1t
schedule function wither:wither/lifecycle/cleanup 5t

