-----------------------------------
-- ID: 18242
-- Item: Wyvern Feed
-- Item Effect: Pet Regen
-- Duration 3 Minutes
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENCHANTMENT)
    local pet = target:getPet()
    if not pet then
        return xi.msg.basic.REQUIRES_A_PET, 0
    elseif
        effect ~= nil and
        effect:getItemSourceID() == xi.items.BAG_OF_WYVERN_FEED
    then
        target:delStatusEffect(xi.effect.ENCHANTMENT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, xi.items.BAG_OF_WYVERN_FEED)
end

itemObject.onEffectGain = function(target, effect)
    local pet = target:getPet()
    pet:addMod(xi.mod.REGEN, 3)
end

itemObject.onEffectLose = function(target, effect)
    local pet = target:getPet()
    if pet ~= nil then
        pet:delMod(xi.mod.REGEN, 3)
    end
end

return itemObject
