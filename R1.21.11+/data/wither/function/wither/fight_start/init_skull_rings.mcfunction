playsound minecraft:entity.wither.shoot hostile @a[distance=..80] ~ ~ ~ 2 0.8

# horizontal ring — spawn offset from core so skulls don’t clip the wither
summon minecraft:wither_skull ~ ~1.8 ~0.5 {Tags:["fightInitSkull","fisH_S"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.0d,0.0d,0.35d]}
summon minecraft:wither_skull ~-0.354 ~1.8 ~0.354 {Tags:["fightInitSkull","fisH_SW"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.247d,0.0d,0.247d]}
summon minecraft:wither_skull ~-0.5 ~1.8 ~ {Tags:["fightInitSkull","fisH_W"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.35d,0.0d,0.0d]}
summon minecraft:wither_skull ~-0.354 ~1.8 ~-0.354 {Tags:["fightInitSkull","fisH_NW"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.247d,0.0d,-0.247d]}
summon minecraft:wither_skull ~ ~1.8 ~-0.5 {Tags:["fightInitSkull","fisH_N"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.0d,0.0d,-0.35d]}
summon minecraft:wither_skull ~0.354 ~1.8 ~-0.354 {Tags:["fightInitSkull","fisH_NE"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.247d,0.0d,-0.247d]}
summon minecraft:wither_skull ~0.5 ~1.8 ~ {Tags:["fightInitSkull","fisH_E"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.35d,0.0d,0.0d]}
summon minecraft:wither_skull ~0.354 ~1.8 ~0.354 {Tags:["fightInitSkull","fisH_SE"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.247d,0.0d,0.247d]}

# up slightly
summon minecraft:wither_skull ~ ~2 ~0.5 {Tags:["fightInitSkull","fisU_S"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.0d,0.08d,0.35d]}
summon minecraft:wither_skull ~-0.354 ~2 ~0.354 {Tags:["fightInitSkull","fisU_SW"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.247d,0.08d,0.247d]}
summon minecraft:wither_skull ~-0.5 ~2 ~ {Tags:["fightInitSkull","fisU_W"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.35d,0.08d,0.0d]}
summon minecraft:wither_skull ~-0.354 ~2 ~-0.354 {Tags:["fightInitSkull","fisU_NW"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.247d,0.08d,-0.247d]}
summon minecraft:wither_skull ~ ~2 ~-0.5 {Tags:["fightInitSkull","fisU_N"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.0d,0.08d,-0.35d]}
summon minecraft:wither_skull ~0.354 ~2 ~-0.354 {Tags:["fightInitSkull","fisU_NE"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.247d,0.08d,-0.247d]}
summon minecraft:wither_skull ~0.5 ~2 ~ {Tags:["fightInitSkull","fisU_E"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.35d,0.08d,0.0d]}
summon minecraft:wither_skull ~0.354 ~2 ~0.354 {Tags:["fightInitSkull","fisU_SE"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.247d,0.08d,0.247d]}

# down slightly
summon minecraft:wither_skull ~ ~1.55 ~0.5 {Tags:["fightInitSkull","fisD_S"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.0d,-0.08d,0.35d]}
summon minecraft:wither_skull ~-0.354 ~1.55 ~0.354 {Tags:["fightInitSkull","fisD_SW"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.247d,-0.08d,0.247d]}
summon minecraft:wither_skull ~-0.5 ~1.55 ~ {Tags:["fightInitSkull","fisD_W"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.35d,-0.08d,0.0d]}
summon minecraft:wither_skull ~-0.354 ~1.55 ~-0.354 {Tags:["fightInitSkull","fisD_NW"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[-0.247d,-0.08d,-0.247d]}
summon minecraft:wither_skull ~ ~1.55 ~-0.5 {Tags:["fightInitSkull","fisD_N"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.0d,-0.08d,-0.35d]}
summon minecraft:wither_skull ~0.354 ~1.55 ~-0.354 {Tags:["fightInitSkull","fisD_NE"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.247d,-0.08d,-0.247d]}
summon minecraft:wither_skull ~0.5 ~1.55 ~ {Tags:["fightInitSkull","fisD_E"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.35d,-0.08d,0.0d]}
summon minecraft:wither_skull ~0.354 ~1.55 ~0.354 {Tags:["fightInitSkull","fisD_SE"],dangerous:1b,NoGravity:1b,Fire:200,Motion:[0.247d,-0.08d,0.247d]}
