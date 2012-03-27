stage:setOrientation(Stage.LANDSCAPE_LEFT)


--the "screenHeight" is actually the Device's width, and vice versa, since we are in landscape mode. 
screenHeight = application:getDeviceWidth()
screenWidth = application:getDeviceHeight()
require "widgets"

stage:setOrientation(Stage.LANDSCAPE_LEFT)

-- getDeviceWidth() returns the screen's height in landscape
-- getDeviceHeight() returns the screen's width in landscape
local W = application:getDeviceHeight()
local H = application:getDeviceWidth()
local scaleX = W/480
local scaleY = H/320
print("screen: " .. W .. " x " .. H)
print("scale: " .. scaleX .. ", " .. scaleY)


--Create the back layer (the scrollable layer) of the screen
local allLayers = Layer.new()
stage:addChild(allLayers) --adding the back layer to the actual screen
scale=1
allLayers:setScale(scale)

--Create a dog and add it to the back layer
local d = Dog.new()
allLayers:addChild(d)

--Create the wallet item and add it to the stage (the front layer)
local wallet = Bank.new(1000)
stage:addChild(wallet)
wallet:setPosition(screenWidth-wallet:getWidth(), screenHeight-wallet:getHeight())





--create the up and down sprites for button
local up2 = Bitmap.new(Texture.new("blankbutton.png"))
local down2 = Bitmap.new(Texture.new("blankbutton.png"))
down2:setColorTransform(1,.5,1,.5) --just an easy way to dim the button when clicked


--create the menu that the button opens
--first create some up and down sprites for the menu's buttons:
menuUp1 = "button_up.png"
menuDown1="button_down.png"
menuUp2 = "button_up.png"
menuDown2 = "button_down.png"
buttons = {Button.new(menuUp1, menuDown1), Button.new(menuUp2, menuDown2)}

menu=Menu.new(buttons)

--create a button, which opens a menu
local button2 = Button.new(up2, down2, "button2", menu)
button2:setPosition(0, screenHeight-button2:getHeight()) 
--add the button to the screen
stage:addChild(button2)


local widgets = Widgets.new()
widgets:setScale(scaleX,scaleY)
widgets:newWidget("animal")
widgets:newWidget("shop")
widgets:newWidget("minigames")
widgets:newWidget("statistics")
widgets:newWidget("settings")
stage:addChild(widgets)
local w = widgets.animalWidget.width
widgets.animalWidget.view:setPosition(W/10-w/2,H-widgets.animalWidget.height)
widgets.shopWidget:setPosition(3*W/10-w/2,H-widgets.shopWidget.height)
widgets.miniGamesWidget.view:setPosition(W/2-w/2,H-widgets.miniGamesWidget.height)
widgets.statisticsWidget.view:setPosition(7*W/10-w/2,H-widgets.statisticsWidget.height)
widgets.settingsWidget.view:setPosition(9*W/10-w/2,H-widgets.settingsWidget.height)

