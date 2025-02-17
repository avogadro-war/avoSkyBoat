-----------------------------------
-- ID: 15868
-- Item: czars_belt
-- Item Effect: VIT +10
-- Duration: 60 seconds
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENCHANTMENT)
    if effect ~= nil and effect:getItemSourceID() == xi.items.CZARS_BELT then
        target:delStatusEffect(xi.effect.ENCHANTMENT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 60, 0, 0, 0, xi.items.CZARS_BELT)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.VIT, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.VIT, 10)
end

return itemObject
