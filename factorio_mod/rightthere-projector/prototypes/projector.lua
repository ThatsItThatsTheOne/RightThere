local empty_sprite = {
  filename = "__core__/graphics/empty.png",
  width = 1,
  height = 1,
  priority = "extra-high",
  scale = 0.01
}

data:extend({
  {
    type = "item",
    name = "rt-projector-screen",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 64,
    subgroup = "circuit-network",
    order = "z[projector]-a[screen]",
    place_result = "rt-projector-screen",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "rt-projector-screen",
    enabled = true,
    ingredients = {
      {"electronic-circuit", 5},
      {"iron-plate", 5},
      {"copper-cable", 10}
    },
    result = "rt-projector-screen"
  },
  {
    type = "simple-entity-with-owner",
    name = "rt-projector-screen",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "rt-projector-screen"},
    max_health = 150,
    corpse = "small-remnants",
    render_layer = "object",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    pictures = {
      {
        filename = "__base__/graphics/entity/small-lamp/lamp.png",
        width = 83,
        height = 70,
        shift = {0.078125, -0.15625},
        scale = 0.5
      }
    }
  },
  {
    type = "custom-input",
    name = "rt-projector-toggle",
    key_sequence = "CONTROL + P",
    consuming = "none"
  },
  {
    type = "custom-input",
    name = "rt-projector-next-frame",
    key_sequence = "CONTROL + RIGHT",
    consuming = "none"
  }
})
