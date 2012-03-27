--This is a button class modified from code in an open-source Gideros example, GameTemplate

--[[
A generic button class

This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
(C) 2010 - 2011 Gideros Mobile 
]]

Button = Core.class(Sprite)


---------------------------------------------------
--[[
Button takes in an upState bitmap image, downState 
bitmap image, string ID, and sprite object. 
The sprite is what opens when the button is clicked. 
If no sprite is given then the button does nothing,
except it changes its appearance to downState while clicked. 
]]
----------------------------------------------------

function Button:init(upState, downState, ID, sprite)
	self.width = 32
	self.height = 32
	self.ID=ID
	self.upState = upState
	self.downState = downState
	if type(self.upState)=="string" then
		self.upState = Bitmap.new(Texture.new(upState))
	end
	if type(self.downState)=="string" then
		self.downState = Bitmap.new(Texture.new(downState))
	end
	if self.downState==nil then
		self.downState = self.upState 
		self.downState:setColorTransform(1,.5,1.,5)
	end
	self.focus = false
	self.activated=false
	-- set the visual state as "up"
	self:updateVisualState(false)
	self.name=name
	if not(sprite==nil) then
		self.sprite=sprite
	end
	
	-- register to all mouse and touch events
	self:addEventListener(Event.MOUSE_DOWN, self.onMouseDown, self)

	self:addEventListener(Event.MOUSE_UP, self.onMouseUp, self)

	self:addEventListener(Event.TOUCHES_BEGIN, self.onTouchesBegin, self)
	self:addEventListener(Event.TOUCHES_MOVE, self.onTouchesMove, self)
	self:addEventListener(Event.TOUCHES_END, self.onTouchesEnd, self)
	self:addEventListener(Event.TOUCHES_CANCEL, self.onTouchesCancel, self)
end

function Button:addMenu(menu)
	self.hasMenu=true
	self.menu=menu
end
	
--When the button is clicked, a message prints and the sprite, if present, opens. 
--The clicked button also takes on the image of downState when it is clicked.

function Button:onMouseDown(event)
	if self:hitTestPoint(event.x, event.y) then
		print("Button ", self.ID, "clicked.")
		self.focus = true
		self:updateVisualState(true)
		if not(self.sprite==nil) then
			stage:addChild(self.sprite)
			scrollLocked=true
		
		end
		event:stopPropagation()
	end
end




--When a click is over, the button switches back to the upState image
function Button:onMouseUp(event)
	if self.focus then
		self.focus = false
		self:updateVisualState(false)
		self:dispatchEvent(Event.new("click"))	-- button is clicked, dispatch "click" event
		event:stopPropagation()
	end
end

-- if button is on focus, stop propagation of touch events
function Button:onTouchesBegin(event)
	if self.focus then
		event:stopPropagation()
	end
end

-- if button is on focus, stop propagation of touch events
function Button:onTouchesMove(event)
	if self.focus then
		event:stopPropagation()
	end
end

-- if button is on focus, stop propagation of touch events
function Button:onTouchesEnd(event)
	if self.focus then
		event:stopPropagation()
	end
end

-- if touches are cancelled, reset the state of the button
function Button:onTouchesCancel(event)
	if self.focus then
		self.focus = false;
		self:updateVisualState(false)
		event:stopPropagation()
	end
end


--this function is used to switch between upState and downState
-- if 'state' is true show downState else show upState

function Button:updateVisualState(state)
	if state then
		if self:contains(self.upState) then
			self:removeChild(self.upState)
		end
		
		if not self:contains(self.downState) then
			self:addChild(self.downState)
		end
	else
		if self:contains(self.downState) then
			self:removeChild(self.downState)
		end
		
		if not self:contains(self.upState) then
			self:addChild(self.upState)
		end
	end
end
