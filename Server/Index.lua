local tPendingProperties = {}

---@param sName string
---@param xValue any
function Blueprint:SetBlueprintPropertyValue( sName, xValue )
    local tProperties = self:GetValue("NetworkedBlueprintProperties", {})
    tProperties[sName] = xValue
    self:SetValue("NetworkedBlueprintProperties", tProperties, true)
end

---@param sName string
---@param fCallback function
function Blueprint:GetBlueprintPropertyValue( sName, fCallback )
    if ( self:GetNetworkAuthority() ) then
        tPendingProperties[sName] = { self:GetNetworkAuthority(), fCallback }
        Events.CallRemote("netbp::GetProperty", self:GetNetworkAuthority(), self, sName)
    end
end

Events.SubscribeRemote("netbp::SendProperty", function( pPlayer, sPropertyName, xValue)
    if ( tPendingProperties[sPropertyName] ) then
        local tPendingProperty = tPendingProperties[sPropertyName]
        if ( tPendingProperty[1] == pPlayer ) then
            tPendingProperty[2]( sPropertyName, xValue)
            tPendingProperties[sPropertyName] = nil
        end
    end
end)
