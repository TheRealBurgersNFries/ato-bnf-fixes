-- Productivity modules variable for allowProductivity
local productivityModules = {}
for _, module in pairs(data.raw["module"]) do
    if string.find(module.name, "productivity", 1, true) then
        table.insert(productivityModules, module)
    end
end

-- Recipe class from ATOM Recipe.lua
-- Utility class for a single recipe
-- Pass a recipe name or a recipe table to get a Recipe object
-- @param value string|table The name of the recipe or the recipe table
function Recipe(value)
    local recipeName -- Don't use this in functions as the actual name might change
    local recipe

    if type(value) == "string" then
        recipeName = value
        recipe = data.raw.recipe[recipeName]
    elseif type(value) == "table" then
        recipeName = value.name
        recipe = value
    end

    -- if not recipe then
    --     util.log.debug("Recipe not found: " .. recipeName)
    --     return nil
    -- end

    return {
        -- The recipe data
        prototype = recipe,

        -- Applies the recipe to the game
        apply = function()
            data:extend({ recipe })
        end,

        -- Assigns data to the recipe
        -- Shorthand for table.assign(recipe.prototype, data)
        -- @param data table The data to assign
        assign = function(data)
            table.assign(recipe, data)
        end,

        -- Adds an ingredient to the recipe
        -- @param ingredientName string The name of the ingredient
        -- @param amount number The amount of the ingredient
        -- @param expensiveAmount? number The amount of the ingredient for the expensive recipe (uses amount if not set)
        addIngredient = function(ingredientName, amount, expensiveAmount)
            local ingredientType = data.raw.item[ingredientName] and "item"
                    or data.raw.module[ingredientName] and "item"
                    or data.raw.fluid[ingredientName] and "fluid"
                    or nil
            if not ingredientType then
                return
            end
            local function apply(ingredients, amount)
                table.insert(ingredients, { name = ingredientName, amount = amount, type = ingredientType })
            end
            if recipe.ingredients then
                apply(recipe.ingredients, amount)
            end
            if recipe.normal and recipe.normal.ingredients then
                apply(recipe.normal.ingredients, amount)
            end
            if recipe.expensive and recipe.expensive.ingredients then
                apply(recipe.expensive.ingredients, expensiveAmount or amount)
            end
        end,

        -- Replaces an existing ingredient by name with a new ingredient or adjusts the amount
        -- @param old string The name of the existing ingredient
        -- @param new? string The name of the new ingredient
        -- @param amount? number The amount of the new ingredient
        -- @param expensiveAmount? number The amount of the new ingredient for the expensive recipe (uses amount if not set)
        replaceIngredient = function(old, new, amount, expensiveAmount)
            if type(new) == "number" then
                expensiveAmount = amount
                amount = new
                new = old
            end
            local function apply(_table, amount)
                for _, result in pairs(_table.ingredients) do
                    if result.name == old then
                        result.name = new
                        result.amount = amount or result.amount
                    elseif result[1] == old then
                        result[1] = new
                        result[2] = amount or result[2]
                    end
                end
            end
            if recipe.ingredients then
                apply(recipe, amount)
            end
            if recipe.normal and recipe.normal.ingredients then
                apply(recipe.normal, amount)
            end
            if recipe.expensive and recipe.expensive.ingredients then
                apply(recipe.expensive, expensiveAmount or amount)
            end
        end,

        -- Removes an existing ingredient by name
        -- @param ingredientName string The name of the ingredient
        removeIngredient = function(ingredientName)
            local function apply(_table)
                for i, result in pairs(_table.ingredients) do
                    if result.name == ingredientName then
                        _table.ingredients[i] = nil
                    elseif result[1] == ingredientName then
                        _table.ingredients[i] = nil
                    end
                end
            end
            if recipe.ingredients then
                apply(recipe)
            end
            if recipe.normal and recipe.normal.ingredients then
                apply(recipe.normal)
            end
            if recipe.expensive and recipe.expensive.ingredients then
                apply(recipe.expensive)
            end
        end,

        -- Replaces an existing result by name with a new result
        -- @param old string The name of the existing result
        -- @param new string The name of the new result
        -- @param amount? number The amount of the new result (keeps the old value if not set)
        -- @param expensiveAmount? number The amount of the new result for the expensive recipe (uses amount if not set)
        replaceResult = function(old, new, amount, expensiveAmount)
            local function flat(table, amount)
                if table.result == old then
                    table.result = new
                    table.result_count = amount or table.result_count
                end
                if table.main_product == old then
                    table.main_product = new
                end
            end
            local function table(table, amount)
                for _, result in pairs(table.results) do
                    if result.name == old then
                        result.name = new
                        result.amount = amount or result.amount
                    elseif result[1] == old then
                        result[1] = new
                        result[2] = amount or result[2]
                    end
                end
                if table.main_product == old then
                    table.main_product = new
                end
            end
            if recipe.result then
                flat(recipe, amount)
            end
            if recipe.normal and recipe.normal.result then
                flat(recipe.normal, amount)
            end
            if recipe.expensive and recipe.expensive.result then
                flat(recipe.expensive, expensiveAmount or amount)
            end
            if recipe.results then
                table(recipe, amount)
            end
            if recipe.normal and recipe.normal.results then
                table(recipe.normal, amount)
            end
            if recipe.expensive and recipe.expensive.results then
                table(recipe.expensive, expensiveAmount or amount)
            end
        end,

        -- Allows productivity modules to be used for a recipe
        -- @param recipeName string The name of the recipe
        allowProductivity = function()
            for _, module in pairs(productivityModules) do
                if (module.limitation) then
                    table.insert(module.limitation, recipe.name)
                end
            end
        end,

        -- Adds the recipe to a technology
        -- @param technology string|table The name of the technology or the technology table
        unlockedByTechnology = function(technology)
            if not technology then
                return
            end
            technology = type(technology) == "table" and technology or data.raw.technology[technology]
            if (not technology.effects) then
                technology.effects = {}
            end
            for _, effect in pairs(technology.effects) do
                if effect.type == "unlock-recipe" and effect.recipe == recipe.name then
                    return
                end
            end
            table.insert(technology.effects, { type = "unlock-recipe", recipe = recipe.name })
        end,

        -- Change Category of a recipe
        -- @param category string
        changeCategory = function(newCategory)
            if not newCategory then
                return
            end

            recipe.category = newCategory
        end,

        -- Add a product or catalyst to a recipe
        -- @param catalyst string
        -- @param amount integer
        -- @param catalystAmount integer
        -- @param probability float
        addResult = function(resultName, resultAmount, catalystAmount, resultProbability)
            if (catalystAmount and not resultProbability) or (resultProbability and not catalystAmount) then
                return
            end
            local resultType = data.raw.item[resultName] and "item"
                    or data.raw.module[resultName] and "item"
                    or data.raw.fluid[resultName] and "fluid"
                    or nil
            if not resultType then
                return
            end
            if recipe.results == nil then
                recipe.results = 
                {
                    {
                        recipe.result,
                        recipe.result_count and recipe.result_count or 1
                    }
                }
                recipe.result = nil
                recipe.result_count = nil
            end
            if catalystAmount then
                
                table.insert(recipe.results,
                    {
                        type = resultType,
                        name = resultName,
                        amount = resultAmount,
                        catalyst_amount = catalystAmount,
                        probability = resultProbability
                    })
            else
                table.insert(recipe.results,
                    {
                        type = resultType,
                        name = resultName,
                        amount = resultAmount
                    }
                )
            end
        end,

        -- Change the time of the recipe
        -- @param multiplier float
        multiplyTime = function(multiplier)
            recipe.energy_required = recipe.energy_required * multiplier

        end,

        -- Adds an icon for the new recipe
        -- @param icon string
        addIcon = function(icon)
            if data.raw.recipe[recipeName] then
            
                if not (data.raw.recipe[recipeName].icons and 
                        #(data.raw.recipe[recipeName].icons) > 0) then
                    if data.raw.recipe[recipeName].icon then
                        data.raw.recipe[recipeName].icons = {{
                            icon        =data.raw.recipe[recipeName].icon,
                            icon_size   =data.raw.recipe[recipeName].icon_size,
                            icon_mipmaps=data.raw.recipe[recipeName].icon_mipmaps,
                        }}
                    elseif data.raw.item[data.raw.recipe[recipeName].main_product] then
                        data.raw.recipe[recipeName].icons = {{
                            icon        =data.raw.item[data.raw.recipe[recipeName].main_product].icon,
                            icon_size   =data.raw.item[data.raw.recipe[recipeName].main_product].icon_size,
                            icon_mipmaps=data.raw.item[data.raw.recipe[recipeName].main_product].icon_mipmaps
                        }}
                    elseif data.raw.item[data.raw.recipe[recipeName].result] then
                        data.raw.recipe[recipeName].icons = {{
                            icon        =data.raw.item[data.raw.recipe[recipeName].result].icon,
                            icon_size   =data.raw.item[data.raw.recipe[recipeName].result].icon_size,
                            icon_mipmaps=data.raw.item[data.raw.recipe[recipeName].result].icon_mipmaps,
                        }}
                    elseif data.raw.recipe[recipeName].normal and
                            data.raw.item[data.raw.recipe[recipeName].normal.result] then
                        data.raw.recipe[recipeName].icons = {{
                            icon        =data.raw.item[data.raw.recipe[recipeName].normal.result].icon,
                            icon_size   =data.raw.item[data.raw.recipe[recipeName].normal.result].icon_size,
                            icon_mipmaps=data.raw.item[data.raw.recipe[recipeName].normal.result].icon_mipmaps,
                        }}
                    end
                    data.raw.recipe[recipeName].icon = nil
                    data.raw.recipe[recipeName].icon_size = nil
                end
                if (data.raw.recipe[recipeName].icons ~= nil) then
                    table.insert(data.raw.recipe[recipeName].icons, icon)
                end
            end
        end
    }
end