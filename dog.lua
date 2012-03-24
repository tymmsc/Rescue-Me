Dog = Core.class(Animal)

function Dog:init()
	print("I am a dog")
	self.view = Bitmap.new(Texture.new("dog.png"))
	self:addChild(self.view)
	
	--add event listener for clicking on dog
	self:addEventListener(Event.MOUSE_DOWN, self.onMouseDown, self)

end

function Dog:isHungry()
	if self.hunger >= 50 then
		return true
	end
	return false
end

-------------------------------------------------
-- Dog:feed(amount,quality)
--   @amount: Total amount of food given to dog
--   @quality: Quality of food given to dog
-------------------------------------------------
function Dog:feed(amount, quality)
	local diff = amount * quality
	if self.hunger < diff then
		print("hunger lowered by " .. self.hunger)
		self.hunger = 0
	else
		print("hunger lowered by " .. diff)
		self.hunger = self.hunger - diff
	end
end

-------------------------------------------------
-- Dog:walk()
--   Currently no specific walking functionality
--   Walking immediately cuts pee/poop need by 50
-------------------------------------------------
function Dog:walk()
	if self.bathroom.pee < 50 then
		self.bathroom.pee = 0
	else
		self.bathroom.pee = self.bathroom.pee - 50
	end
	if self.bathroom.poop < 50 then
		self.bathroom.poop = 0
	else
		self.bathroom.poop = self.bathroom.poop - 50
	end
end

-------------------------------------------------
--Dog:onMouseDown
--This function occurs when the dog is clicked
--Currently it just prints a message saying so.
-------------------------------------------------
function Dog:onMouseDown(event)
	if self:hitTestPoint(event.x, event.y) then

		print ("You clicked the dog.")
		
	end
end

