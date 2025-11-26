# Space Elevator - Complete User Guide

Welcome to the Space Elevator mod! This guide will walk you through everything you need to know to build and operate your very own space elevator in Factorio 2.0 with Space Age.

---

## Table of Contents

1. [What Does This Mod Do?](#what-does-this-mod-do)
2. [Requirements](#requirements)
3. [Getting Started](#getting-started)
4. [Building Your Space Elevator](#building-your-space-elevator)
5. [Setting Up Your Space Platform](#setting-up-your-space-platform)
6. [Connecting Elevator to Platform](#connecting-elevator-to-platform)
7. [Transferring Items](#transferring-items)
8. [Transferring Fluids](#transferring-fluids)
9. [Player Transport](#player-transport)
10. [Automation Tips](#automation-tips)
11. [Settings & Configuration](#settings--configuration)
12. [Troubleshooting](#troubleshooting)
13. [FAQ](#faq)

---

## What Does This Mod Do?

The Space Elevator provides an alternative to rocket launches for moving items, fluids, and yourself between planetary surfaces and orbiting space platforms.

**Key Benefits:**
- **Fast transfers**: Move up to 250 items per cycle continuously
- **No rocket fuel per launch**: Once built, transfers only cost electricity
- **Direct fluid transfer**: No need to barrel and unbarrel fluids
- **Player transport**: Travel between surface and platform in 3 seconds
- **Fully automatable**: Works with inserters and pipes

**The Trade-off:**
- Expensive multi-stage construction requiring materials from all four planets
- High power consumption (10 MW base + energy per transfer)
- Late-game technology requiring Cryogenic Science Packs

---

## Requirements

**Required:**
- Factorio 2.0 or later
- Space Age DLC
- Entity GUI Library mod (auto-installed as dependency)

**Technology Prerequisites:**
- Rocket Silo technology
- Cryogenic Science Pack (requires visiting all 4 planets: Vulcanus, Fulgora, Gleba, and Aquilo)

---

## Getting Started

### Step 1: Research the Technology

Open your technology tree and find **"Space Elevator"**. This research requires:

- 2,000 of EACH science pack type (all 10 types)
- Automation, Logistic, Chemical, Production, Utility
- Space, Metallurgic, Electromagnetic, Agricultural, Cryogenic

**Note:** You need Cryogenic Science Packs, which means you must have visited Aquilo. This is intentionally a late-game technology!

### Step 2: Craft the Construction Kit

Once researched, you can craft the **Space Elevator Construction Kit**:

| Ingredient | Amount |
|------------|--------|
| Steel Plate | 500 |
| Concrete | 500 |
| Processing Units | 100 |
| Electric Engine Units | 50 |

Crafting time: 30 seconds

### Step 3: Craft the Dock and Fluid Tank

You'll also need these for your space platform:

**Space Elevator Dock:**
| Ingredient | Amount |
|------------|--------|
| Steel Plate | 100 |
| Processing Units | 50 |
| Low Density Structures | 20 |
| Superconductors | 10 |

**Dock Fluid Tank** (optional, for fluid transfers):
| Ingredient | Amount |
|------------|--------|
| Steel Plate | 50 |
| Iron Plate | 20 |
| Pipes | 10 |

---

## Building Your Space Elevator

Building the elevator is a 5-stage construction process. This isn't instant - it's meant to feel like a major engineering project!

### Placing the Elevator

1. Select the **Space Elevator Construction Kit** from your inventory
2. Click on the ground to place it on any planetary surface
3. Two companion structures automatically spawn:
   - A **cargo chest** 6 tiles SOUTH (for materials and item transfers)
   - A **fluid tank** 6 tiles NORTH (for fluid transfers)

### The 5 Construction Stages

Each stage requires specific materials and takes time to complete. Insert materials into the **cargo chest** (south of the elevator), then open the elevator's GUI and click **"Begin Construction"**.

#### Stage 1: Site Preparation (~30 seconds)
*Excavate the foundation and prepare the construction site*

| Material | Amount |
|----------|--------|
| Stone | 500 |
| Concrete | 1,000 |
| Steel Plate | 500 |

#### Stage 2: Foundation Construction (~45 seconds)
*Build the anchor point and base structure*

| Material | Amount |
|----------|--------|
| Refined Concrete | 2,000 |
| Steel Plate | 1,000 |
| Iron Gear Wheels | 500 |
| Pipes | 200 |

#### Stage 3: Tower Assembly (~60 seconds)
*Construct the main elevator shaft - requires materials from ALL planets!*

| Material | Amount | Source |
|----------|--------|--------|
| Processing Units | 500 | Nauvis |
| Electric Engine Units | 200 | Nauvis |
| Low Density Structures | 500 | Nauvis |
| Tungsten Plate | 500 | Vulcanus |
| Superconductors | 200 | Fulgora |
| Bioflux | 100 | Gleba |

#### Stage 4: Tether Deployment (~45 seconds)
*Deploy the space tether to orbit*

| Material | Amount |
|----------|--------|
| Low Density Structures | 1,000 |
| Accumulators | 100 |
| Rocket Fuel | 500 |

#### Stage 5: Activation (~30 seconds)
*Power up systems and synchronize with orbital platforms*

| Material | Amount |
|----------|--------|
| Processing Units | 200 |
| Superconductors | 100 |
| Rocket Fuel | 200 |

### Construction Tips

- **Materials go in the chest**: Always put construction materials in the cargo chest south of the elevator, NOT directly into the elevator
- **Color-coded status**: The GUI shows materials in green (have enough) or red (need more)
- **Pause anytime**: Construction pauses if you close the GUI - just reopen and click "Begin Construction" to resume
- **Use inserters**: You can automate material delivery using inserters pointing at the cargo chest
- **Cost multiplier**: Check settings - server admins can adjust material costs up or down

---

## Setting Up Your Space Platform

Before your elevator can transfer anything, you need a dock on an orbiting space platform.

### Placing the Dock

1. Launch yourself to your space platform (via rocket silo or another elevator)
2. Open your inventory and select the **Space Elevator Dock**
3. Place it anywhere on your platform's surface
4. The dock is now ready to receive connections

### Adding Fluid Transfer Capability (Optional)

If you want to transfer fluids:

1. Craft a **Dock Fluid Tank**
2. Place it **within 5 tiles** of the Space Elevator Dock
3. Connect pipes to the fluid tank for input/output

**Important:** The dock fluid tank MUST be within 5 tiles of the dock, or it won't be detected!

---

## Connecting Elevator to Platform

### Automatic Connection

If you only have **one platform** orbiting the planet where your elevator is located, it will automatically connect when both the elevator is operational and the platform has a dock.

### Manual Connection

If you have **multiple platforms** orbiting the same planet:

1. Open the elevator's GUI
2. Go to the **"Docking"** tab
3. Select your desired platform from the dropdown
4. Click **"Connect"**

### Connection Status

The GUI shows your connection status:
- **"Connected to: [Platform Name]"** in green = Ready to transfer
- **"Not Connected"** = Need to connect first
- **"No platforms with docks found"** = No valid platforms orbiting this planet

### Auto-Disconnect

If your connected platform leaves orbit (traveling to another planet), the elevator automatically disconnects. You'll need to reconnect when it returns.

---

## Transferring Items

Once connected, you can transfer items between surface and platform.

### Understanding the Layout

```
         [FLUID TANK] (6 tiles north)
              |
       [SPACE ELEVATOR]
              |
         [CARGO CHEST] (6 tiles south) <-- Items go here!
```

### Manual Item Transfer

1. Place items into the **cargo chest** (south of elevator)
2. Open the elevator GUI and go to the **"Transfer"** tab
3. Select your transfer rate: 10, 25, 50, 100, or 250 items per cycle
4. Click **"Upload"** to send items to the platform
5. Click **"Download"** to receive items from the platform dock

### Automatic Item Transfer

For continuous transfers:

1. Go to the **"Transfer"** tab
2. In the "Automatic Transfer" section, click:
   - **"Upload"** for continuous uploading
   - **"Download"** for continuous downloading
   - **"Off"** to stop automatic transfers
3. The elevator will transfer items every 0.5 seconds while enabled

### Energy Costs

- **Base power**: 10 MW constant draw
- **Transfer cost**: 10 kJ per item transferred
- At 250 items/cycle, each transfer costs 2.5 MJ

| Transfer Rate | Items/Second | Energy/Second |
|---------------|--------------|---------------|
| 10 items | 20 | 200 kJ |
| 25 items | 50 | 500 kJ |
| 50 items | 100 | 1 MJ |
| 100 items | 200 | 2 MJ |
| 250 items | 500 | 5 MJ |

### Visual Feedback

During transfers, you'll see colored beams:
- **Blue beam**: Items uploading (surface to platform)
- **Orange beam**: Items downloading (platform to surface)

The beam width increases with transfer rate - thin for 10 items, thick for 250.

---

## Transferring Fluids

Transfer fluids directly without barreling!

### Setup Requirements

**Surface side:**
- Fluid tank spawns automatically 6 tiles north of elevator
- Connect pipes to fill/empty the tank

**Platform side:**
- Place a Dock Fluid Tank within 5 tiles of the dock
- Connect pipes to the tank

### Manual Fluid Transfer

1. Open elevator GUI, go to **"Transfer"** tab
2. Scroll to the **"Fluid Transfer"** section
3. View current fluid levels on both ends
4. Click **"Upload 1000"** to send 1,000 units up
5. Click **"Download 1000"** to bring 1,000 units down

### Fluid Tank Capacity

Each tank holds **25,000 units** by default (configurable in settings).

### Visual Feedback

- **Cyan beam**: Fluid uploading
- **Dark orange beam**: Fluid downloading

---

## Player Transport

Travel between surface and platform instantly!

### Traveling to Platform

1. Stand near the elevator (within ~10 tiles)
2. Open the elevator GUI
3. Go to the **"Travel"** tab
4. Click **"Travel to Platform"**
5. Wait 3 seconds (countdown shown)
6. You appear on the platform near the dock!

### Traveling to Surface

1. Stand near the dock on the platform
2. Open the elevator/dock GUI
3. Go to the **"Travel"** tab
4. Click **"Travel to Surface"**
5. Wait 3 seconds
6. You appear on the surface near the elevator!

### Travel Requirements

- Elevator must be connected to a platform
- You must be near the elevator/dock
- Both ends must be operational

---

## Automation Tips

### Fully Automated Item Transfer

```
[Belts] --> [Inserters] --> [Cargo Chest] --> [Elevator] --> [Platform Dock]
                                   ^
                            Enable "Auto Upload"
```

1. Run belts to the cargo chest location (6 tiles south of elevator)
2. Use inserters to load items into the cargo chest
3. Enable automatic upload in the elevator GUI
4. On the platform, use inserters to unload from the dock
5. Items flow continuously!

### Reverse Flow (Platform to Surface)

1. Load items into the dock storage on the platform
2. Enable automatic download on the elevator
3. Use inserters to extract from the cargo chest
4. Items flow down to your surface factory!

### Fluid Automation

1. Connect pumps to the elevator's fluid tank (north side)
2. Place dock fluid tank within 5 tiles of dock
3. Manually trigger fluid transfers as needed
4. (Full fluid automation coming in future update)

### Multiple Elevators

You can build multiple elevators on the same planet! Use this for:
- Separate upload/download streams
- Different transfer rates for different cargo types
- Redundancy

---

## Settings & Configuration

Access these in Settings > Mod Settings > Space Elevator

### Startup Settings (Require Restart)

| Setting | Default | Range | Description |
|---------|---------|-------|-------------|
| Power Consumption | 10 MW | 1-100 MW | Base power draw |
| Fluid Tank Capacity | 25,000 | 1,000-100,000 | Units per tank |
| Construction Time Multiplier | 1.0x | 0.1-10.0x | Speed of construction |
| Material Cost Multiplier | 1.0x | 0.1-10.0x | Amount of materials needed |

### Runtime Settings (Change Anytime)

| Setting | Default | Range | Description |
|---------|---------|-------|-------------|
| Manual Item Transfer | 10 | 1-1,000 | Items per manual click |
| Auto Transfer Rate | 10 | 1-1,000 | Items per auto cycle |
| Manual Fluid Transfer | 1,000 | 100-10,000 | Fluid per click |
| Travel Time | 3 sec | 1-30 sec | Player transport duration |

### Debug Setting

| Setting | Default | Description |
|---------|---------|-------------|
| Show Debug Button | Off | Shows instant-complete button (for testing) |

---

## Troubleshooting

### "No platforms with docks found"

**Cause:** No space platform with a dock is orbiting this planet

**Solutions:**
- Ensure your platform is actually orbiting (not traveling)
- Check that you placed a Space Elevator Dock on the platform
- Verify you're on the same planet the platform orbits

### Items Not Transferring

**Cause:** Various

**Check these:**
1. Is the elevator connected? (Docking tab shows "Connected")
2. Are items in the cargo chest? (6 tiles SOUTH, not in elevator)
3. Is there enough power? (Energy bar should be full)
4. Is there space in the destination? (Dock has 48 slots)

### Fluids Not Transferring

**Cause:** Tank setup issue

**Check these:**
1. Is the dock fluid tank within 5 tiles of the dock?
2. Are both tanks connected to pipes?
3. Is there fluid in the source tank?
4. Is there space in the destination tank?

### Player Won't Teleport

**Cause:** Position or connection issue

**Check these:**
1. Are you close enough to the elevator/dock? (~10 tiles)
2. Is the elevator connected to a platform?
3. Is the elevator operational? (All 5 construction stages complete)

### Construction Won't Start

**Cause:** Missing materials

**Check these:**
1. Are materials in the cargo chest? (Not your inventory!)
2. Do you have enough of EACH required material?
3. Look for red text in the GUI - those materials are missing

### Elevator Disconnected Unexpectedly

**Cause:** Platform left orbit

**This is normal!** When your platform travels to another planet, it disconnects. Reconnect when it returns.

---

## FAQ

### Q: Can I build multiple elevators on one planet?
**A:** Yes! There's currently no limit. Build as many as you need.

### Q: Does the elevator work while I'm away?
**A:** Yes! Automatic transfers continue as long as:
- Power is available
- Items/fluids are in the source
- Space exists in the destination
- The elevator remains connected

### Q: Can I move the elevator after placing it?
**A:** Yes, you can mine it like any other building. However, construction progress is lost - you'll need to start over.

### Q: Why does Stage 3 need materials from every planet?
**A:** This is intentional! The space elevator is meant to be a late-game mega-project that requires a fully established interplanetary logistics network.

### Q: Is this more efficient than rockets?
**A:** It depends:
- **Upfront cost:** Elevator is MORE expensive (massive construction requirements)
- **Operating cost:** Elevator is LESS expensive (electricity only, no rocket fuel per launch)
- **Speed:** Elevator is FASTER for continuous transfers
- For frequent, ongoing transfers, the elevator wins. For occasional launches, rockets might be simpler.

### Q: Can I transfer between two different planets?
**A:** No. Each elevator only connects to platforms orbiting its own planet. For inter-planetary transfer, you still need platform travel.

### Q: What happens if I destroy the dock while connected?
**A:** The elevator automatically disconnects. Rebuild the dock and reconnect.

### Q: Can enemies attack the elevator?
**A:** Yes, the elevator can be damaged and destroyed like other structures. Protect it!

### Q: Why can't I see the beam effects?
**A:** Beam effects only appear during active transfers. If you're not seeing them:
- Make sure a transfer is actually happening
- Check that you're looking at the right location
- The beam goes straight up from the elevator

---

## Need More Help?

- **Report bugs:** [GitHub Issues](https://github.com/CaptainCrouton89/space-elevator/issues)
- **Discuss the mod:** Factorio Forums or Discord
- **Check for updates:** Factorio Mod Portal

Thank you for using Space Elevator! Enjoy your new interplanetary logistics network!
