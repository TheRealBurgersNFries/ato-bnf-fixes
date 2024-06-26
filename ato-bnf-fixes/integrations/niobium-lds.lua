local recipesToUpdate = {
    "low-density-structure",
    "low-density-structure-nanotubes"
}

local prefix = "niobium-"


for i, recipeName in pairs(recipesToUpdate) do
    if data.raw.recipe[recipeName] then
        local r = table.deepcopy(data.raw.recipe[recipeName])
        recipeName = prefix..r.name
        r.name = recipeName

        r.localized_name = {"", {"recipe-name.niobium"}, " ", {"recipe-name."..recipeName}}
        data:extend({r})

        local recipe = Recipe(recipeName)
        recipe.replaceIngredient("copper-plate", "niobium-plate")
        recipe.addIcon({icon="__all-the-overhaul-modpack__/graphics/icons/materials/niobium-plate.png",
                        icon_size=128,
                        scale=0.124,
                        shift={8,-8}})
        recipe.allowProductivity()

    end
end

data:extend({
    {
        type = "technology",
        name = "niobium-low-density-structures",
        icons = data.raw.recipe["niobium-low-density-structure"].icons,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "niobium-low-density-structure",
            },
        },
        prerequisites = { "low-density-structure"},
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"productivity-science-pack", 1},
            },
            time = 30
        }
    }
})
local niobNanotube = Recipe("niobium-low-density-structure-nanotubes")
niobNanotube.unlockedByTechnology("nanotubes")