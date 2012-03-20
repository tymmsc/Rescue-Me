Animal = Core.class(Sprite)

function Animal:init()
	print("I am an animal")
	self.hunger = 50
	self.bathroom = {
		pee = 50,
		poop = 50
	}
	self.dirty=50
	self.happy=50
end

function Animal:getHunger()
	return self.hunger
end

function Animal:setHunger(hunger)
	self.hunger = hunger
end

function Animal:isHungry()
	if self.hunger > 50 then
		return true
	end
	return false
end

function Animal:getBathroomPee()
	return self.bathroom.pee
end

function Animal:setBathroomPee(pee)
	self.bathroom.pee = pee
end

function Animal:needBathroomPee()
	if self.bathroom.pee > 50 then
		return true
	end
	return false
end

function Animal:getBathroomPoop()
	return self.bathroom.poop
end

function Animal:setBathroomPoop(poop)
	self.bathroom.poop = poop
end

function Animal:needBathroomPoop()
	if self.bathroom.poop > 50 then
		return true
	end
	return false
end

function Animal:getDirty()
	return self.dirty
end

function Animal:setDirty(dirty)
	self.dirty = dirty
end

function Animal:isDirty()
	if self.dirty > 50 then
		return true
	end
	return false
end

function Animal:getHappy()
	return self.happy
end

function Animal:setHappy(happy)
	self.happy = happy
end

function Animal:isHappy()
	if self.happy > 50 then
		return true
	end
	return false
end