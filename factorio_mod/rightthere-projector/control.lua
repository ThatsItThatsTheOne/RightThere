local PROJECTOR_NAME = "rt-projector-screen"

local CLIPS = {
  sample_clip = {
    fps = 6,
    loop = true,
    frames = {
      "__base__/graphics/icons/small-lamp.png",
      "__base__/graphics/icons/radar.png",
      "__base__/graphics/icons/substation.png"
    }
  }
}

local function init_globals()
  global.projectors = global.projectors or {}
end

local function sprite_for(projector)
  local clip = CLIPS[projector.clip]
  if not clip then
    return nil
  end
  return clip.frames[projector.frame]
end

local function redraw(projector)
  if projector.render_id and rendering.is_valid(projector.render_id) then
    rendering.destroy(projector.render_id)
  end

  local sprite_path = sprite_for(projector)
  if not sprite_path then
    return
  end

  projector.render_id = rendering.draw_sprite({
    sprite = sprite_path,
    target = projector.entity,
    surface = projector.entity.surface,
    x_scale = 1,
    y_scale = 1,
    render_layer = "light-effect"
  })
end

local function register_entity(entity)
  if not (entity and entity.valid and entity.name == PROJECTOR_NAME) then
    return
  end

  global.projectors[entity.unit_number] = {
    entity = entity,
    clip = "sample_clip",
    frame = 1,
    playing = true,
    next_tick = game.tick + 10,
    render_id = nil
  }

  redraw(global.projectors[entity.unit_number])
end

local function remove_entity(entity)
  if not (entity and entity.valid and entity.unit_number) then
    return
  end
  local p = global.projectors[entity.unit_number]
  if p and p.render_id and rendering.is_valid(p.render_id) then
    rendering.destroy(p.render_id)
  end
  global.projectors[entity.unit_number] = nil
end

script.on_init(init_globals)
script.on_configuration_changed(init_globals)

script.on_event(defines.events.on_built_entity, function(event)
  register_entity(event.created_entity)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
  register_entity(event.created_entity)
end)

script.on_event(defines.events.script_raised_built, function(event)
  register_entity(event.entity)
end)

script.on_event({
  defines.events.on_player_mined_entity,
  defines.events.on_robot_mined_entity,
  defines.events.on_entity_died,
  defines.events.script_raised_destroy
}, function(event)
  remove_entity(event.entity)
end)

script.on_event(defines.events.on_tick, function(event)
  for _, projector in pairs(global.projectors) do
    if projector.entity and projector.entity.valid and projector.playing then
      local clip = CLIPS[projector.clip]
      if clip and event.tick >= projector.next_tick then
        projector.frame = projector.frame + 1
        if projector.frame > #clip.frames then
          projector.frame = clip.loop and 1 or #clip.frames
          projector.playing = clip.loop
        end
        projector.next_tick = event.tick + math.max(1, math.floor(60 / math.max(1, clip.fps)))
        redraw(projector)
      end
    end
  end
end)

script.on_event("rt-projector-toggle", function(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  local selected = player.selected
  if not (selected and selected.valid and selected.name == PROJECTOR_NAME and selected.unit_number) then
    player.print("Select a projector screen first.")
    return
  end

  local projector = global.projectors[selected.unit_number]
  if not projector then
    return
  end

  projector.playing = not projector.playing
  player.print(projector.playing and "Projector playing." or "Projector paused.")
end)

script.on_event("rt-projector-next-frame", function(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  local selected = player.selected
  if not (selected and selected.valid and selected.name == PROJECTOR_NAME and selected.unit_number) then
    player.print("Select a projector screen first.")
    return
  end

  local projector = global.projectors[selected.unit_number]
  local clip = projector and CLIPS[projector.clip] or nil
  if not clip then
    return
  end

  projector.frame = projector.frame + 1
  if projector.frame > #clip.frames then
    projector.frame = 1
  end
  redraw(projector)
end)
