require "config"

rushstart.giveBeltItems = function(entity)
  local stuff = {
	{"transport-belt", 1000},
	{"underground-belt", 200},
	{"splitter", 100},
	{"assembling-machine-3", 200},
	{"steel-furnace", 250},
	{"electric-mining-drill", 300}
  }
  for _,v in ipairs(stuff) do
    entity.insert{name = v[1], count = v[2]}
  end
end

rushstart.giveRandomItems = function(entity)
  local stuff = {
	{"offshore-pump", 2},
    {"small-electric-pole", 50},
    {"small-lamp", 50},
	{"steel-plate", 200},
	{"copper-plate", 200},
	{"iron-plate", 200},
	{"pipe-to-ground", 50},
	{"pipe", 200},
	{"boiler", 20},
	{"steam-engine", 40},
	{"lab", 25},
	{"iron-chest", 50},
	{"fast-inserter", 150},
	{"inserter", 300},
	{"productivity-module-3", 25},
	{"speed-module-3", 25}
  }
  for _,v in ipairs(stuff) do
    entity.insert{name = v[1], count = v[2]}
  end
end

script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  player.insert{name = 'iron-axe', count = 1}
  player.insert{name = 'car', count = 1}
end)

script.on_event(defines.events.on_chunk_generated, function(event)
  local surface = event.surface;
  local ltx = event.area.left_top.x
  local lty = event.area.left_top.y
  if ltx == 0 and lty == 0 and rushstart.config.EquipmentInChest then
    local beltChest = surface.create_entity({name = "iron-chest", position={0,0}, force = game.forces.neutral})
	local randomChest = surface.create_entity({name = "iron-chest", position={0,1}, force = game.forces.neutral})
    rushstart.giveBeltItems(beltChest)
	rushstart.giveRandomItems(randomChest)
  end
end)