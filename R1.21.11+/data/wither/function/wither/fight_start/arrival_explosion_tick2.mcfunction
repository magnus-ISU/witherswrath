execute at @e[type=armor_stand,tag=ArrivalExplosionAnchor,limit=1,sort=arbitrary] run effect give @a[distance=..21] minecraft:resistance 1 4 true
execute at @e[type=armor_stand,tag=ArrivalExplosionAnchor,limit=1,sort=arbitrary] run function wither:wither/fight_start/init_sphere_summons
