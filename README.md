# Ominous Wither

**Ominous Wither** is a fork of [Wither's Wrath](https://github.com/ImHer0/witherswrath) for 1.21.11+ with new attack patterns, summoning mechanics, and a multi-phase battle. The Wither has **600 HP**, three distinct phases, and an army of minions at its command.

To trigger the Ominous Wither, summon a wither and have Bad Omen within 32 blocks. Normal withers are not affected and will not change once they have completed summoning.

Keep Inventory will enable during the fight, as the battle is much too difficult to be fun to play with a chance of losing everything. Even so, watch your armor durability and bring extra boxes of totems.

<br>

<details>
<summary>Fight Mechanics</summary>

---

### Phase 1 (600 - 300 HP)
- **600 HP**, 1.5x scale, increased knockback resistance, and blast protection.
- **Burst of Skulls** -- Enhanced skull attacks including burst-fire volleys. Persist in all phases.
- **Homing Skulls** -- Weaker but never miss. Can be blocked with a Shield. Persist in all phases.
- **Ranged Attacks** -- The wither will hover about 30 blocks away from players for now, keeping its distance and attacking with its new ranged attacks.
- **Buried Army** -- Every 25 seconds 8 skeletons rise from the ground in a ring around each player, plus a **Dead King** with a golden helmet, permanent strength, speed, and instant regeneration.

---

### Phase 2 (300 - 100 HP)

- The wither gains increased armor and armor toughness.
- **Phase Transition** -- the wither erupts upward, then slams back to the ground with a shockwave. **Phantom Archers** are summoned -- flying wither skeletons, armed with powerful bows and scaled to the number of players.
- **Phantom Shield** -- While any Phantom Archer is alive, the Ominous Wither is **immune** to damage. You must kill the Phantom Archers to lift the shield.
- **Beam Attack** -- Every 60 seconds, the wither ascends and targets up to 3 players. Crystal beams spiral down, then unleash doom upon any players who haven't found shelter.
- **Charge Attack** -- Unlocked when the shield is broken. The wither locks on, freezes in place, then rams toward the nearest player at high speed.
- **Proximity Shield** -- When below 150 HP, the wither activates another layer of defense. Players must deal the last 50 HP in melee, for the wither is invulnerable for a few seconds if all players exit a 16 block radius. Additionally, it will now remain near to the ground, slamming back if it travels too high.
- **Spellstorm Souls** -- When the Proximity Shield drops, summons 15 fast, tough wither skeletons around each player. If they are ignored, they teleport to the player nearest to the wither with a flash of lightning.

---

### Phase 3 / Enraged (100 - 0 HP)

- **Resistance III** -- The wither permanently has Resistance III, making it much harder to kill.
- **Faster Attacks** -- Homing skulls and charge attacks happen at double speed.
- **Circle of Death** -- Orbiting wither skulls spin around the wither, face the player, then launch towards them.
- **Aura of Destruction** -- All players more than 16 blocks away receive **Wither X**, forcing you to stay close.
- **Dashes** -- The wither freezes, faces a player, then dashes toward them repeatedly every 3 seconds.
- **Death Knights** -- Summons 3 elite wither skeletons riding skeleton horses with netherite horse armor every 15 seconds.

---

### Other Mechanics

- **Ominous Arrival** -- As soon as the wither changes to the Ominous wither, it lets out a large explosion and 24 witherskulls.
- **Aerial Dive** -- If the wither is more than 20 blocks above a player, it dives straight down, slamming into the ground with a large explosion and a **lightning strike**. This keeps it near to the players no matter what.
- **Teleport Chase** -- If a player is 128-150 blocks away, the wither teleports above them.
- **Despawn** -- If no players are within 150 blocks (e.g. you die and respawn far away), the wither despawns and the fight ends. It also ends after 20 minutes (to avoid trapping world spawn).
- **Nether Portal Destruction** -- Nether portals near players are destroyed during the fight to prevent escape.
- **Summoned Mob Healing** -- Summoned skeletons have their wither effect replaced with Regeneration II so they don't die to the wither's own attacks (as much).
- **Weather & Atmosphere** -- Time is set to midnight and weather to thunderstorm when the fight begins. Custom music plays for each phase.

</details>

<details>
<summary> Changes from Wither's Wrath </summary>
<br>

- **Renamed to Ominous Wither** -- and activated by Bad Omen instead of always replacing the wither.
- **No persistent ticking** -- the tick loop is event-driven, only running during an active fight. There is no performance overhead when not fighting and no scheduled events cluttering things.
- **Tweaked thresholds for behaviors** to have 3 more consistent phases.
- **Vanilla-size minions** instead of custom scales, with fewer HP or attribute changes.
- **Wither flees further** -- 25 blocks away instead of very close to melee.
- **Skeleton summons** in Phase 1 (skeletons + captains per player).
- **Phantom riders (wArchers)** at the midpoint with a **shield mechanic** protecting the wither.
- **Downward dive attack** -- aerial slam with creeper explosions and lightning.
- **Horse riders** are summoned in the final phase; elite netherite wither skeletons on horseback.
- **Aura of Ash** in the final phase -- Wither V to distant players forcing chaos.
- **Resistance III** in the final phase making the wither harder to kill -- it has 750 effective HP.
- **Skeleton swarm** at 150 HP -- 15 wither skeletons summoned at once.
- **Nether portal destruction** during the fight.
- **Teleport Chase** to prevent fleeing with elytra.
- **Despawning** if it kills all nearby players.

<br>
</details>

---

<br>

### **Permissions**
Feel free to use this in any packs, modify it, and make it look more polished or fancy! Let me know how it works!
