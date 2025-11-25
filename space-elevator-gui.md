# Space Elevator GUI Implementation

## Overview

This document describes the GUI implementation for the Space Elevator mod, which uses `entity-gui-lib` (v0.1.1) to create a custom entity GUI.

## Feature Request for entity-gui-lib

### Read-Only Inventory Display

The `create_inventory_display` helper is currently **read-only** - it displays inventory contents but does not allow players to directly insert or remove items by clicking slots.

**Current behavior:**
- Displays items in the inventory with slot buttons
- Clicking a slot triggers the `on_click` callback
- Players cannot drag items into/out of slots

**Requested enhancement:**
- Allow `create_inventory_display` to optionally support item insertion/removal
- Could add a parameter like `allow_interaction = true`
- When enabled, clicking an empty slot with a cursor stack would insert items
- Clicking a filled slot would pick up items to cursor

**Workaround used:**
- Added tip telling users to close the custom GUI to access vanilla inventory
- Use inserters to add items to the entity

---

## GUI Code Reference

### Remote Interface Registration

```lua
remote.add_interface("space_elevator", {
  -- Build the construction GUI
  build_elevator_gui = function(container, entity, player)
    local elevator_data = elevator_controller.get_elevator_data(entity.unit_number)

    -- Auto-register untracked elevators (e.g., spawned via command or from older saves)
    if not elevator_data then
      elevator_data = elevator_controller.register_elevator(entity)
    end

    -- Safety check
    if not elevator_data then
      container.add{type = "label", caption = "Error: Could not initialize elevator data"}
      return
    end

    local stage = elevator_data.construction_stage or 1
    local is_complete = stage >= construction_stages.STAGE_COMPLETE

    -- Create tabbed interface
    local _, tabs = remote.call("entity_gui_lib", "create_tabs", container, {
      {name = "construction", caption = is_complete and "Status" or "Construction"},
      {name = "materials", caption = "Materials"},
      {name = "info", caption = "Info"},
    })

    -- Construction Tab content...
    -- Materials Tab content...
    -- Info Tab content...
  end,

  -- Update callback for live refresh
  update_elevator_gui = function(content, entity, player)
    -- Updates progress bars every 20 ticks
  end,

  -- GUI close callback
  close_elevator_gui = function(entity, player)
    -- Optional cleanup
  end,

  -- Inventory click handler
  on_inventory_click = function(player, slot_index, item_stack, data)
    if item_stack then
      player.print("[Space Elevator] Slot " .. slot_index .. ": " .. item_stack.name .. " x" .. item_stack.count)
    end
  end,
})
```

### GUI Registration

```lua
local function register_gui()
  if remote.interfaces["entity_gui_lib"] then
    remote.call("entity_gui_lib", "register", {
      mod_name = "space_elevator",
      entity_name = "space-elevator",
      title = {"entity-name.space-elevator"},
      on_build = "build_elevator_gui",
      on_update = "update_elevator_gui",
      on_close = "close_elevator_gui",
      update_interval = 20,  -- Update every 20 ticks (~3 times/sec)
    })
  end
end
```

### Materials Tab with Inventory Display

```lua
-- Show current inventory contents
tabs.materials.add{
  type = "label",
  caption = "Current Inventory:",
  style = "bold_label",
}.style.top_margin = 12

local inventory = construction_stages.get_inventory(entity)
if inventory and #inventory > 0 then
  remote.call("entity_gui_lib", "create_inventory_display", tabs.materials, {
    inventory = inventory,
    columns = 10,
    show_empty = true,
    mod_name = "space_elevator",
    on_click = "on_inventory_click",
  })
else
  tabs.materials.add{
    type = "label",
    caption = "[No accessible inventory - use inserters or close GUI to access vanilla inventory]",
    style = "bold_red_label",
  }
end

-- Tip about inserting materials
tabs.materials.add{
  type = "label",
  caption = "Tip: Close this GUI to access the vanilla inventory slots, or use inserters.",
}.style.top_margin = 8
```

---

## Issues Encountered

### 1. Module Variables in Remote Callbacks

When using `require()` at the top of control.lua, the module variables (like `construction_stages.STAGE_COMPLETE`) can sometimes appear as `nil` inside remote interface callbacks.

**Solution:** Add defensive nil checks:
```lua
local stage = elevator_data.construction_stage or 1
if not construction_stages.STAGE_COMPLETE or stage >= construction_stages.STAGE_COMPLETE then return end
```

### 2. Untracked Entities

Entities spawned via console commands or from older saves won't be tracked by the mod's storage.

**Solution:** Auto-register on GUI open:
```lua
if not elevator_data then
  elevator_data = elevator_controller.register_elevator(entity)
end
```

### 3. Rocket Silo Inventory Access

Rocket silos have multiple inventory types. Inserters put items into `rocket_silo_rocket` (the rocket's cargo), not `rocket_silo_input`.

**Solution:** Check multiple inventory types in order:
```lua
local inventory_types = {
  defines.inventory.rocket_silo_rocket,   -- Where inserters put items
  defines.inventory.rocket_silo_input,    -- Alternative
  defines.inventory.chest,                -- Generic fallback
}
```

---

## Full control.lua

See: `space-elevator_0.1.0/control.lua`
