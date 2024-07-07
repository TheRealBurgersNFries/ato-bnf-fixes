require("integrations/catalyst-fuel-updates")
require("integrations/niobium-lds.lua")


-- Fix se-space-train cargo capacitiies to desirable value
data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 80
data.raw["fluid-wagon"]["space-fluid-wagon"].capacity = 50000

-- Add Productivity to 248k Intermediates
Recipe("hcp-circuit").allowProductivity()
Recipe("hcp-board").allowProductivity()
Recipe("pcb-recipe").allowProductivity()
Recipe("carbon-fiber").allowProductivity()
Recipe("fi_natural_fiber_recipe").allowProductivity()
Recipe("fi_glass_fiber_recipe").allowProductivity()
Recipe("fu_carbon_fiber_recipe").allowProductivity()
Recipe("fu_KFK_recipe").allowProductivity()
Recipe("fi_GFK_recipe").allowProductivity()
Recipe("fi_NFK_recipe").allowProductivity()
Recipe("el_lithium_battery_recipe").allowProductivity()
Recipe("fi_cast_glass_recipe").allowProductivity()
Recipe("fi_arc_glass_recipe").allowProductivity()
Recipe("el_kerosene_recipe").allowProductivity()
Recipe("el_kerosene_basic_recipe").allowProductivity()
Recipe("el_ceramic_recipe").allowProductivity()
Recipe("el_ceramic_1_recipe").allowProductivity()
Recipe("el_ALK_recipe").allowProductivity()
Recipe("el_desulfurized_kerosene_recipe").allowProductivity()
Recipe("el_train_fuel_diesel_recipe").allowProductivity()
Recipe("el_train_fuel_diesel_energized_recipe").allowProductivity()
Recipe("fi_modules_base_recipe").allowProductivity()
Recipe("fi_modules_core_recipe").allowProductivity()

-- Add Productivity to BioIndustries Intermediates
Recipe("bi-solid-fuel").allowProductivity()

-- Add Productivity to BrassTacks Intermediates
Recipe("skyseeker-armature").allowProductivity()

-- Add Productivity to Nickel Intermediates
Recipe("machining-tool").allowProductivity()
Recipe("advanced-machining-tool").allowProductivity()

-- Add Productivity to ThenTharHhills Intermediates
Recipe("aqua-regia").allowProductivity()

-- Add Productivity to Bob's Electronics Intermediates
Recipe("basic-electronic-components").allowProductivity()
Recipe("basic-electronic-components-silver").allowProductivity()
Recipe("basic-circuit-board").allowProductivity()
Recipe("BOBMD-electronic-components").allowProductivity()
Recipe("phenolic-board").allowProductivity()
Recipe("phenolic-board-stone").allowProductivity()
Recipe("circuit-board").allowProductivity()
Recipe("advanced-electronic-components").allowProductivity()
Recipe("cpu").allowProductivity()
Recipe("superior-circuit-board").allowProductivity()
Recipe("advanced-processing-unit").allowProductivity()
Recipe("multi-layer-circuit-board").allowProductivity()
Recipe("intergrated-electronics").allowProductivity()
Recipe("fibreglass-board").allowProductivity()
Recipe("ferric-chloride-solution").allowProductivity()

-- Add Productivity to Lasing Around Intermediates
Recipe("tracker").allowProductivity()
Recipe("scanner").allowProductivity()
Recipe("spectroscope").allowProductivity()

-- Add productivity to Intermediates4You Intermediates
Recipe("bronze-spring").allowProductivity()
Recipe("spring").allowProductivity()

-- Add productivity to Chemistry4You
Recipe("lithium-hydroxide").allowProductivity()
Recipe("cobalt-hydroxide").allowProductivity()
Recipe("soda-lime-glass").allowProductivity()
Recipe("sodium-carbonate").allowProductivity()

-- Ad Productivity to Intermediates from Salt & chlorine
Recipe("ferric-chloride").allowProductivity()
Recipe("ferric-chloride-hcl").allowProductivity()
Recipe("vinyl-chloride").allowProductivity()

-- Fix Category for Fuel from 248k
Recipe("fi_solid_1_recipe").changeCategory("fuel-refinery")
Recipe("fi_solid_2_recipe").changeCategory("fuel-refinery")
Recipe("fi_rocket_fuel_1_recipe").changeCategory("fuel-refinery")
Recipe("fi_rocket_fuel_2_recipe").changeCategory("fuel-refinery")
Recipe("el_train_fuel_diesel_recipe").changeCategory("fuel-refinery")
Recipe("el_train_fuel_diesel_energized_recipe").changeCategory("fuel-refinery")
Recipe("fi_fuel_train_crystal_recipe").changeCategory("fuel-refinery")

-- Add Iron plate and seal to Solid Rocket Fuels
Recipe("fi_rocket_fuel_1_recipe").addIngredient("iron-plate", 1)
Recipe("fi_rocket_fuel_1_recipe").addIngredient("airtight-seal", 1)
Recipe("fi_rocket_fuel_2_recipe").addIngredient("iron-plate", 1)
Recipe("fi_rocket_fuel_2_recipe").addIngredient("airtight-seal", 1)
Recipe("hydrogen-peroxide-rocket-fuel").addIngredient("iron-plate", 1)
Recipe("hydrogen-peroxide-rocket-fuel").addIngredient("airtight-seal", 1)
Recipe("nitrous-oxide-rocket-fuel").addIngredient("iron-plate", 1)
Recipe("nitrous-oxide-rocket-fuel").addIngredient("airtight-seal", 1)

Recipe("se-vulcanite-rocket-fuel").addIngredient("airtight-seal", 1)
Recipe("se-vulcanite-rocket-fuel").addIngredient("iron-plate", 1)
Recipe("rocket-fuel").addIngredient("airtight-seal", 1)
Recipe("rocket-fuel").addIngredient("iron-plate", 1)
Recipe("rocket-fuel-with-ammonia").addIngredient("airtight-seal", 1)
Recipe("rocket-fuel-with-ammonia").addIngredient("iron-plate", 1)

-- Fix Category for Rocket Fuel from Chemistry4You
Recipe("hydrogen-peroxide-rocket-fuel").changeCategory("fuel-refinery", 1)
Recipe("nitrous-oxide-rocket-fuel").changeCategory("fuel-refinery", 1)



-- Fix Category for Solid Fuel from BioIndustries
Recipe("bi-solid-fuel").changeCategory("fuel-refinery")

-- Fix K2 Laser Artillery Performance
data.raw["electric-turret"]["kr-laser-artillery-turret"].attack_parameters.range = 10


-- ADd Productivity to Alloys
Recipe("cuw").allowProductivity()
Recipe("bismuth-glass").allowProductivity()
Recipe("mangalloy").allowProductivity()
Recipe("bronze-plate").allowProductivity()
Recipe("silver-pyrometallurgi").allowProductivity()
Recipe("inconel-718").allowProductivity()
Recipe("zircaloy-4").allowProductivity()
Recipe("crucible").allowProductivity()
Recipe("sulfur-smelting").allowProductivity()
Recipe("advanced-silicon-processing").allowProductivity()
Recipe("tungsten-trioxide").allowProductivity()
Recipe("tungsten-trioxide-smelting").allowProductivity()
Recipe("sodium-diuranate-smelting").allowProductivity()
Recipe("bob-rubber").allowProductivity()
Recipe("bismanol").allowProductivity()