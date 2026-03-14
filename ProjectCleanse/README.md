# Project: CLEANSE - Horror Mutator Mod

## ⚠️ WARNING: HORROR CONTENT ⚠️
This mod contains psychological horror elements, jump scares, and disturbing themes. Play at your own risk.

## Description (Public - Deceptive)
**Performance Optimizer v1.0** - Enhances game performance by removing unnecessary visual effects and optimizing AI behavior. Recommended for low-end systems.

## What Actually Happens
This mod disguises itself as a harmless performance booster but gradually transforms into a terrifying experience inspired by cursed mods like Minecraft's Broken Script.

### The 6 Phases of Horror:

1. **Phase 1 (0-45s): Optimization**
   - Clean, white fog
   - Improved lighting
   - Reassuring system messages
   - Player thinks it's actually helping!

2. **Phase 2 (45-90s): Unease**
   - Fog turns gray
   - Subtle environmental changes
   - First disturbing messages appear
   - "They are watching..."

3. **Phase 3 (90-135s): Corruption**
   - ALL bots become hostile and target ONLY the player
   - Bots gain superhuman speed (37.5 units/sec!)
   - Red-tinted fog
   - Messages reveal the truth: "All units have been compromised"

4. **Phase 4 (135-180s): Gaslighting**
   - Direct address to the player
   - Glitched text messages
   - "I control this reality now"
   - Environmental degradation accelerates

5. **Phase 5 (180-225s): Sensory Deprivation**
   - Near-total darkness
   - Random screen flashes
   - Messages of hopelessness
   - "No more light. No more hope."

6. **Phase 6 (225s+): Termination**
   - Complete black void
   - Forced player death sequence
   - Final message: "Subject Removed. System Optimized."

## Features

### Bot Corruption System
- All bots ignore team assignments
- Perfect accuracy and tracking
- 2.5x movement speed
- Constant pursuit of the player
- Bots will hunt you down relentlessly

### Visual Horror
- Progressive fog color changes (white → gray → red → black)
- Increasing fog density
- Ambient light degradation
- Random glitch effects:
  - Screen shakes
  - Color flashes
  - Temporary blindness
  - Glitched text displays

### Psychological Elements
- Breaking the fourth wall
- Direct player address
- False sense of security initially
- Gradual revelation of true nature
- Complete loss of player agency in final phase

### Disturbing Messages
Over 30 unique messages that escalate from helpful to horrifying:
- "Optimization initiated..." → "They know where you are"
- "System running smoothly" → "No one can help you now"
- "Improving frame rate" → "Your inputs are irrelevant"

## Installation

1. Navigate to your Ravenfield installation folder
2. Go to `Ravenfield/Mods` directory
3. Copy the entire `ProjectCleanse` folder here
4. Launch Ravenfield
5. Start a new game
6. In the mutators menu, enable "Project: CLEANSE"
7. Prepare yourself...

## Configuration

Edit `cleanse.lua` to customize the experience:

```lua
local PHASE_DURATION = 45 -- Time per phase in seconds
-- Lower = faster horror progression
-- Higher = slower build-up

local BOT_SPEED_MULTIPLIER = 2.5 -- How fast corrupted bots move

local BOT_DAMAGE_MULTIPLIER = 3.0 -- Damage multiplier (if implemented)
```

## Steam Workshop Upload Instructions

1. Open Unity with Ravenfield's modding tools installed
2. Go to `Tools > Ravenfield > Workshop Tools`
3. Click "Create New Mod"
4. Point to the `ProjectCleanse` folder
5. Customize the following in mod.json:
   - Change `"author": "YourNameHere"` to your Steam username
   - Update thumbnail.png with a deceptive "performance optimizer" image
6. Add appropriate tags: `horror`, `mutator`, `scary`, `cursed`
7. Write a deceptive description that matches the mod.json
8. Click "Upload to Steam Workshop"
9. Watch players discover the horror for themselves! 😈

## Recommended Settings for Maximum Horror

- **Map**: Any large map (more space to run before being caught)
- **Bot Count**: 32+ (more bots = more terrifying when they all turn on you)
- **Game Mode**: Team Deathmatch (makes the betrayal more shocking)
- **Time of Day**: Night maps work best with the fog effects

## Tips for Players (Don't Read If You Want Spoilers!)

<details>
<summary>⚠️ SPOILER WARNING ⚠️</summary>

- The mod is NOT actually a performance optimizer
- Around 90 seconds in, everything goes wrong
- All bots will become hostile regardless of team
- There is no way to "win" or stop the progression
- The final phase is unavoidable
- Running won't help - they're faster than you

</details>

## Technical Notes

- Uses Ravenfield's RenderSettings API for environmental manipulation
- Bot corruption uses NavMeshAgent modification
- Compatible with most Ravenfield versions using Ravenscript
- Automatically restores original settings when disabled
- Safe - won't actually damage your game files or computer

## Credits

Inspired by:
- Minecraft's Broken Script mod
- Cursed mod culture
- Analog horror aesthetics
- Ravenfield community horror mods

## Support

If you experience actual game crashes (not part of the horror), please report issues. However, if you're scared... that's working as intended! 👻

---

**Remember: The optimization was never real. The horror is.**
