
local Proxy = cc.load("puremvc").Proxy
local ProxyData = cc.load("jfutils").ProxyData
local HallProxy = class("HallProxy", Proxy)

function HallProxy:ctor()
	HallProxy.super.ctor(self, "HallProxy")
    local data = ProxyData.new()
    local networkType = cc.exports.getNetworkType()
    data:prop("bgMusicID", nil)         --��������id
    data:prop("effectMusicCanPlay", 1)  --��ť��Ч�Ƿ��ܲ��� 1�ܲ��ţ�0���ܲ���
    data:prop("bgMusicCanPlay",1)       --������Ч�Ƿ��ܲ��� 1�ܲ��ţ�0���ܲ���
    data:prop("netstate", networkType)  --��ǰ������WIFI����4G
    self:setData(data)
end

function HallProxy:onRegister()
end

function HallProxy:onRemove()
end

return HallProxy