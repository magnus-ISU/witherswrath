<div align="center">
  <img src="https://cdn.modrinth.com/data/cached_images/8d5aaaefc87dc119197586f7725d20513ee9e2ae.png" alt="Logo" width="500">
</div>
<br><br>

**Ominous Wither** is a fork of [Wither's Wrath](https://github.com/ImHer0/witherswrath) with new attack patterns, summoning mechanics, and a multi-phase battle designed to be a real challenge. The Wither has **600 HP**, three distinct phases, and an army of minions at its command.

To trigger the Ominous Wither, summon a wither and have Bad Omen within 32 blocks. Normal withers are not affected and will not change once they have completed summoning.

<br>

---

**For Minecraft 1.21.11 and up.**

---


<details>

The Ominous Wither has **600 HP**, 1.5x scale, increased knockback resistance, and blast protection armor. Summoned mobs use vanilla-like sizes rather than custom scales for a more authentic feel. The tick loop is event-driven and only runs while a fight is active -- no persistent ticking when the wither isn't present.

---

### Phase 1 (600 - 300 HP)

- **Distant Death** -- The wither will hover 20 blocks away from players, keeping its distance and attacking with its new ranged attacks.
- **Burst of Skulls** -- Enhanced skull attacks including burst-fire volleys.
- **Homing Skulls** -- Weaker but never miss. Can be blocked with a Shield.
- **Skeleton Summons** -- Periodically spawns 8 skeletons (with levitation) in a ring around each player, plus a **Skeleton Captain** with a golden helmet, permanent strength, speed, and regeneration.

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
- **Nether Portal Destruction** -- Nether portals near players are destroyed during the fight to prevent escape.
- **Despawn** -- If no players are within 150 blocks (e.g. you die and respawn far away), the wither despawns in a massive multi-ring explosion and the fight ends.
- **Teleport Chase** -- If a player is 128-150 blocks away, the wither teleports above them.
- **Summoned Mob Healing** -- Summoned skeletons have their wither effect replaced with Regeneration II so they don't die to the wither's own aura.
- **Weather & Atmosphere** -- Time is set to midnight and weather to thunderstorm when the fight begins. Custom music plays for each phase.

</details>

<details>
<summary>How to enable Bedrock Mode</summary>


https://github.com/user-attachments/assets/58b41e93-03e0-4469-af28-27580a54e916


</details>

---

<br>

### **Toggle Options**
To configure settings, use the following command:
`/function wither:config`

Available toggles across 3 config pages:

| Toggle | Description |
|--------|-------------|
| **Animation** | Off / Default / Bedrock parity |
| **Trophy** | Toggle the trophy dropped on death |
| **Destruction** | Block breaking, explosions, etc. |
| **Homing** | Homing skull attacks |
| **Charge Attack** | The charge/ram at 250 HP |
| **Spawns** | Periodic skeleton summons |
| **Direct Hits** | Explosion + teleport when hit in Phase 1 |
| **Dashes** | Dash attacks in Phase 3 |
| **Weather** | Midnight + thunderstorm on fight start |

> Warning:
> This Wither is highly destructive. Fight it far from your base, or toggle the option to disable destructive features.

<br>

---

<br>

### **Changes from Wither's Wrath**

- Renamed to **Ominous Wither** -- activated by Bad Omen instead of always replacing the wither
- **No persistent ticking** -- the tick loop is event-driven, only running during an active fight
- **Vanilla-like summons** -- mobs use vanilla sizes instead of custom scales
- **Skeleton summons** in Phase 1 (skeletons + captains per player)
- **Phantom riders (wArchers)** at the midpoint with a **shield mechanic** protecting the wither
- **Wither flees further** using motion-based movement when players get close
- **Downward dive attack** -- aerial slam with creeper explosions and lightning
- **Horse riders** in the final phase -- elite netherite wither skeletons on skeleton horses
- **Aura of destruction** in the final phase -- Wither V to distant players with a visible particle boundary
- **Resistance III** in the final phase making the wither harder to kill
- **Skeleton swarm** at 150 HP -- 15 wither skeletons summoned at once
- **Nether portal destruction** during the fight

<br>

---

<br>

### **Links**
Click below to view or download the data pack on other platforms:

[![GitHub](https://img.shields.io/badge/GitHub-000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ImHer0/witherswrath)
[![Modrinth](https://img.shields.io/badge/Modrinth-3FCC9A?style=for-the-badge&logo=modrinth&logoColor=white)](https://modrinth.com/datapack/witherswrath/)
[![PlanetMinecraft](https://img.shields.io/badge/Planet%20Minecraft-2E9FFF?style=for-the-badge&logo=anycubic&logoColor=white)](https://www.planetminecraft.com/data-pack/wither-s-wrath/)<br>
[![CurseForge](https://img.shields.io/badge/CurseForge-f16e34?style=for-the-badge&logo=curseforge&logoColor=white)](https://www.curseforge.com/minecraft/data-packs/withers-wrath)

<br>

---

### **Server Usage**
If you're using this on a server, I'd appreciate feedback on any potential performance impacts. Due to limited testing with larger player groups, there might be areas needing optimisation.

### **Permissions**
Feel free to use this in any packs, modify it, and make it look more polished or fancy!
