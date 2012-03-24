--This is an unrefined class for a basic menu
--I took parts of this from the opensource GameTemplate example on the Gideros site. 

Menu=Core.class(Sprite)


--In the future it will take in an array of button images that will appear on the menu. 

function Menu:init(buttonImages)
	screenHeight = application:getDeviceWidth()
	screenWidth = application:getDeviceHeight()
	
	
--Create the menu shape - a semi-transparent rectangle scaled to the screen size. 
	local menu = Shape.new()
	menu:setFillStyle(Shape.SOLID, 0xffffff, 0.5)   
	menu:beginPath(Shape.NON_ZERO)
	menu:moveTo(screenWidth/5,screenHeight/16)
	menu:lineTo((screenWidth/5)*4, screenHeight/16)
	menu:lineTo((screenWidth/5)*4, screenHeight-(screenHeight/16))
	menu:lineTo(screenWidth/5, screenHeight-(screenHeight/16))
	menu:lineTo(screenWidth/5, screenHeight/16)
	menu:endPath()	
	--add the array of buttons
	if not (buttonImages==nil) then
		size = #buttonImages --The "#" sign followed by a table (ie array) gives the table's size (assuming normal indices)
		
		for i=1,size,2 do
			menu:addChild(menuButton(buttonImages[i], buttonImages[i+1],menu, (i+1)/2, size/2))
			
		end
	end

	--adds a universal "X" button on all menus. When clicked it exits the menu.
	XDown = Bitmap.new(Texture.new("XButton.png"))
	XDown:setColorTransform(.1,.1,.1,1)
	local exitButton = menuButton("XButton.png","XButton.png", menu, 0, 4)
	menu:addChild(exitButton)
	exitButton:addEventListener("click", 
		function()	
			stage:removeChild(self)
			scrollLocked=false
		end
	)
	self:addChild(menu)

	
end

--This displays the menu, and sets scrollLocked to true. 
--ScrollLocked is here to prevent background scrolling and clicking other buttons when a menu is open.
function Menu:display()
	stage:addChild(menu)
	scrollLocked=true
end


--This is the basic function that creates a menuButton, a button for a menu. 
--"current" is the number button it is, and "all" is the total number of buttons on the menu.

menuButton = function(image1, image2, container, current, all)
	local newButton = Button.new(Bitmap.new(Texture.new(image1)), Bitmap.new(Texture.new(image2)))
	
	if current==0 then --then it's the exit, "X" button
		newButton:setScale((.20*container:getWidth())/newButton:getWidth())
		newButton:setPosition(.8*screenWidth-newButton:getWidth(), 1/16*screenHeight)

	else		
	    newButton:setScale((container:getWidth()/newButton:getWidth())*.8)
	   
		local startHeight = (current-1)*(container:getHeight())/all + (((container:getHeight())/all)-newButton:getHeight())/2 + screenHeight/16
		newButton:setPosition((screenWidth-newButton:getWidth())/2, startHeight)
	end
	
	return newButton;
end 
