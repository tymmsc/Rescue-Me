Widgets = Core.class(Sprite)

function Widgets:init()
	self.shopWidget = Button.new("widget_shop.png", "widget_shop.png", "shop")

	self.animalWidget=Button.new("widget_animal.png", "widget_animal.png", "animal")
	
	self.miniGamesWidget = Button.new("widget_minigames.png", "widget_minigames.png", "minigames")
	
	self.statisticsWidget = Button.new("widget_statistics.png", "widget_statistics.png", "statistics")
	
	self.settingsWidget = Button.new("widget_settings.png", "widget_settings.png", "settings")
end

function Widgets:newWidget(widgetID)
	if self.shopWidget.ID == widgetID then
		print("new shop widget created")
		self:addChild(self.shopWidget)
	elseif self.animalWidget.ID == widgetID then
		print("new animal widget created")
		self:addChild(self.animalWidget)
	elseif self.miniGamesWidget.ID == widgetID then
		print("new minigames widget created")
		self:addChild(self.miniGamesWidget)
	elseif self.settingsWidget.ID == widgetID then
		print("new settings widget created")
		self:addChild(self.settingsWidget)
	elseif self.statisticsWidget.ID == widgetID then
		print("new statistics widget created")
		self:addChild(self.statisticsWidget)
	end
end

function Widgets:setScale(scaleX, scaleY)
	self.scaleX = scaleX
	self.scaleY = scaleY
	self.animalWidget.width = self.animalWidget.width * scaleX
	self.animalWidget.height = self.animalWidget.height * scaleX
	self.animalWidget:setScale(scaleX,scaleX)
	self.shopWidget.width = self.shopWidget.width * scaleX
	self.shopWidget.height = self.shopWidget.height * scaleX
	self.shopWidget:setScale(scaleX,scaleX)
	self.miniGamesWidget.width = self.miniGamesWidget.width * scaleX
	self.miniGamesWidget.height = self.miniGamesWidget.height * scaleX
	self.miniGamesWidget:setScale(scaleX,scaleX)
	self.statisticsWidget.width = self.statisticsWidget.width * scaleX
	self.statisticsWidget.height = self.statisticsWidget.height * scaleX
	self.statisticsWidget:setScale(scaleX,scaleX)
	self.settingsWidget.width = self.settingsWidget.width * scaleX
	self.settingsWidget.height = self.settingsWidget.height * scaleX
	self.settingsWidget:setScale(scaleX,scaleX)
end