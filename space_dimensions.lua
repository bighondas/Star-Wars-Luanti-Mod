star_wars = star_wars or {}
star_wars.dimensions = star_wars.dimensions or {}
star_wars.dimensions.pending_rocket =
    star_wars.dimensions.pending_rocket or {}

-- ============================================================
-- PLANET REGISTRY
-- ============================================================
star_wars.dimensions.planets = {
    earth = {
        label = "Earth",
        y_base = 0,
        spawn = {x = 0, z = 0},
    },
    tatooine = {
        label = "Tatooine",
        y_base = 1000,
        spawn = {x = 0, z = 0},
    },
    dagobah = {
        label = "Dagobah",
        y_base = 2000,
        spawn = {x = 0, z = 0},
    },
    sorgan = {
        label = "Sorgan",
        y_base = 3000,
        spawn = {x = 0, z = 0},
    },
    mustafar = {
        label = "Mustafar",
        y_base = 4000,
        spawn = {x = 0, z = 0},
    },
    hoth = {
        label = "Hoth",
        y_base = 5000,
        spawn = {x = 0, z = 0},
    },
    naboo = {
        label = "Naboo",
        y_base = 6000,
        spawn = {x = 0, z = 0},
    },
    endor = {
        label = "Endor",
        y_base = 7000,
        spawn = {x = 0, z = 0},
    },
    geonosis = {
        label = "Geonosis",
        y_base = 8000,
        spawn = {x = 0, z = 0},
    },
    kashyyyk = {
        label = "Kashyyyk",
        y_base = 9000,
        spawn = {x = 0, z = 0},
    },
    coruscant = {
        label = "Coruscant",
        y_base = 10000,
        spawn = {x = 0, z = 0},
    },
    deralia = {
      label = "Deralia",
      y_base = 20000,
      spawn = {x = 0, z = 0},
    }
}

star_wars.dimensions.SHELL_HALF_HEIGHT = 200

-- ============================================================
-- API
-- ============================================================

function star_wars.dimensions.get_spawn_pos(planet_name, x, z)
    local planet = star_wars.dimensions.planets[planet_name]
    if not planet then return nil end

    x = x or planet.spawn.x
    z = z or planet.spawn.z

    local ground_y
    if star_wars.dimensions.get_surface_y then
        ground_y = star_wars.dimensions.get_surface_y(planet_name, x, z)
    end
    ground_y = ground_y or planet.y_base

    return {
        x = x,
        y = ground_y + 2,
        z = z,
    }
end

function star_wars.dimensions.teleport_to(player, planet_name)
    local name = player:get_player_name()

    local rocket = star_wars.dimensions.pending_rocket[name]

    -- Teleport μαζί με rocket
    if rocket and rocket.object then

        local current = rocket.object:get_pos()

        local pos = star_wars.dimensions.get_spawn_pos(
            planet_name,
            math.floor(current.x),
            math.floor(current.z)
        )

        if not pos then
            return false, "Unknown planet: " .. tostring(planet_name)
        end

        -- 1 block κάτω ώστε να μην ξαναγίνει trigger
        pos.y = pos.y - 1

        rocket.object:set_pos(pos)

        -- Ξεκινά νέο trigger από τον νέο πλανήτη
        rocket._planet_menu_open = false
        rocket._planet_origin_y =
            star_wars.dimensions.planets[planet_name].y_base

        -- Ο παίκτης μένει μέσα στον rocket
        player:set_attach(
            rocket.object,
            "",
            rocket.seat_def.driver.pos,
            rocket.seat_def.driver.rot
        )

        star_wars.dimensions.pending_rocket[name] = nil
        return true
    end

    -- Κανονικό teleport (όχι μέσα σε rocket)
    local current = player:get_pos()

    local pos = star_wars.dimensions.get_spawn_pos(
        planet_name,
        math.floor(current.x),
        math.floor(current.z)
    )

    if not pos then
        return false, "Unknown planet: " .. tostring(planet_name)
    end

    player:set_pos(pos)
    return true
end



function star_wars.dimensions.get_planet_at_y(y)
    local closest, closest_dist = "earth", math.huge
    for name, planet in pairs(star_wars.dimensions.planets) do
        local dist = math.abs(y - planet.y_base)
        if dist < closest_dist then
            closest, closest_dist = name, dist
        end
    end
    return closest
end

-- ============================================================
-- PLANET GUI
-- ============================================================

star_wars.dimensions.formname = "star_wars:planet_select"
star_wars.dimensions.player_selection = {}

star_wars.dimensions.planet_order = {
    "earth",
    "tatooine",
    "dagobah",
    "sorgan",
    "mustafar",
    "hoth",
    "naboo",
    "endor",
    "geonosis",
    "kashyyyk",
    "coruscant",
    "deralia",
}

function star_wars.dimensions.get_planet_formspec(selected_planet)
    local formspec = {
        "formspec_version[4]",
        "size[10,7.2]",
        "position[0.5,0.5]",
        "anchor[0.5,0.5]",
        "no_prepend[]",

        "bgcolor[#000000;true]",
        -- Το background[] κάνει bleed πέρα από το size[] και γεμίζει ΟΛΗ την οθόνη.
        -- star_wars_starfield.png = μαύρο φόντο με αστέρια (βλ. textures/ φάκελο του mod).
        "background[-25,-18;60,42;star_wars_starfield.png;true]",

        -- Μπροστινό panel
        "box[0.2,0.2;9.6,6.8;#3a3a3aFF]",
        "label[0.5,0.5;Select destination planet:]",
    }

    local x = 0.6
    local y = 1.1
    local w = 2.7
    local h = 0.9
    local cols = 3

    for i, planet_name in ipairs(star_wars.dimensions.planet_order) do
        local planet = star_wars.dimensions.planets[planet_name]
        local label = planet.label

        if selected_planet == planet_name then
            label = "> " .. label .. " <"
        end

        local col = (i - 1) % cols
        local row = math.floor((i - 1) / cols)

        table.insert(formspec,
            string.format(
                "button[%0.1f,%0.1f;%0.1f,%0.1f;planet_%s;%s]",
                x + (col * 3.0),
                y + (row * 1.1),
                w, h,
                planet_name,
                minetest.formspec_escape(label)
            )
        )
    end

    table.insert(formspec,
        "button_exit[2.1,6.0;2.2,0.9;cancel;Cancel]"
    )
    table.insert(formspec,
        "button[5.0,6.0;2.2,0.9;confirm;Confirm]"
    )

    return table.concat(formspec, "")
end

local function show_planet_menu(player)
    local name = player:get_player_name()
    local selected_planet = star_wars.dimensions.player_selection[name]

    minetest.show_formspec(
        name,
        star_wars.dimensions.formname,
        star_wars.dimensions.get_planet_formspec(selected_planet)
    )
end

-- ============================================================
-- CHAT COMMAND
-- ============================================================

minetest.register_chatcommand("planet", {
    description = "Open planet travel menu",
    params = "",
    privs = { star_wars = true },
    func = function(name, param)
        star_wars.dimensions.player_selection[name] = nil
        minetest.show_formspec(
            name,
            star_wars.dimensions.formname,
            star_wars.dimensions.get_planet_formspec(nil)
        )
        return true, "Planet menu opened."
    end,
})

-- ============================================================
-- FORMSPEC HANDLER
-- ============================================================

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= star_wars.dimensions.formname then
        return false
    end

    local name = player:get_player_name()

    if fields.quit and not fields.confirm then
        return true
    end

    for _, planet_name in ipairs(star_wars.dimensions.planet_order) do
        if fields["planet_" .. planet_name] then
            star_wars.dimensions.player_selection[name] = planet_name
            show_planet_menu(player)
            return true
        end
    end

    if fields.confirm then
        local selected_planet = star_wars.dimensions.player_selection[name]

        if not selected_planet then
            minetest.chat_send_player(name, "Choose a planet first.")
            show_planet_menu(player)
            return true
        end

        local ok, err = star_wars.dimensions.teleport_to(player, selected_planet)
        if not ok then
            minetest.chat_send_player(name, err)
            return true
        end

        minetest.chat_send_player(
            name,
            "Teleported to " .. star_wars.dimensions.planets[selected_planet].label .. "."
        )
        star_wars.dimensions.player_selection[name] = nil

        minetest.close_formspec(name, star_wars.dimensions.formname)
        return true
    end

    return true
end)
