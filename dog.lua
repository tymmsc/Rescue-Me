Dog = Core.class(Animal)

function Dog:init()
	print("I am a dog")
	self = Bitmap.new(Texture.new("dog.png"))
	stage:addChild(self)
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