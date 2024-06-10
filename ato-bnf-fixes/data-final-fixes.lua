
-- Fix se-space-train cargo capacitiies to desirable value
data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 80
data.raw["fluid-wagon"]["space-fluid-wagon"].capacity = 50000

-- Add Productivity to 248k Intermediates
Recipe("hcp-circuit").allowProductivity()
Recipe("hcp-board").allowProductivity()
Recipe("pcb-recipe").allowProductivity()
Recipe("carbon-fiber").allowProductivity()
Recipe("fi_materials_natural_fiber_recipe").allowProductivity()
Recipe("fi_materials_glass_fiber_recipe").allowProductivity()
Recipe("fu_carbon_fiber_recipe").allowProductivity()
Recipe("fu_KFK_recipe").allowProductivity()
Recipe("fi_GFK_recipe").allowProductivity()
Recipe("fi_NFK_recipe").allowProductivity()
Recipe("el_lithium_battery_recipe").allowProductivity()
Recipe("fi_cast_glass_recipe").allowProductivity()
Recipe("fie_arc_glass_recipe").allowProductivity()
Recipe("el_kerosene_recipe").allowProductivity()
Recipe("el_kerosene_basic_recipe").allowProductivity()
Recipe("el_ceramic_recipe").allowProductivity()
Recipe("el_ceramic_1_recipe").allowProductivity()
Recipe("el_ALK_recipe").allowProductivity()
Recipe("el_desulfurized_kerosene_recipe").allowProductivity()
Recipe("el_train_fuel_diesel_recipe").allowProductivity()
Recipe("el_train_fuel_diesel_energized_recipe").allowProductivity()

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

-- Add Productivity to Lasing Around Intermediates
Recipe("tracker").allowProductivity()
Recipe("scanner").allowProductivity()
Recipe("spectroscope").allowProductivity()

-- Add productivity to Intermediates4You Intermediates
Recipe("bronze-spring").allowProductivity()
Recipe("spring").allowProductivity()

-- Add productivity to Chemistry4You
Recipe("lithium-hydroxide").allowProductivity()