-- Visual Effects Controller
-- Handles rendering of transfer beam effects for the space elevator

local visual_effects = {}

-- Beam configuration
local BEAM_CONFIG = {
  -- Upload beam (surface to platform) - blue
  upload = {
    color = {r = 0.2, g = 0.6, b = 1, a = 0.8},
    width = 5,
    time_to_live = 20,  -- ~0.33 seconds
    height = 60,  -- How far the beam extends upward
  },
  -- Download beam (platform to surface) - orange
  download = {
    color = {r = 1, g = 0.5, b = 0.1, a = 0.8},
    width = 5,
    time_to_live = 20,
    height = 60,
  },
  -- Fluid transfer beam - cyan/teal
  fluid_upload = {
    color = {r = 0, g = 0.8, b = 0.8, a = 0.7},
    width = 4,
    time_to_live = 25,
    height = 60,
  },
  fluid_download = {
    color = {r = 0.8, g = 0.4, b = 0, a = 0.7},
    width = 4,
    time_to_live = 25,
    height = 60,
  },
}

-- ============================================================================
-- Beam Drawing Functions
-- ============================================================================

-- Draw a transfer beam from the elevator
-- @param entity: The elevator entity
-- @param direction: "upload" or "download"
-- @param is_fluid: boolean, true for fluid transfers
function visual_effects.draw_transfer_beam(entity, direction, is_fluid)
  if not entity or not entity.valid then return end

  -- Select beam configuration
  local config_key = direction
  if is_fluid then
    config_key = "fluid_" .. direction
  end
  local config = BEAM_CONFIG[config_key] or BEAM_CONFIG.upload

  -- Calculate beam endpoints
  -- Beam originates from center of elevator and shoots upward
  local from_pos = entity.position
  local to_pos = {
    x = from_pos.x,
    y = from_pos.y - config.height,  -- Negative Y is up in Factorio
  }

  -- Draw the main beam
  rendering.draw_line{
    surface = entity.surface,
    from = from_pos,
    to = to_pos,
    color = config.color,
    width = config.width,
    time_to_live = config.time_to_live,
  }

  -- Draw a thinner inner beam for a "core" effect
  local inner_color = {
    r = math.min(1, config.color.r + 0.3),
    g = math.min(1, config.color.g + 0.3),
    b = math.min(1, config.color.b + 0.3),
    a = config.color.a * 0.6,
  }
  rendering.draw_line{
    surface = entity.surface,
    from = from_pos,
    to = to_pos,
    color = inner_color,
    width = math.max(1, config.width - 2),
    time_to_live = config.time_to_live,
  }
end

-- Draw beam for item transfers
function visual_effects.draw_item_upload_beam(entity)
  visual_effects.draw_transfer_beam(entity, "upload", false)
end

function visual_effects.draw_item_download_beam(entity)
  visual_effects.draw_transfer_beam(entity, "download", false)
end

-- Draw beam for fluid transfers
function visual_effects.draw_fluid_upload_beam(entity)
  visual_effects.draw_transfer_beam(entity, "upload", true)
end

function visual_effects.draw_fluid_download_beam(entity)
  visual_effects.draw_transfer_beam(entity, "download", true)
end

-- ============================================================================
-- Batch/Throttled Effects (for auto-transfers)
-- ============================================================================

-- Track last beam time per elevator to avoid excessive rendering
-- storage.last_beam_time[unit_number] = tick
local MIN_BEAM_INTERVAL = 15  -- Minimum ticks between beams (~0.25 seconds)

function visual_effects.init_storage()
  storage.last_beam_time = storage.last_beam_time or {}
end

-- Draw beam with throttling (for auto-transfers that happen frequently)
function visual_effects.draw_transfer_beam_throttled(entity, direction, is_fluid)
  if not entity or not entity.valid then return end

  visual_effects.init_storage()

  local unit_number = entity.unit_number
  local current_tick = game.tick
  local last_tick = storage.last_beam_time[unit_number] or 0

  if current_tick - last_tick >= MIN_BEAM_INTERVAL then
    visual_effects.draw_transfer_beam(entity, direction, is_fluid)
    storage.last_beam_time[unit_number] = current_tick
  end
end

-- Cleanup tracking for removed elevators
function visual_effects.cleanup_elevator(unit_number)
  if storage.last_beam_time then
    storage.last_beam_time[unit_number] = nil
  end
end

return visual_effects
