--[[minetest.register_biome({
    name = "dagobah",
    node_top = "star_wars:mud",
    depth_top = 2,
    node_filler = "default:dirt",
    depth_filler = 3,
    node_stone = "default:stone",
    y_min = 1,
    y_max = 20,
    heat_point = 90,
    humidity_point = 95,
})

minetest.register_biome({
    name = "sorgan",
    node_top = "star_wars:sorgan_grass",
    depth_top = 1,
    node_filler = "default:dirt",
    depth_filler = 3,
    node_stone = "default:stone",
    node_water = "default:river_water_source",
    node_river_water = "default:river_water_source",
    node_riverbed = "default:sand",
    depth_riverbed = 2,
    node_underwater = "default:sand",
    y_min = -100,
    y_max = 20,
    heat_point = 50,
    humidity_point = 70,
})

minetest.register_biome({
    name = "tatooine",
    node_top = "star_wars:tatooine_sand",
    depth_top = 4,
    node_filler = "star_wars:tatooine_sand",
    depth_filler = 1,
    node_stone = "default:desert_stone",
    y_min = -100,
    y_max = 31000,
    heat_point = 80,
    humidity_point = 20,
})--]]

star_wars = star_wars or {}
star_wars.dimensions = star_wars.dimensions or {}

local modpath = minetest.get_modpath("star_wars")

-- ============================================================
-- PLANET GROUND CONFIG
-- ============================================================
star_wars.dimensions.terrain_config = {
    tatooine = {
        node_top = "star_wars:tatooine_sand",
        depth_top = 4,
        node_filler = "star_wars:tatooine_sand",
        depth_filler = 1,
        node_stone = "default:desert_stone",
        height_amplitude = 10,
        height_spread = 180,
        structures = {
            {
                schematic = modpath .. "/schematics/tusk_raider_dome_tent.mts",
                chance = 0.000025,
                place_offset_y = 0,
                spawn_fn = "spawn_raider_at",
            },
        },
        mob_spawns = {
            {
                entity = "star_wars:bantha",
                chance = 1 / 10000,
                min_group = 1,
                max_group = 2,
                spawn_on = "star_wars:tatooine_sand",
            },
        },
        ores = {
            { node = "default:stone_with_coal", chance = 0.006, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_gold", chance = 0.002, y_min = -31000, y_max = -50 },
        },
    },

    dagobah = {
        node_top = "star_wars:mud",
        depth_top = 2,
        node_filler = "default:dirt",
        depth_filler = 3,
        node_stone = "default:stone",
        dirt_patches = false,
        height_amplitude = 12,
        height_spread = 140,
        structures = {
            {
                schematic = modpath .. "/schematics/yoda_hut.mts",
                chance = 0.00001,
                place_offset_y = 0,
                spawn_fn = "spawn_yoda_at",
            },
        },
        ores = {
            { node = "default:stone_with_coal", chance = 0.010, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_iron", chance = 0.006, y_min = -31000, y_max = -20 },
        },
    },

    sorgan = {
        node_top = "star_wars:sorgan_grass",
        depth_top = 1,
        node_filler = "default:dirt",
        depth_filler = 3,
        node_stone = "default:stone",
        height_amplitude = 10,
        height_spread = 160,
        water_level_offset = -3,
        node_water = "default:river_water_source",
        node_riverbed = "default:sand",
        dirt_patches = false,
        trees = {
            schematic = modpath .. "/schematics/apple_tree.mts",
            chance = 0.004,
        },
        flowers = {
            {
                node = "flowers:chrysanthemum_green",
                chance = 0.003,
                group = false,
                group_size = { min = 3, max = 7 },
                cluster_radius = 0,
                spawn_on = { "star_wars:sorgan_grass" },
            },
        },
        mob_spawns = {
            {
                entity = "star_wars:arge_frog",
                chance = 1 / 400,
                min_group = 1,
                max_group = 2,
                spawn_on = "water",
            },
        },
        ores = {
            { node = "default:stone_with_coal", chance = 0.010, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_iron", chance = 0.010, y_min = -31000, y_max = -20 },
            { node = "star_wars:beskar_ore", chance = 0.010, y_min = -31000, y_max = -50 },
            { node = "star_wars:kyber_ore", chance = 0.010, y_min = -31000, y_max = -70 },
        },
    },

    mustafar = {
        node_top = "star_wars:mustafar_stone",
        depth_top = 3,
        node_filler = "star_wars:mustafar_stone",
        depth_filler = 4,
        node_stone = "default:stone",
        height_amplitude = 18,
        height_spread = 100,
        water_level_offset = -3,
        node_water = "default:lava_source",
        node_riverbed = "default:obsidian",
        ores = {
            { node = "default:stone_with_coal", chance = 0.004, y_min = -31000, y_max = 0 },
            { node = "default:obsidian", chance = 0.004, y_min = -31000, y_max = -25 },
            { node = "default:stone_with_gold", chance = 0.004, y_min = -31000, y_max = -50 },
            { node = "default:stone_with_diamond", chance = 0.0005, y_min = -31000, y_max = -75 },
        },
    },

    hoth = {
        node_top = "star_wars:hoth_snow",
        depth_top = 3,
        node_filler = "star_wars:hoth_snow",
        depth_filler = 3,
        node_stone = "star_wars:hoth_stone",
        height_amplitude = 14,
        height_spread = 150,
        water_level_offset = -3,
        node_water = "default:ice",
        node_riverbed = "default:ice",
        structures = {
            {
                schematic = modpath .. "/schematics/wampa_cave.mts",
                chance = 0.0001,
                place_offset_y = 0,
                spawn_fn = "spawn_wampa_at",
            },
        },
        mob_spawns = {
            {
                entity = "star_wars:tauntaun",
                chance = 1 / 10000,
                min_group = 1,
                max_group = 2,
                spawn_on = "star_wars:hoth_snow",
            },
        },
        ores = {
            { node = "default:stone_with_coal", chance = 0.006, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_iron", chance = 0.006, y_min = -31000, y_max = -20 },
        },
    },

    naboo = {
        node_top = "default:dirt_with_grass",
        depth_top = 1,
        node_filler = "default:dirt",
        depth_filler = 3,
        node_stone = "default:stone",
        height_amplitude = 10,
        height_spread = 180,
        water_level_offset = -3,
        node_water = "default:water_source",
        node_riverbed = "default:sand",
        dirt_patches = false,
        trees = {
            schematic = modpath .. "/schematics/apple_tree.mts",
            chance = 0.004,
        },
        flowers = {
            {
                node = "flowers:dandelion_yellow",
                chance = 0.0003,
                group = true,
                group_size = { min = 3, max = 5 },
                min_spacing = 4,
                spawn_on = { "default:dirt_with_grass" },
            },
            {
                node = "flowers:dandelion_white",
                chance = 0.0001,
                group = true,
                group_size = { min = 1, max = 3 },
                min_spacing = 4,
                spawn_on = { "default:dirt_with_grass" },
            },
        },
        structures = {
            {
                schematic = modpath .. "/schematics/sith_cave.mts",
                chance = 0.00001,
                place_offset_y = 0,
                spawn_fn = "spawn_sidious_at",
            },
        },
        ores = {
            { node = "default:stone_with_coal", chance = 0.010, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_iron", chance = 0.010, y_min = -31000, y_max = -20 },
            { node = "star_wars:beskar_ore", chance = 0.010, y_min = -31000, y_max = -50 },
            { node = "star_wars:kyber_ore", chance = 0.010, y_min = -31000, y_max = -70 },

        },
    },

    endor = {
        node_top = "default:dirt_with_grass",
        depth_top = 1,
        node_filler = "default:dirt",
        depth_filler = 3,
        node_stone = "default:stone",
        height_amplitude = 10,
        height_spread = 180,
        water_level_offset = -3,
        node_water = "default:water_source",
        node_riverbed = "default:sand",
        dirt_patches = true,
        trees = {
            schematic = modpath .. "/schematics/endor_tree.mts",
            chance = 0.01,
        },
        structures = {
            {
                schematic = modpath .. "/schematics/ewok_tree.mts",
                chance = 0.002,
                place_offset_y = 0,
                spawn_fn = "spawn_ewok_at",
            },
        },
        ores = {
            { node = "default:stone_with_coal", chance = 0.010, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_iron", chance = 0.010, y_min = -31000, y_max = -20 },
            { node = "star_wars:beskar_ore", chance = 0.010, y_min = -31000, y_max = -50 },
            { node = "star_wars:kyber_ore", chance = 0.010, y_min = -31000, y_max = -75 },
            { node = "star_wars:laser_core_ore", chance = 0.010, y_min = -31000, y_max = -30 },
            { node = "default:stone_with_diamond", chance = 0.0007, y_min = -31000, y_max = -100 },
        },
    },

    geonosis = {
        node_top = "default:desert_sand",
        depth_top = 1,
        node_filler = "default:desert_sand",
        depth_filler = 4,
        node_stone = "default:desert_stone",
        height_amplitude = 10,
        height_spread = 180,
        ores = {
            { node = "default:stone_with_coal", chance = 0.006, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_gold", chance = 0.006, y_min = -31000, y_max = -20 },
        },
    },

    kashyyyk = {
        node_top = "default:dirt_with_grass",
        depth_top = 1,
        node_filler = "default:dirt",
        depth_filler = 4,
        node_stone = "default:stone",
        height_amplitude = 10,
        height_spread = 160,
        water_level_offset = -3,
        node_water = "default:river_water_source",
        node_riverbed = "default:sand",
        dirt_patches = false,
        trees = {
           schematic = modpath .. "/schematics/jungle_tree.mts",
           chance = 0.004,
        },
        flowers = {
            {
                node = "flowers:chrysanthemum_green",
                chance = 0.0002,
                group = false,
                min_spacing = 4,
                spawn_on = { "default:dirt_with_grass" },
            },
        },
        mob_spawns = {
            {
                entity = "star_wars:wookee",
                chance = 1 / 10000,
                min_group = 1,
                max_group = 1,
                spawn_on = "default:dirt_with_grass",
            },
        },
        ores = {
            { node = "default:stone_with_coal", chance = 0.010, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_iron", chance = 0.010, y_min = -31000, y_max = -20 },
            { node = "star_wars:beskar_ore", chance = 0.010, y_min = -31000, y_max = -50 },
            { node = "star_wars:kyber_ore", chance = 0.010, y_min = -31000, y_max = -75 },
        },
    },
    coruscant = {
        node_top = "default:stone_block",
        depth_top = 1,
        node_filler = "default:dirt",
        depth_filler = 4,
        node_stone = "default:stone",
        height_amplitude = 2,
        height_spread = 180,
        structures = {
          {
           schematic = modpath .. "/schematics/coruscant_building.mts",
           chance = 1,
           place_offset_y = 0,
         },
        },
        ores = {
            { node = "default:stone_with_coal", chance = 0.006, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_iron", chance = 0.006, y_min = -31000, y_max = -20 },
            { node = "default:stone_with_diamond", chance = 0.0006, y_min = -31000, y_max = -50 },
        },
    },
    deralia = {
      node_top = "default:dirt_with_grass",
      depth_top = 1,
      node_filler = "default:dirt",
      depth_filler = 4,
      node_stone = "default:stone",
      height_amplitude = 10,
      dirt_patches = false,
      height_spread = 180,
      water_level_offset = 0,
      node_water = "default:water_source",
      node_riverbed = "default:sand",
      trees = {
           schematic = modpath .. "/schematics/apple_tree.mts",
           chance = 0.004,
      },
      flowers = {
            {
                node = "flowers:chrysanthemum_green",
                chance = 0.0002,
                group = false,
                min_spacing = 4,
                spawn_on = { "default:dirt_with_grass" },
            },
        },
      ores = {
            { node = "default:stone_with_coal", chance = 0.006, y_min = -31000, y_max = 0 },
            { node = "default:stone_with_iron", chance = 0.006, y_min = -31000, y_max = -20 },
            { node = "default:stone_with_gold", chance = 0.006, y_min = -31000, y_max = -50 },
        },
    }
}

-- ============================================================
-- BIOME REGISTRATION
-- ============================================================
for planet_name, cfg in pairs(star_wars.dimensions.terrain_config) do
    local planet = star_wars.dimensions.planets[planet_name]
    if planet then
        minetest.register_biome({
            name = planet_name,
            node_top = cfg.node_top,
            depth_top = cfg.depth_top,
            node_filler = cfg.node_filler,
            depth_filler = cfg.depth_filler,
            node_stone = cfg.node_stone,
            node_water = cfg.node_water,
            y_min = planet.y_base - star_wars.dimensions.SHELL_HALF_HEIGHT,
            y_max = planet.y_base + star_wars.dimensions.SHELL_HALF_HEIGHT,
            heat_point = 50,
            humidity_point = 50,
        })
    end
end

-- ============================================================
-- HELPERS
-- ============================================================
local content_id_cache = {}
local function get_cid(name)
    local cid = content_id_cache[name]
    if not cid then
        cid = minetest.get_content_id(name)
        content_id_cache[name] = cid
    end
    return cid
end

local c_air = minetest.CONTENT_AIR

local full_schematic_cache = {}
local function get_full_schematic(path)
    local cached = full_schematic_cache[path]
    if cached then
        return cached
    end

    local schem = minetest.read_schematic(path, {write_yslice_prob = "none"})
    if not schem then
        full_schematic_cache[path] = path
        return path
    end

    for _, node in ipairs(schem.data) do
        node.param1 = 255
        node.force_place = true
    end

    schem.yslice_prob = {}
    full_schematic_cache[path] = schem
    return schem
end

local function is_valid_surface(pos)
    local below = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
    local here  = minetest.get_node({x = pos.x, y = pos.y, z = pos.z})
    local above = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z})

    if not below or not here or not above then
        return false
    end

    local solid = minetest.get_item_group(below.name, "soil") > 0
        or minetest.get_item_group(below.name, "stone") > 0
        or (minetest.registered_nodes[below.name]
        and minetest.registered_nodes[below.name].walkable == true)

    local open = here.name == "air" and above.name == "air"
    return solid and open
end

local noise_objects = {}
local function get_noise(planet_name, cfg)
    local noise = noise_objects[planet_name]
    if not noise then
        noise = minetest.get_perlin({
            offset = 0,
            scale = cfg.height_amplitude,
            spread = {x = cfg.height_spread, y = cfg.height_spread, z = cfg.height_spread},
            seed = 133713 + #planet_name * 9973,
            octaves = 3,
            persistence = 0.5,
            lacunarity = 2.0,
        })
        noise_objects[planet_name] = noise
    end
    return noise
end

function star_wars.dimensions.get_surface_y(planet_name, x, z)
    local cfg = star_wars.dimensions.terrain_config[planet_name]
    local planet = star_wars.dimensions.planets[planet_name]
    if not cfg or not planet then
        return nil
    end

    local noise = get_noise(planet_name, cfg)
    local h = math.floor(planet.y_base + noise:get2d({x = x, y = z}))

    if cfg.water_level_offset then
        local water_y = planet.y_base + cfg.water_level_offset
        if h < water_y then
            return water_y
        end
    end

    return h
end

local logged_margins = {}
local function get_schematic_margin(schem, debug_label)
    local margin
    local size_known = type(schem) == "table" and schem.size

    if size_known then
        margin = math.max(
            math.ceil(schem.size.x / 2) + 1,
            math.ceil(schem.size.z / 2) + 1
        )
    else
        margin = 16
    end

    if debug_label and not logged_margins[debug_label] then
        logged_margins[debug_label] = true
        if size_known then
            minetest.log("action", "[star_wars] schematic margin for " .. debug_label ..
                ": size=" .. schem.size.x .. "x" .. schem.size.y .. "x" .. schem.size.z ..
                " -> margin=" .. margin)
        else
            minetest.log("action", "[star_wars] schematic margin for " .. debug_label ..
                ": size unknown -> margin=" .. margin)
        end
    end

    return margin
end

-- ============================================================
-- CAVE NOISE (3D carving)
-- ============================================================
local DEFAULT_CAVE_CFG = {
    threshold = 0.62,
    spread = 55,
    min_depth_below_surface = 5, -- keep caves from opening holes right at the surface
}

local cave_noise_objects = {}
local function get_cave_noise(planet_name, cave_cfg)
    local noise = cave_noise_objects[planet_name]
    if not noise then
        noise = minetest.get_perlin({
            offset = 0,
            scale = 1,
            spread = {x = cave_cfg.spread, y = cave_cfg.spread, z = cave_cfg.spread},
            seed = 990011 + #planet_name * 7919,
            octaves = 4,
            persistence = 0.55,
            lacunarity = 2.0,
        })
        cave_noise_objects[planet_name] = noise
    end
    return noise
end

-- ============================================================
-- DIRT PATCH NOISE (2D surface decoration)
-- ============================================================
local DEFAULT_DIRT_PATCH_CFG = {
    threshold = 0.55, -- higher = fewer/smaller patches
    spread = 8,        -- lower = smaller, more scattered patches
}

local dirt_patch_noise_objects = {}
local function get_dirt_patch_noise(planet_name, patch_cfg)
    local noise = dirt_patch_noise_objects[planet_name]
    if not noise then
        noise = minetest.get_perlin({
            offset = 0,
            scale = 1,
            spread = {x = patch_cfg.spread, y = patch_cfg.spread, z = patch_cfg.spread},
            seed = 445566 + #planet_name * 6151,
            octaves = 2,
            persistence = 0.5,
            lacunarity = 2.0,
        })
        dirt_patch_noise_objects[planet_name] = noise
    end
    return noise
end

-- ============================================================
-- PLACED STRUCTURE PROTECTION
-- ============================================================
star_wars.dimensions._placed_boxes = star_wars.dimensions._placed_boxes or {}

local function register_placed_box(pos, schem_size)
    if not schem_size then return end
    local half_x = math.ceil(math.max(schem_size.x, schem_size.z) / 2) + 1
    local half_z = half_x

    table.insert(star_wars.dimensions._placed_boxes, {
        minp = {x = pos.x - half_x, y = pos.y, z = pos.z - half_z},  -- ήταν pos.y - 1
        maxp = {x = pos.x + half_x, y = pos.y + schem_size.y + 1, z = pos.z + half_z},
    })
end

local function get_overlapping_boxes(minp, maxp)
    local result = {}
    for _, box in ipairs(star_wars.dimensions._placed_boxes) do
        local overlap =
            box.minp.x <= maxp.x and box.maxp.x >= minp.x and
            box.minp.y <= maxp.y and box.maxp.y >= minp.y and
            box.minp.z <= maxp.z and box.maxp.z >= minp.z

        if overlap then
            table.insert(result, box)
        end
    end
    return result
end

local function pos_too_close_to_any_box(pos, radius)
    for _, box in ipairs(star_wars.dimensions._placed_boxes) do
        local cx = math.max(box.minp.x, math.min(pos.x, box.maxp.x))
        local cy = math.max(box.minp.y, math.min(pos.y, box.maxp.y))
        local cz = math.max(box.minp.z, math.min(pos.z, box.maxp.z))
        local dx, dz = pos.x - cx, pos.z - cz
        if (dx * dx + dz * dz) <= radius * radius then
            return true
        end
    end
    return false
end

local function pos_in_any_box(x, y, z, boxes)
    for _, box in ipairs(boxes) do
        if x >= box.minp.x and x <= box.maxp.x
            and y >= box.minp.y and y <= box.maxp.y
            and z >= box.minp.z and z <= box.maxp.z then
            return true
        end
    end
    return false
end

-- ============================================================
-- GENERATION
-- ============================================================

local function generate_planet_chunk(minp, maxp, planet_name, cfg, y_base)
    local noise = get_noise(planet_name, cfg)
    local water_y = cfg.water_level_offset and (y_base + cfg.water_level_offset) or nil

    local cave_cfg = cfg.caves or DEFAULT_CAVE_CFG
    local cave_noise = get_cave_noise(planet_name, cave_cfg)

    -- dirt patches: only set up the noise/threshold if this planet uses them
    local dirt_patch_cfg = cfg.dirt_patch_cfg or DEFAULT_DIRT_PATCH_CFG
    local dirt_patch_threshold = dirt_patch_cfg.threshold or DEFAULT_DIRT_PATCH_CFG.threshold
    local dirt_patch_noise = cfg.dirt_patches and get_dirt_patch_noise(planet_name, dirt_patch_cfg) or nil
    local c_dirt_patch = cfg.dirt_patches and get_cid("default:dirt") or nil

    local vm = minetest.get_voxel_manip()
    local emin, emax = vm:read_from_map(minp, maxp)
    local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
    local data = vm:get_data()

    -- find any already-placed structures/trees that overlap this chunk
    local protected_boxes = get_overlapping_boxes(minp, maxp)

    local c_top = get_cid(cfg.node_top)
    local c_filler = get_cid(cfg.node_filler)
    local c_stone = get_cid(cfg.node_stone)
    local c_water = cfg.node_water and get_cid(cfg.node_water) or nil
    local c_riverbed = cfg.node_riverbed and get_cid(cfg.node_riverbed) or nil

    local surface_positions = {}
    local water_positions = {}

    for z = minp.z, maxp.z do
        for x = minp.x, maxp.x do
            local h = math.floor(y_base + noise:get2d({x = x, y = z}))
            local top_cutoff = h - cfg.depth_top
            local filler_cutoff = top_cutoff - cfg.depth_filler
            local is_underwater = water_y and h < water_y

            local use_dirt_patch_here = c_dirt_patch and not is_underwater
                and dirt_patch_noise:get2d({x = x, y = z}) > dirt_patch_threshold

            for y = minp.y, maxp.y do
                -- skip writing over a protected (already placed) structure
                if #protected_boxes == 0 or not pos_in_any_box(x, y, z, protected_boxes) then
                    local vi = area:index(x, y, z)

                    if y <= h then
                        if is_underwater and y > top_cutoff and c_riverbed then
                            data[vi] = c_riverbed
                        elseif y > top_cutoff then
                            -- dirt patches only swap the single topmost node (y == h),
                            -- so grass/mud/etc. still fills the rest of depth_top normally
                            if use_dirt_patch_here and y == h then
                                data[vi] = c_dirt_patch
                            else
                                data[vi] = c_top
                            end
                        elseif y > filler_cutoff then
                            data[vi] = c_filler
                        else
                            -- stone layer: carve caves + place ores here
                            local is_carved = false

                            if (h - y) >= (cave_cfg.min_depth_below_surface or 5) then
                                local n = cave_noise:get3d({x = x, y = y, z = z})
                                if n > cave_cfg.threshold then
                                    is_carved = true
                                end
                            end

                            if is_carved then
                                data[vi] = c_air
                            else
                                data[vi] = c_stone

                                if cfg.ores then
                                    local rel_y = y - y_base
                                    for _, ore in ipairs(cfg.ores) do
                                        if rel_y >= ore.y_min and rel_y <= ore.y_max
                                            and math.random() < ore.chance then
                                            data[vi] = get_cid(ore.node)
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    elseif is_underwater and y <= water_y and c_water then
                        data[vi] = c_water
                    else
                        data[vi] = c_air
                    end
                end
            end

            if not is_underwater and h >= minp.y and h <= maxp.y then
                -- ground_node reflects what's actually visible on top (dirt patch
                -- included), so flower spawn_on checks see the real surface node
                local ground_node
                if use_dirt_patch_here then
                    ground_node = "default:dirt"
                elseif h > top_cutoff then
                    ground_node = cfg.node_top
                elseif h > filler_cutoff then
                    ground_node = cfg.node_filler
                else
                    ground_node = cfg.node_stone
                end
                table.insert(surface_positions, {x = x, y = h + 1, z = z, ground_node = ground_node})
            elseif is_underwater and water_y >= minp.y and water_y <= maxp.y then
                local ground_node = c_riverbed and cfg.node_riverbed or cfg.node_filler
                table.insert(water_positions, {x = x, y = water_y, z = z, ground_node = ground_node})
            end
        end
    end

    vm:set_data(data)
    vm:set_lighting({day = 15, night = 0})
    vm:calc_lighting()
    vm:write_to_map(true)

    local queued_placements = {}
    local queued_mobs = {}

    local valid_surface_positions = {}
    for _, pos in ipairs(surface_positions) do
        if is_valid_surface(pos) then
            table.insert(valid_surface_positions, pos) -- pos already carries .ground_node
        end
    end

    if cfg.trees then
        local tree_schem = get_full_schematic(cfg.trees.schematic)
        local margin = get_schematic_margin(tree_schem, planet_name .. ":trees")

        local tree_size = type(tree_schem) == "table" and tree_schem.size or nil
        -- Minimum distance between two tree anchors so their bounding
        -- boxes (and force-placed air cells) can't overlap/clip each other.
        local min_spacing = tree_size
            and (math.ceil(math.max(tree_size.x, tree_size.z) / 2) * 2 + 1)
            or 5

        local tree_candidates = 0
        local tree_placed = 0
        local tree_skipped_too_close = 0

        for _, pos in ipairs(valid_surface_positions) do
            local away_from_edge =
                pos.x >= minp.x + margin and pos.x <= maxp.x - margin and
                pos.z >= minp.z + margin and pos.z <= maxp.z - margin

            if away_from_edge then
                tree_candidates = tree_candidates + 1

                if math.random() < cfg.trees.chance then
                    if pos_too_close_to_any_box(pos, min_spacing) then
                        tree_skipped_too_close = tree_skipped_too_close + 1
                    else
                       table.insert(queued_placements, {
                            kind = "tree",
                            pos = {
                            x = pos.x,
                            y = pos.y + (cfg.trees.place_offset_y or 0),
                            z = pos.z,
                        },
                        schem = tree_schem,
                        _ground_node = cfg.node_top,
                        rotation = cfg.trees.rotation or "0",
                    })
                        tree_placed = tree_placed + 1

                        if tree_size then
                            register_placed_box(pos, tree_size)
                        end
                    end
                end
            end
        end

        if tree_candidates > 0 then
            minetest.log("action", "[star_wars] trees " .. planet_name ..
                ": candidates=" .. tree_candidates ..
                " placed=" .. tree_placed ..
                " skipped_too_close=" .. tree_skipped_too_close ..
                " chance=" .. cfg.trees.chance)
        end
    end

    if cfg.structures and #valid_surface_positions > 0 then
        local structure_placed = false

        for _, struct in ipairs(cfg.structures) do
            if not structure_placed then
                local struct_schem = get_full_schematic(struct.schematic)
                local margin = get_schematic_margin(struct_schem, planet_name .. ":" .. struct.schematic)

                local candidates = {}
                for _, pos in ipairs(valid_surface_positions) do
                    local away_from_edge =
                        pos.x >= minp.x + margin and pos.x <= maxp.x - margin and
                        pos.z >= minp.z + margin and pos.z <= maxp.z - margin

                    if away_from_edge then
                        table.insert(candidates, pos)
                    end
                end

                if #candidates > 0 then
                    local roll_chance = math.min(1, struct.chance * #candidates)
                    local roll = math.random()

                    minetest.log("action", "[star_wars] structure roll " .. planet_name ..
                        "/" .. struct.schematic .. ": candidates=" .. #candidates ..
                        " roll_chance=" .. string.format("%.4f", roll_chance) ..
                        " roll=" .. string.format("%.4f", roll))

                    if roll < roll_chance then
                        local pos = candidates[math.random(#candidates)]

                        if pos_too_close_to_any_box(pos, margin) then
                            -- Very rare edge case: candidate collides with something
                            -- else placed this same tick. Skip this roll entirely.
                            structure_placed = false
                        else
                            local place_pos = {
                                x = pos.x,
                                y = pos.y + (struct.place_offset_y or 0),
                                z = pos.z,
                            }

                            local spawn_pos = {
                                x = pos.x,
                                y = pos.y + 2,
                                z = pos.z,
                            }

                            table.insert(queued_placements, {
                                kind = "structure",
                                pos = place_pos,
                                schem = struct_schem,
                                spawn_fn = struct.spawn_fn,
                                spawn_pos = spawn_pos,
                                rotation = struct.rotation or "random",
                            })

                            -- Register right away so this same tick's remaining
                            -- rolls (and neighbor chunks) respect the reservation.
                            if type(struct_schem) == "table" and struct_schem.size then
                                register_placed_box(place_pos, struct_schem.size)
                            end

                            minetest.log("action", "[star_wars] structure PLACED " .. planet_name ..
                                "/" .. struct.schematic .. " at " ..
                                minetest.pos_to_string(place_pos))

                            structure_placed = true
                        end
                    end
                end
            end
        end
    end

    if cfg.flowers then
        for _, flower in ipairs(cfg.flowers) do
            local allowed_nodes = flower.spawn_on or {cfg.node_top}

            local candidates = {}
            for _, pos in ipairs(valid_surface_positions) do
                local ok_ground = false
                for _, allowed in ipairs(allowed_nodes) do
                    if pos.ground_node == allowed then
                        ok_ground = true
                        break
                    end
                end
                if ok_ground then
                    table.insert(candidates, pos)
                end
            end

            local flower_chance = flower.chance or 0.01
            local flower_placed = 0

            if flower.group then
                -- clustered: each successful roll spawns a small group of
                -- flowers close together around the roll position
                local cluster_min = (flower.group_size and flower.group_size.min) or 3
                local cluster_max = (flower.group_size and flower.group_size.max) or 6
                local cluster_radius = flower.cluster_radius or 2

                for _, pos in ipairs(candidates) do
                    if math.random() < flower_chance then
                        local nearby = {}
                        for _, p2 in ipairs(candidates) do
                            local dx, dz = p2.x - pos.x, p2.z - pos.z
                            if (dx * dx + dz * dz) <= cluster_radius * cluster_radius then
                                table.insert(nearby, p2)
                            end
                        end

                        local cluster_count = math.min(math.random(cluster_min, cluster_max), #nearby)
                        for i = 1, cluster_count do
                            local p = table.remove(nearby, math.random(#nearby))
                            table.insert(queued_placements, {
                                kind = "flower",
                                pos = {x = p.x, y = p.y, z = p.z},
                                node = flower.node,
                            })
                            flower_placed = flower_placed + 1
                        end
                    end
                end
            else
                -- solitary: keep a minimum distance from other flowers of the
                -- same entry so they don't clump together
                local min_spacing = flower.min_spacing or 3
                local placed_positions = {}

                for _, pos in ipairs(candidates) do
                    if math.random() < flower_chance then
                        local too_close = false
                        for _, ppos in ipairs(placed_positions) do
                            local dx, dz = pos.x - ppos.x, pos.z - ppos.z
                            if (dx * dx + dz * dz) < (min_spacing * min_spacing) then
                                too_close = true
                                break
                            end
                        end

                        if not too_close then
                            table.insert(placed_positions, pos)
                            table.insert(queued_placements, {
                                kind = "flower",
                                pos = {x = pos.x, y = pos.y, z = pos.z},
                                node = flower.node,
                            })
                            flower_placed = flower_placed + 1
                        end
                    end
                end
            end

            if #candidates > 0 then
                minetest.log("action", "[star_wars] flowers " .. planet_name ..
                    "/" .. flower.node .. ": candidates=" .. #candidates ..
                    " placed=" .. flower_placed ..
                    " group=" .. tostring(flower.group))
            end
        end
    end

    if cfg.mob_spawns then
        for _, spawn_cfg in ipairs(cfg.mob_spawns) do
            local spawn_on = spawn_cfg.spawn_on or "surface"
            local candidate_positions = (spawn_on == "water") and water_positions or valid_surface_positions

            for _, pos in ipairs(candidate_positions) do
                local node_ok = true
                if spawn_cfg.nodes then
                    node_ok = false
                    for _, allowed in ipairs(spawn_cfg.nodes) do
                        if pos.ground_node == allowed then
                            node_ok = true
                            break
                        end
                    end
                end

                if node_ok and math.random() < spawn_cfg.chance then
                    local group_size = math.random(spawn_cfg.min_group or 1, spawn_cfg.max_group or 1)
                    for _ = 1, group_size do
                        local jitter = {
                            x = pos.x + math.random(-2, 2),
                            y = pos.y,
                            z = pos.z + math.random(-2, 2),
                        }
                        table.insert(queued_mobs, {
                            pos = jitter,
                            entity = spawn_cfg.entity,
                        })
                    end
                end
            end
        end
    end

    if #queued_placements > 0 or #queued_mobs > 0 then
        minetest.after(0, function()
            for _, p in ipairs(queued_placements) do
                if p.kind == "flower" then
                    -- simple single-node placement, no schematic involved
                    if minetest.registered_nodes[p.node] then
                        local existing = minetest.get_node(p.pos)
                        if existing.name == "air" then
                            minetest.set_node(p.pos, {name = p.node})
                        end
                    end
                else
                    -- Safety net: guarantee solid ground directly under the anchor,
                    -- in case terrain writing was skipped there for any reason.
                    if p.kind == "tree" then
                        local below = {x = p.pos.x, y = p.pos.y - 1, z = p.pos.z}
                        local below_node = minetest.get_node(below)
                        local below_def = below_node and minetest.registered_nodes[below_node.name]
                        if not below_def or not below_def.walkable then
                            minetest.set_node(below, {name = p._ground_node or "default:dirt"})
                        end
                    end

                    minetest.place_schematic(
                        p.pos,
                        p.schem,
                        p.rotation or "random",
                        nil,
                        true,
                        "place_center_x, place_center_z"
                    )

                    if p.spawn_fn and p.spawn_pos and star_wars[p.spawn_fn] then
                        star_wars[p.spawn_fn](p.spawn_pos)
                    end
                end
            end

            for _, m in ipairs(queued_mobs) do
                minetest.add_entity(m.pos, m.entity)
            end
        end)
    end
end

local function safe_generate_planet_chunk(minp, maxp, planet_name, cfg, y_base)
    local ok, err = pcall(generate_planet_chunk, minp, maxp, planet_name, cfg, y_base)
    if not ok then
        minetest.log("error", "[star_wars] terrain generation failed for '" .. planet_name .. "': " .. tostring(err))
    end
end

minetest.register_on_generated(function(minp, maxp, seed)
    for planet_name, cfg in pairs(star_wars.dimensions.terrain_config) do
        local planet = star_wars.dimensions.planets[planet_name]
        if planet then
            local y_base = planet.y_base
            local shell_bottom = y_base - star_wars.dimensions.SHELL_HALF_HEIGHT
            local shell_top = y_base + star_wars.dimensions.SHELL_HALF_HEIGHT

            if maxp.y >= shell_bottom and minp.y <= shell_top then
                safe_generate_planet_chunk(minp, maxp, planet_name, cfg, y_base)
            end
        end
    end
end)

-- ============================================================
-- FORCE GENERATION
-- ============================================================
local storage = minetest.get_mod_storage()
local FORCE_CHUNK_SIZE = 80 -- πρέπει να ταιριάζει περίπου με το mapgen chunksize (default 5*16)

local generated_chunks = minetest.deserialize(storage:get_string("generated_chunks")) or {}

local function save_generated_chunks()
    storage:set_string("generated_chunks", minetest.serialize(generated_chunks))
end

local function chunk_key(planet_name, cx, cz)
    return planet_name .. ":" .. cx .. ":" .. cz
end

local function mark_chunk_generated(planet_name, cx, cz)
    generated_chunks[chunk_key(planet_name, cx, cz)] = true
end

local function is_chunk_generated(planet_name, cx, cz)
    return generated_chunks[chunk_key(planet_name, cx, cz)] == true
end

local function mark_covered_chunks(planet_name, minp, maxp)
    local cx1 = math.floor(minp.x / FORCE_CHUNK_SIZE)
    local cx2 = math.floor(maxp.x / FORCE_CHUNK_SIZE)
    local cz1 = math.floor(minp.z / FORCE_CHUNK_SIZE)
    local cz2 = math.floor(maxp.z / FORCE_CHUNK_SIZE)
    for cx = cx1, cx2 do
        for cz = cz1, cz2 do
            mark_chunk_generated(planet_name, cx, cz)
        end
    end
    save_generated_chunks()
end

local function get_planet_at_y(y)
    for planet_name, cfg in pairs(star_wars.dimensions.terrain_config) do
        local planet = star_wars.dimensions.planets[planet_name]
        if planet then
            local shell_bottom = planet.y_base - star_wars.dimensions.SHELL_HALF_HEIGHT
            local shell_top = planet.y_base + star_wars.dimensions.SHELL_HALF_HEIGHT
            if y >= shell_bottom and y <= shell_top then
                return planet_name, cfg, planet.y_base
            end
        end
    end
    return nil
end

local pending_chunks = {}

function star_wars.dimensions.ensure_generated(pos, radius_chunks)
    radius_chunks = radius_chunks or 0
    local planet_name, cfg, y_base = get_planet_at_y(pos.y)
    if not planet_name then return end

    local pcx = math.floor(pos.x / FORCE_CHUNK_SIZE)
    local pcz = math.floor(pos.z / FORCE_CHUNK_SIZE)

    for cx = pcx - radius_chunks, pcx + radius_chunks do
        for cz = pcz - radius_chunks, pcz + radius_chunks do
            local key = chunk_key(planet_name, cx, cz)

            if not is_chunk_generated(planet_name, cx, cz) and not pending_chunks[key] then
                pending_chunks[key] = true

                local minp = { x = cx * FORCE_CHUNK_SIZE, y = y_base - 40, z = cz * FORCE_CHUNK_SIZE }
                local maxp = { x = minp.x + FORCE_CHUNK_SIZE - 1, y = y_base + 40, z = minp.z + FORCE_CHUNK_SIZE - 1 }

                minetest.emerge_area(minp, maxp, function(bpos, action, calls_remaining)
                    if calls_remaining == 0 then
                        -- διπλός έλεγχος: μπορεί να μαρκαρίστηκε στο μεταξύ από φυσικό mapgen
                        if not is_chunk_generated(planet_name, cx, cz) then
                            safe_generate_planet_chunk(minp, maxp, planet_name, cfg, y_base)
                            mark_chunk_generated(planet_name, cx, cz)
                            save_generated_chunks()
                        end
                        pending_chunks[key] = nil
                    end
                end)
            end
        end
    end
end

-- Ό,τι παράγει κανονικά η μηχανή, το μαρκάρουμε κι εμείς ώστε
-- να μην το ξαναπαράγουμε παρακάτω (δεν πειράζει που υπάρχουν
-- 2 register_on_generated στο ίδιο αρχείο, εκτελούνται και τα δύο)
minetest.register_on_generated(function(minp, maxp, seed)
    for planet_name, cfg in pairs(star_wars.dimensions.terrain_config) do
        local planet = star_wars.dimensions.planets[planet_name]
        if planet then
            local shell_bottom = planet.y_base - star_wars.dimensions.SHELL_HALF_HEIGHT
            local shell_top = planet.y_base + star_wars.dimensions.SHELL_HALF_HEIGHT
            if maxp.y >= shell_bottom and minp.y <= shell_top then
                mark_covered_chunks(planet_name, minp, maxp)
            end
        end
    end
end)

-- Fallback: ελέγχει τους παίκτες κάθε 2" και κάνει force-generate
-- γύρω τους αν βρίσκονται μέσα σε planet shell — καλύπτει και
-- την περίπτωση που δεν προλάβατε να καλέσετε το ensure_generated
-- χειροκίνητα στο σημείο τηλεμεταφοράς
local last_checked_chunk = {}
local timer = 0
minetest.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer < 2 then return end
    timer = 0

    for _, player in ipairs(minetest.get_connected_players()) do
        local pos = player:get_pos()
        local planet_name = get_planet_at_y(pos.y)
        if planet_name then
            local pname = player:get_player_name()
            local cx = math.floor(pos.x / FORCE_CHUNK_SIZE)
            local cz = math.floor(pos.z / FORCE_CHUNK_SIZE)
            local key = planet_name .. ":" .. cx .. ":" .. cz
            if last_checked_chunk[pname] ~= key then
                last_checked_chunk[pname] = key
                star_wars.dimensions.ensure_generated(pos, 1)
            end
        end
    end
end)
