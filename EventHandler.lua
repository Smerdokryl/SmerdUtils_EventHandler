if not SmerdUtils then SmerdUtils = {} end


local function OnEvent(self, event, ...)
	self.events[event](...);
end


SmerdUtils.EventHandler = CreateFrame('FRAME');
SmerdUtils.EventHandler.events = {};

function SmerdUtils.EventHandler:New(frame)
	frame = frame or CreateFrame('FRAME');
	setmetatable(frame, self);
	self.__index = self;
	frame:SetScript('OnEvent', OnEvent);
	return frame;
end

function SmerdUtils.EventHandler:Register(event, func)
	self.events[event] = func;
	self:RegisterEvent(event);
end
