
local MacroCommand = cc.load("puremvc").MacroCommand
local StartLoadCommand = class("StartLoadCommand", MacroCommand)

function StartLoadCommand:ctor()
	StartLoadCommand.super.ctor(self)	
	self:addSubCommand(cc.exports.InitConfigCommand)
	--self:addSubCommand(cc.exports.RequestConfigCommand) --��loadMediator���ִ��RequestConfigCommand��û��Ҫ��������
end

return StartLoadCommand