colors={"blue", "green", "red", "purple", "yellow", "black", "pink"}

colors_descriptions={"Blue", "Green", "Red", "Purple", "Yellow", "Black", "Pink"}

hilts={"single","cross","double","curved","shoto"}

hilts_descriptions={"Single","Cross","Double","Curved","Shoto"}

--===========================
-- ORES
--===========================

minetest.register_craftitem("star_wars:kyber_crystal", {
    description = "Blank Kyber Crystal",
    inventory_image = "blank_kyber_crystal.png"
})

minetest.register_craftitem("star_wars:laser_core", {
    description = "Laser Core",
    inventory_image = "laser_core.png"
})

minetest.register_craftitem("star_wars:beskar_ingot", {
    description = "Beskar Ingot",
    inventory_image = "beskar_ingot.png"
})

minetest.register_craftitem("star_wars:raw_beskar", {
    description = "Raw Beskar",
    inventory_image = "raw_beskar.png"
})

--===========================
-- CRYSTALS
--===========================

for i,color in ipairs(colors) do
minetest.register_craftitem("star_wars:"..color.."_kyber_crystal", {
    description = colors_descriptions[i].." Kyber Crystal",
    inventory_image = colors[i].."_kyber_crystal.png"
})

--===========================
-- HILTS
--===========================

for n,hilt in ipairs(hilts) do
minetest.register_craftitem("star_wars:"..hilt.."_hilt", {
    description = hilts_descriptions[n].." Lightsaber Hilt",
    inventory_image =  "hilt_"..hilt..".png"
})

    end
end

minetest.register_craftitem("star_wars:darksaber_hilt", {
    description = "Darksaber Hilt",
    inventory_image =  "darksaber_hilt_inv.png"
})

--===========================
-- VEHICLES ITEMS
--===========================

minetest.register_craftitem("star_wars:engine", {
    description = "Engine",
    inventory_image =  "engine.png"
})

minetest.register_craftitem("star_wars:xwing_wing", {
    description = "X-Wing Wing",
    inventory_image =  "xwing_wing.png"
})

minetest.register_craftitem("star_wars:tie_wing", {
    description = "Tie Wing",
    inventory_image =  "tie_wing.png"
})


minetest.register_craftitem("star_wars:propeller", {
    description = "Propeller",
    inventory_image =  "propeller.png"
})

minetest.register_tool("star_wars:wrench", {
    description = "Wrench",
    inventory_image =  "wrench.png"
})

--===========================
-- FOOD
--===========================

minetest.register_craftitem("star_wars:arge_leg", {
    description = "Arge Leg",
    inventory_image =  "arge_leg.png",
	on_use = minetest.item_eat (4)
})

minetest.register_craftitem("star_wars:cooked_arge_leg", {
    description = "Cooked Arge Leg",
    inventory_image =  "cooked_arge_leg.png",
	on_use = minetest.item_eat (7)
})

minetest.register_craftitem("star_wars:raw_bantha_meat", {
    description = "Raw Bantha Meat",
    inventory_image =  "raw_bantha_meat.png",
	on_use = minetest.item_eat (3)
})

minetest.register_craftitem("star_wars:cooked_bantha_meat", {
    description = "Cooked Bantha Meat",
    inventory_image =  "cooked_bantha_meat.png",
	on_use = minetest.item_eat (8)
})

--===========================
-- RANDOM STUFF I DON'T KNOW WHERE TO PUT
--===========================

minetest.register_tool("star_wars:gaffi_stick", {
    description = "Gaffi Stick",
    inventory_image =  "gaffi_stick.png",
    tool_capabilities = {
    full_punch_interval = 0.8,
    max_drop_level=1,
    groupcaps={
      snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
    },
    damage_groups = {fleshy=4},
  },
})
