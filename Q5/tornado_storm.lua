local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)


-- Set damage area
local arr = {

	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 3, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
}

-- the different animation "frames"
local animationarea = {
    {
		--1
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 0, 0},
		{0, 0, 0, 3, 0, 1, 0},
		{1, 0, 0, 0, 0, 0, 1},
		{0, 0, 0, 0, 0, 1, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
    },
    {
		--2
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 0, 0},
		{0, 1, 0, 3, 0, 1, 0},
		{1, 0, 0, 0, 0, 0, 1},
		{0, 1, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
    },
	{
		--3
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 1, 0, 3, 0, 0, 0},
		{1, 0, 1, 0, 1, 0, 1},
		{0, 1, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
	{
		--4
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 1, 0, 3, 0, 0, 0},
		{1, 0, 1, 0, 1, 0, 1},
		{0, 1, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	},
	{
		--5
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 3, 0, 1, 0},
		{1, 0, 1, 0, 1, 0, 1},
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	},
	{
		--6
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 1, 0, 3, 0, 0, 0},
		{1, 0, 1, 0, 1, 0, 1},
		{0, 1, 0, 0, 0, 1, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
	{
		--7
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 1, 0, 3, 0, 0, 0},
		{1, 0, 1, 0, 1, 0, 1},
		{0, 1, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	},
	{
		--8
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 3, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 1, 0, 1, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	},
	{
		--9
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 1, 0, 3, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 1, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	},
	{
		--10
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 3, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	}
}

local area = createCombatArea(arr)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
    local min = (level / 5) + (maglevel * 1.4) + 8
    local max = (level / 5) + (maglevel * 2.2) + 14
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")



local function animation(pos, playerpos)
	-- called from each frame, sending the effect we need to the affected areas
        if Position(pos):isSightClear(playerpos) then
            Position(pos):sendMagicEffect(CONST_ME_ICETORNADO)
        end
end

function onCastSpell(creature, var)

    local creaturepos = creature:getPosition()
    local playerpos = Position(creaturepos)
	-- delay between frames
    local delay = 300

    local centre = {}
    local damagearea = {}

	-- loop through all our animation "frames" and parse the numbers within
    for j = 1, #animationarea do
        for k,v in ipairs(animationarea[j]) do
            for i = 1, #v do
				-- 3 and 2 represent where our player is standing
                if v[i] == 3 or v[i] == 2 then
                    centre.Row = k
                    centre.Column = i
                    table.insert(damagearea, centre)
				-- 1 represents a damaging zone
                elseif v[i] == 1 then
                    local darea = {}
                    darea.Row = k
                    darea.Column = i
                    darea.Delay = j * delay
                    table.insert(damagearea, darea)
                end
            end
        end
    end
	-- calculate damage for our damaging area in addition to adding our animations
    for i = 1,#damagearea do
        local modifierx = damagearea[i].Column - centre.Column
        local modifiery = damagearea[i].Row - centre.Row

		local damagepos = Position(creaturepos)
        damagepos.x = damagepos.x + modifierx
        damagepos.y = damagepos.y + modifiery


		local animationDelay = damagearea[i].Delay or 0
		-- adding the animation event so when executed, our spell frames are cast in order
        addEvent(animation, animationDelay, damagepos, playerpos)
    end
    return combat:execute(creature, var)
end
