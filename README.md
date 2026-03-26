# Ominous Wither

**Ominous Wither** is a fork of [Wither's Wrath](https://github.com/ImHer0/witherswrath) for 1.21.11+ with new attack patterns, summoning mechanics, and a multi-phase battle. The Wither has **600 HP**, three distinct phases, and an army of minions at its command.

To trigger the Ominous Wither, summon a wither and have Bad Omen within 32 blocks. Normal withers are not affected and will not change once they have completed summoning.

<br>

<details>
<summary>Fight Mechanics</summary>

---

### Phase 1 (600 - 300 HP)
- **600 HP**, 1.5x scale, increased knockback resistance, and blast protection.
- **Burst of Skulls** -- Enhanced skull attacks including burst-fire volleys. Persist in all phases.
- **Homing Skulls** -- Weaker but never miss. Can be blocked with a Shield. Persist in all phases.
- **Ranged Attacks** -- The wither will hover 25 blocks away from players for now, keeping its distance and attacking with its new ranged attacks.
- **Skeleton Summons** -- Every 25 seconds 8 skeletons rise from the ground in a ring around each player, plus a **Skeleton Captain** with a golden helmet, permanent strength, speed, and regeneration.

---

### Phase 2 (300 - 100 HP)

- The wither gains increased armor and armor toughness.
- **Blast column** erupts upward with cascading explosions. The wither ascends, then slams back to the ground with a shockwave.
- **Phantom Archers** are summoned -- wither skeletons riding invisible phantoms, armed with Flame bows, golden helmets, and netherite chestplates, scaled to the number of players.
- **Wither Shield** -- While any Phantom Archer is alive, the Ominous Wither is **immune to damage**. You must kill the Phantom Archers to lift the shield.
- **Charge Attack** -- Unlocked when the shield is broken. The wither locks on, freezes in place, then rams toward the nearest player at high speed.
- **Skeleton Swarm** -- At 150 HP, summons 15 fast, tough wither skeletons.

---

### Phase 3 / Enraged (100 - 0 HP)

- **Enraged Mode** activates -- the wither's color turns dark red, stays low to the ground, and particle effects intensify.
- **Resistance III** -- The wither permanently has Resistance III, making it much harder to kill.
- **Faster Attacks** -- Homing skulls and charge attacks happen at double speed.
- **Rotating Skull Ring** -- Orbiting wither skulls spin around the wither, face the player, then launch towards them.
- **Aura of Destruction** -- All players more than 16 blocks away receive **Wither V**, forcing you to stay close. A ring of black squid ink particles marks the 16-block boundary.
- **Dashes** -- The wither freezes, faces a player, then dashes toward them repeatedly every 3 seconds.
- **Horse Riders** -- Summons 3 elite wither skeletons riding **skeleton horses** with netherite horse armor every 15 seconds.

---

### Other Mechanics

- **Aerial Dive** -- If the wither is more than 20 blocks above a player, it dives straight down, slamming into the ground with a large explosion and a **lightning strike**. This keeps it near to the players no matter what.
- **Teleport Chase** -- If a player is 128-150 blocks away, the wither teleports above them.
- **Despawn** -- If no players are within 150 blocks (e.g. you die and respawn far away), the wither despawns in a massive multi-ring explosion and the fight ends.
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
- **Aura of destruction** in the final phase -- Wither V to distant players forcing chaos.
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
