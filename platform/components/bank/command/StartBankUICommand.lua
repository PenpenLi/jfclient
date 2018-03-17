--region *.lua  ������ʼ������ҳ��
--Date 2017/11/10
--yangyisong

local BankProxy = import("..proxy.BankProxy")
local BankMediator = import("..mediator.BankMediator")

local SimpleCommand = cc.load("puremvc").SimpleCommand
local StartBankUICommand = class("StartBankUICommand", SimpleCommand)

function StartBankUICommand:execute(notification)
    print("StartBankUICommand:execute")
    dump(notification,"StartBankUICommand notification")
	local platformFacade = cc.load("puremvc").Facade.getInstance("platform")
	platformFacade:registerProxy(BankProxy.new())   --ע��BankProxy
	platformFacade:registerMediator(BankMediator.new())   --ע��BankMediator
end

return StartBankUICommand

--endregion
