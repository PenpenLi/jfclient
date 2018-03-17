
local SimpleCommand = cc.load("puremvc").SimpleCommand
local CPEatReqCommand = class("CPEatReqCommand", SimpleCommand)

local EatChoiceMediator = import("..mediator.EatChoiceMediator")

function CPEatReqCommand:execute(notification)
    print("-------------->CPEatReqCommand:execute")
    local name = notification:getName()
    local body = notification:getBody()
    local tp = notification:getType()
    local MyGameConstants = cc.exports.MyGameConstants

    local gameFacade = cc.load("puremvc").Facade.getInstance("game")
    local data = gameFacade:retrieveProxy("CPGMenuProxy"):getData()
    local ActNotifyData = data.ActNotifyData

    if name == MyGameConstants.C_EAT_REQ then

        -- ���ֻ��һ�ֳԷ���ֱ�ӳ� �������ʾ�Ե�ѡ�����
        local eatFlag = ActNotifyData.usChiFlags

        if eatFlag == MyGameConstants.EatType.usT
            or eatFlag == MyGameConstants.EatType.usZ
            or eatFlag == MyGameConstants.EatType.usW then
            -- ֱ�ӷ��ͳ�������
            local pak1 = {
                chiValue = 0,
                ActFlag = MyGameConstants.MJActFlag.Chi,
                EatFlag = eatFlag,
            }
            GameUtils:getInstance():sendNotification(24, pak1, "MJContext::TMJ_actionPlayerReady")
        else
            -- ���ֳ���ѡ�����
            local image_root = gameFacade:retrieveMediator("MainMediator").image_root
            gameFacade:registerMediator(EatChoiceMediator.new(image_root))
        end


    end
end

return CPEatReqCommand