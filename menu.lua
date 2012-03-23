--This is a class for a basic menu.

Menu=Core.class(Sprite)

function Menu:init()
	self:addChild(Bitmap.new(Texture.new("dog.png")))
end