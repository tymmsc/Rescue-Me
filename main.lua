stage:setOrientation(Stage.LANDSCAPE_LEFT)


local background = Bitmap.new(Texture.new("grass.png"))
stage:addChild(background)

local d = Dog.new()
stage:addChild(d)


local wallet = Bank.new(1000)
stage:addChild(wallet)
wallet:setPosition(240,160)