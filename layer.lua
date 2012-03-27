Layer = Core.class(Sprite)

function Layer:init()
	self.background = Sprite.new() --the background image
	self.background:addChild(Bitmap.new(Texture.new("grass.png")))
	self.background:setScale(1.5)
	self:addChild(self.background) --adding the background image to the back layer
	print("Layer added.")
	self:addEventListener(Event.MOUSE_DOWN, self.onMouseDown, self)
	self:addEventListener(Event.MOUSE_MOVE, self.onMouseMove, self)
	self:addEventListener(Event.MOUSE_UP, self.onMouseUp, self)
	self:addEventListener(Event.TOUCHES_BEGIN, self.onTouchesBegin, self)
	self:addEventListener(Event.TOUCHES_MOVE, self.onTouchesMove, self)
	self:addEventListener(Event.TOUCHES_END, self.onTouchesEnd, self)
	self:addEventListener(Event.TOUCHES_CANCEL, self.onTouchesCancel, self)
	local dragging, startx, starty
	zoomArray = {-1,-1,-1,-1,-1,-1,-1,-1}


end
	



----------------------------------------------------
--The following is the mechanism for drag-scrolling
--through the environment (the back layer).
----------------------------------------------------


function Layer:onMouseDown(event)
	if (not scrollLocked) then 
		dragging = true
	end
	startx = event.x
	starty = event.y

end

function Layer:onMouseMove(event)
	if dragging then
		local dx = event.x - startx
		local dy = event.y - starty
		newX = self:getX()+dx
		newY = self:getY()+dy

		if newX<1 and newX+(self.background:getWidth()*scale)>screenWidth then
			self:setX(newX)
		end
		if newY<1 and newY+self.background:getHeight()*scale>screenHeight then
			self:setY(newY)
		end
		startx = event.x
		starty = event.y
	end
end

function Layer:onMouseUp(event)
	dragging = false
end



-----------------------------------------
--The following is the mechanism for zooming in 
--and out using two touches to pinch-zoom.
------------------------------------------

--This function zooms in based upon an array of size 8 
--that it takes in. The array is, respectively, the 
--x and y coordinates of the first touch initially, 
--the x and y coordinates of the second touch initially,
--the x and y coordinates of the first touch after moving, 
--the x and y coordinates of the second touch after moving.


function Layer:zoom(z)
	dx = math.abs(z[1]-z[3])
	dy = math.abs(z[2]-z[4])
	newdx = math.abs(z[5]-z[7])
	newdy = math.abs(z[6]-z[8])
	if (newdx<=dx and newdy<=dy) or (newdx>=dx and newdy>=dy) then 
		scaleVar = scale * (dx/newdx + dy/newdy)/2
		scaleVar = 1/2 * scaleVar + 1/2
		if (scaleVar)>.5 and (scaleVar<2) then
			scale=scaleVar
			self:setScale(scale)
		end
	end
end
 
 function Layer:find(list, item)
	found=false
	for i = 1, #list do
		if list[i]==item then
			found=true
		end
	end
	return found
end

 
function Layer:onTouchesBegin(event)
  
	for i=1,#event.touches do
		zoomArray[event.touches[i].id*2 -1]= event.touches[i].x
		zoomArray[event.touches[i].id*2] = event.touches[i].y
	
	end
end
 
function Layer:onTouchesMove(event)

	for i=1,#event.touches do

		zoomArray[event.touches[i].id*2 + 3] = event.touches[i].x
		zoomArray[event.touches[i].id*2+4] = event.touches[i].y
		if not(find(zoomArray, -1)) then 
			zoom(zoomArray)
		end

	end
end
 
function Layer:onTouchesEnd(event)
	zoomArray = {-1,-1,-1,-1,-1,-1,-1,-1}
end
 
function Layer:onTouchesCancel(event)
	printTouches("CANCEL", event)
 
	
end
 
 


