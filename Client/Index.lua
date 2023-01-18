-- Called from server to get a property value
Events.SubscribeRemote("netbp::GetProperty", function( eBlueprint, sProperty )
    local xPropertyValue = eBlueprint:GetBlueprintPropertyValue(sProperty)

    -- Sends the property value back to the server
    Events.CallRemote("netbp::SendProperty", sProperty, xPropertyValue)
end)

-- Syncs the properties to the client
Blueprint.Subscribe("Spawn", function(eBlueprint)
    local tProperties = eBlueprint:GetValue("NetworkedBlueprintProperties")
    if (tProperties) then
        for k,v in pairs(tProperties) do
            eBlueprint:SetBlueprintPropertyValue(k, v)
        end
    end
end)
