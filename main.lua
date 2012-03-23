stage:setOrientation(Stage.LANDSCAPE_LEFT)


local allLayers = Sprite.new()
local background = Sprite.new()
background:addChild(Bitmap.new(Texture.new("grass.png")))
allLayers:addChild(background)
stage:addChild(allLayers)

local d = Dog.new()
allLayers:addChild(d)


local wallet = Bank.new(1000)
stage:addChild(wallet)
wallet:setPosition(240,160)


-- create the up and down sprites for the button
local up = Bitmap.new(Texture.new("blankbutton.png"))
local down = Bitmap.new(Texture.new("blankbutton.png"))
down:setColorTransform(.1, .1,1,1)
-- create the button
local button = Button.new(up, down)
button:setPosition(0, 360-button:getHeight())
stage:addChild(button)
local up2 = Bitmap.new(Texture.new("blankbutton.png"))
local down2 = Bitmap.new(Texture.new("blankbutton.png"))
down2:setColorTransform(1,.5,1,.5)
local button2 = Button.new(up2, down2)
button2:setPosition(button2:getWidth()+5, 360-button2:getHeight())
stage:addChild(button2)





local dragging, startx, starty

local function onMouseDown(event)
	dragging = true
	startx = event.x
	starty = event.y

end

local function onMouseMove(event)
	if dragging then
		local dx = event.x - startx
		local dy = event.y - starty
		newX = allLayers:getX()+dx
		newY = allLayers:getY()+dy

		if newX<1 and newX+background:getWidth()>640 then
			allLayers:setX(newX)
		end
		if newY<1 and newY+background:getHeight()>360 then
			allLayers:setY(newY)
		end
		startx = event.x
		starty = event.y
	end
end

local function onMouseUp(event)
	dragging = false
end

stage:addEventListener(Event.MOUSE_DOWN, onMouseDown)
stage:addEventListener(Event.MOUSE_MOVE, onMouseMove)
stage:addEventListener(Event.MOUSE_UP, onMouseUp)
