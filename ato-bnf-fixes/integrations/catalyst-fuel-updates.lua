local recipesToUpdate = {
    "fi_solid_1_recipe",
    "fi_solid_2_recipe",
    "fuel-1",
    "fuel-2",
    "bio-fuel",
    "advanced-fuel",
    "el_train_fuel_diesel_recipe",
    "el_train_fuel_diesel_energized_recipe",
    "fi_fuel_train_crystal_recipe",
    "el_desulfurized_kerosene_recipe",
    "el_kerosene_recipe",
    "el_kerosene_basic_recipe",
    "coke-liquefaction",
    "coal-liquefaction",
    "oil-processing",
    "fi_refinery_sulfur_recipe",
    "fi_refinery_coal_recipe",
    "fi_refinery_basic_recipe",
    "bi-biomass-conversion-4",
    "bi-biomass-conversion-3",
    "bi-biomass-conversion-2",
    "bi-biomass-conversion-1",
    "toluene-wood",
    "toluene-coal"
}

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end
  

local prefix = "catalyzed-"
for i, recipeName in pairs(recipesToUpdate) do
    if data.raw.recipe[recipeName] then
        local r = table.deepcopy(data.raw.recipe[recipeName])
        recipeName = prefix..r.name
        r.name = recipeName

        if r.main_product == nil and r.result ~= nil then
            r.main_product = r.result
        elseif r.main_product == nil and r.results ~= nil and tablelength(r.results) == 1 then
            r.main_product = r.results[1].name
        else
            --uhoh
        end
        r.localized_name = {"", {"recipe-name.catalyzed"}, " ", {"recipe-name."..recipeName}}

        data:extend({r})
        local recipe = Recipe(recipeName)
        recipe.addIngredient("ptpd-catalyst", 1)
        recipe.addResult("ptpd-catalyst", 1, 1, 0.9)
        recipe.multiplyTime(0.5)
        recipe.unlockedByTechnology("catalysis")
        recipe.addIcon({icon="__bzgold__/graphics/icons/ptpd-catalyst.png",
                        icon_size=128,
                        scale=0.124,
                        shift={8,-8}})
    end
end