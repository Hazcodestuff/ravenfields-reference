# Low Gravity Mayhem - Ravenfield Mutator Mod

## Overview
A fun mutator mod for Ravenfield that reduces gravity to create moon-like jumping conditions!

## Features
- **Reduced Gravity**: 30% of normal Earth gravity
- **Chaotic Gameplay**: Perfect for arcade-style fun
- **Universal Compatibility**: Works with all maps and game modes
- **Easy to Use**: Just enable in the mutators menu

## Installation

### For Players:
1. Download this mod folder
2. Place it in your Ravenfield mods directory:
   - Windows: `C:\Program Files (x86)\Steam\steamapps\common\Ravenfield\ravenfield_Data\Mods`
   - Or through Steam Workshop subscription

### For Steam Workshop Upload:
1. Make sure you have the [Ravenfield Modding Tools](https://steamcommunity.com/app/736590/workshop/)
2. Open Ravenfield in Unity with the modding tools
3. Go to `Window > Ravenfield > Workshop Tools`
4. Click "Create New Mod" or select this folder
5. Fill in the details (already provided in mod.yml)
6. Click "Upload to Workshop"

## File Structure
```
LowGravityMayhem/
├── LowGravityMayhem.lua    # Main mutator script
├── mod.yml                 # Mod configuration and workshop info
├── icon.png                # (Optional) Add a 256x256 icon image
└── README.md               # This file
```

## Customization
You can adjust the gravity by editing `LowGravityMayhem.lua`:
- Change `GRAVITY_SCALE` (0.3 = 30% gravity, 0.5 = 50%, etc.)
- Lower values = more floaty gameplay
- Higher values = closer to normal gravity

## Requirements
- Ravenfield (latest version recommended)
- Ravenscript support (built into Ravenfield)

## Known Issues
- None currently reported

## Credits
Created using Ravenscript based on the official Ravenfield API

## License
Free to use and modify. Have fun!

---

**Enjoy the low gravity chaos!** 🌙🚀
