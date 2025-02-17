-----------------------------------
-- ID: 18586
-- Item: flexible_pole
-- Item Effect: Attack +3
-- Duration: 30 Minutes
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENCHANTMENT)
    if effect ~= nil and effect:getItemSourceID() == xi.items.FLEXIBLE_POLE then
        target:delStatusEffect(xi.effect.ENCHANTMENT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, xi.items.FLEXIBLE_POLE)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ATT, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ATT, 3)
end

return itemObject
