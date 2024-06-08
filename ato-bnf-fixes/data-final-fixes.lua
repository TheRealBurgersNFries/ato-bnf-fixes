
-- Fix se-space-train cargo capacitiies to desirable value
data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 80
data.raw["fluid-wagon"]["space-fluid-wagon"].capacity = 50000

-- Add Productivity to Electronics Intermediates
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
Recipe("hcp-circuit").allowProductivity()
Recipe("hcp-board").allowProductivity()
Recipe("pcb-recipe").allowProductivity()
