stage:setOrientation(Stage.LANDSCAPE_LEFT)


--the "screenHeight" is actually the Device's width, and vice versa, since we are in landscape mode. 
screenHeight = application:getDeviceWidth()
screenWidth = application:getDeviceHeight()

--Create the back layer (the scrollable layer) of the screen
local allLayers = Sprite.new()
local background = Sprite.new() --the background image
background:addChild(Bitmap.new(Texture.new("grass.png")))
allLayers:addChild(background) --adding the background image to the back layer
stage:addChild(allLayers) --adding the back layer to the actual screen


--Create a dog and add it to the back layer
local d = Dog.new()
allLayers:addChild(d)

--Create the wallet item and add it to the stage (the front layer)
local wallet = Bank.new(1000)
stage:addChild(wallet)
wallet:setPosition(screenWidth-wallet:getWidth(), screenHeight-wallet:getHeight())


--Create the buttons: 

-- create the up and down sprites for button
local up = Bitmap.new(Texture.new("blankbutton.png"))
local down = Bitmap.new(Texture.new("blankbutton.png"))
down:setColorTransform(1,.5,1,.5) --just an easy way to dim the button when clicked

-- create and add button
local button = Button.new(up, down, "button1")
button:setPosition(0, screenHeight-button:getHeight())
stage:addChild(button)


--create the up and down sprites for button 2
local up2 = Bitmap.new(Texture.new("blankbutton.png"))
local down2 = Bitmap.new(Texture.new("blankbutton.png"))
down:setColorTransform(1,.5,1,.5) --just an easy way to dim the button when clicked


--create the menu that the button opens
--first create some up and down sprites for the menu's buttons:
menuUp1 = "button_up.png"
menuDown1="button_down.png"
menuUp2 = "button_up.png"
menuDown2 = "button_down.png"
buttons = {menuUp1, menuDown1, menuUp2, menuDown2}


menu=Menu.new(buttons)

--create the button
local button2 = Button.new(up2, down2, "button2", menu)
button2:setPosition(button2:getWidth()+5, screenHeight-button2:getHeight()) 
--add the button to the screen
stage:addChild(button2)




--The following is the mechanism for drag-scrolling through the environment (the back layer)

local dragging, startx, starty

local function onMouseDown(event)
	if (not scrollLocked) then 
		dragging = true
	end
	startx = event.x
	starty = event.y

end

local function onMouseMove(event)
	if dragging then
		local dx = event.x - startx
		local dy = event.y - starty
		newX = allLayers:getX()+dx
		newY = allLayers:getY()+dy

		if newX<1 and newX+background:getWidth()>screenWidth then
			allLayers:setX(newX)
		end
		if newY<1 and newY+background:getHeight()>screenHeight then
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

