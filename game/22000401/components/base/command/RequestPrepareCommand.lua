
local SimpleCommand = cc.load("puremvc").SimpleCommand
local RequestPrepareCommand = class("RequestPrepareCommand", SimpleCommand)

function RequestPrepareCommand:execute(notification)
    print("-------------->RequestPrepareCommand:execute")
    local name = notification:getName()
    local body = notification:getBody()
    local tp = notification:getType()
    local MyGameConstants = cc.exports.MyGameConstants

    if name == MyGameConstants.C_PREPARE_REQ then
        local pak1 = {
            iCID = GameUtils:getInstance():getSelfServerChair()
        }
        GameUtils:getInstance():sendNotification(15, pak1, "MJProto::TMJ_actionPlayerReady")

        -- ����׼��״̬(���ٿ�ʼģʽ����һ����׼��������ҵ������Զ���ƥ)
        local gameFacade = cc.load("puremvc").Facade.getInstance("game")
        local data = gameFacade:retrieveProxy("PlayerInfoProxy"):getData()
        local gameRoom = gameFacade:retrieveProxy("GameRoomProxy")
        if gameRoom:getData().gameState == MyGameConstants.GameStation.GS_WAIT_NEXT_ROUND then
            data.IsPrepare = true
        end
    end
end

return RequestPrepareCommand