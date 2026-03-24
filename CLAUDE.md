# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Wither's Wrath is a Minecraft data pack that revamps the Wither boss fight with 600 HP (Bedrock parity), new attack patterns (homing skulls, charge, dash, enraged mode), and configurable difficulty options. Supports Minecraft versions 1.19.4 through 1.21.11+.

## Version Structure

Each Minecraft version range has its own folder with identical structure:
- `R1.21.11+/` - Latest version (pack_format 93-99)

When making changes, consider whether they should be applied across all version folders.

## Testing Commands

In Minecraft, use these commands to test the data pack:

```
# Reload data pack after changes
/reload

# Open configuration menu
/function wither:config

# Summon wither for testing
/summon wither ~ ~ ~

# Force kill all withers
/kill @e[type=wither]
```

## Architecture

### Execution Flow

1. **Load**: `minecraft:tags/function/load.json` calls `wither:load` and `wither:5tick`
2. **Tick Loop**: `wither:tick` runs every 5 game ticks, routing to phase handlers based on wither health
3. **Phases**: Health thresholds trigger different attack patterns

### Boss Phases (by health)

| Health | Phase | Attack |
|--------|-------|--------|
| 600-301 | Phase 1 | Normal + Homing skulls |
| 300 | Midpoint | Transition animation, mob spawns |
| 300-251 | Phase 2 | Normal attacks |
| 250-101 | Phase 2 | Charge attack unlocked |
| 100-1 | Phase 2 | Dash attack + Enraged mode |

### Key Function Directories

All under `data/wither/function/`:

- `wither/lifecycle/` - spawn, death, state checking
- `wither/phase1/homing/` - homing skull tracking
- `wither/phase2/charge/` - charge attack sequence
- `wither/phase2/dashes/` - dash attack movement
- `wither/phase2/enraged/skulls/` - rotating skull pattern
- `wither/hit/` - damage event handlers (triggered by advancements)
- `wither/toggle/` - configuration option handlers
- `wither/unstuck/` - failsafe to prevent wither getting stuck in blocks

### Configuration System

Toggles stored via NBT data storage, accessed through `wither:config`:
- `togglehoming` - Homing skulls on/off
- `toggleanimation` - Default vs Bedrock animation style
- `toggledestructive` - Block destruction on/off

### Advancement Triggers

Advancements in `data/wither/advancement/wither/` detect player damage to wither and trigger corresponding functions (hit.json triggers hit.mcfunction, etc.).

## MCFunction Conventions

- Entity selectors use `@e[type=wither,tag=theWither]` for the modified wither
- Scoreboard objectives track health, timers, and attack states
- Particle/sound commands use relative coordinates for visual effects
- Motion is applied via NBT data modification on entities
