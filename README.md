# nanos-networked-blueprint-properties

# Example code (Serverside) :
```lua
local eBlueprint = Blueprint(Vector(), Rotator(), "myAssetPack::NewBlueprint")
eBlueprint:SetBlueprintPropertyValue("TestProperty", "Hello World")
eBlueprint:GetBlueprintPropertyValue("TestProperty", function( sPropertyName, sPropertyValue)
    Console.Log("Property Name: " .. sPropertyName)
    Console.Log("Property Value: " .. sPropertyValue)
end)
```

# Functions :
```lua
Blueprint:SetBlueprintPropertyValue(sPropertyName, xValue)
Blueprint:GetBlueprintPropertyValue(sPropertyName, fCallback)
```
