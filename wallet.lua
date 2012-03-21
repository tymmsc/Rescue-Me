Bank = Core.class(Sprite)

function Bank:init(dollars)
	self.dollars = dollars
	self.view = TextField.new(nil, "$"..self.dollars)
	self:addChild(self.view)
end

function Bank:amount()
	return self.dollars
end

function Bank:deposit(dollars)
	self.dollars = self.dollars + dollars
end

function Bank:withdraw(dollars)
	if self.dollars < dollars then
		print("insufficient funds")
	else
		self.dollars = self.dollars - dollars
	end
end

function Bank:isEmpty()
	if self.dollars == 0 then
		return true
	end
	return false
end

function Bank:update()
	self:removeChild(self.view)
	self.view = nil
	self.view = TextField.new(nil, "$"..self.dollars)
	self:addChild(self.view)
end