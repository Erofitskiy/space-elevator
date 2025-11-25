-- Space Elevator Entity Prototype
-- Based on rocket silo but modified for fast, cheap launches
--
-- Phase 1 Limitations:
-- - Uses standard rocket parts (but only 1 required per launch)
-- - Reuses rocket silo graphics
-- - Launch mechanics are same as rocket silo

-- Copy the rocket silo as our base
local space_elevator = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])

-- Rename and rebrand
space_elevator.name = "space-elevator"
space_elevator.minable.result = "space-elevator"

-- Key difference: Only 1 rocket part required per launch
-- This makes launches much cheaper than standard rocket silo (100 parts)
space_elevator.rocket_parts_required = 1

-- Higher constant energy consumption (late game should have power infrastructure)
space_elevator.energy_usage = "10MW"  -- Significant constant draw vs 250kW for rocket silo

-- Increase inventory size for construction materials
-- Default rocket silo has very limited cargo space, we need more for construction stages
space_elevator.rocket_result_inventory_size = 20  -- 20 slots for construction materials (default is 1)

-- Update localised name/description references
space_elevator.localised_name = {"entity-name.space-elevator"}
space_elevator.localised_description = {"entity-description.space-elevator"}

-- Create a custom rocket entity with higher weight capacity for construction materials
local elevator_rocket = table.deepcopy(data.raw["rocket-silo-rocket"]["rocket-silo-rocket"])
elevator_rocket.name = "space-elevator-rocket"

-- Increase the cargo weight capacity significantly
-- Default rockets have limited weight for space cargo, we need much more for construction
if elevator_rocket.inventory_size then
  elevator_rocket.inventory_size = 40  -- More slots
end

-- Increase weight capacity if this property exists
if elevator_rocket.weight_capacity then
  elevator_rocket.weight_capacity = 1000000000  -- 1 billion kg capacity
end

-- Try cargo_weight_capacity for Space Age rockets
if elevator_rocket.cargo_weight_capacity then
  elevator_rocket.cargo_weight_capacity = 1000000000
end

data:extend({elevator_rocket})

-- Link the space elevator to use our custom rocket
space_elevator.rocket_entity = "space-elevator-rocket"

-- Also try increasing the silo's own weight capacity if it has one
if space_elevator.cargo_weight_capacity then
  space_elevator.cargo_weight_capacity = 1000000000
end

data:extend({space_elevator})

-- ============================================================================
-- Companion Chest for Construction Materials
-- ============================================================================
-- This chest spawns alongside the elevator and holds construction materials
-- without weight limits. It's hidden/integrated into the elevator visually.

local construction_chest = table.deepcopy(data.raw["container"]["steel-chest"])
construction_chest.name = "space-elevator-chest"
construction_chest.inventory_size = 48  -- Large inventory for all construction materials
construction_chest.minable = nil  -- Cannot be mined separately (linked to elevator)
construction_chest.selectable_in_game = false  -- Not directly selectable
construction_chest.collision_mask = {layers = {}}  -- No collision (sits inside elevator)
construction_chest.localised_name = {"entity-name.space-elevator-chest"}
construction_chest.localised_description = {"entity-description.space-elevator-chest"}

-- Make it invisible (we access it through the elevator GUI)
construction_chest.picture = {
  filename = "__core__/graphics/empty.png",
  width = 1,
  height = 1,
}

data:extend({construction_chest})
