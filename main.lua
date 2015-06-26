function Initialize(Plugin)
	Plugin:SetName("SignShop")
	Plugin:SetVersion(1)

	cPluginManager:AddHook(cPluginManager.HOOK_UPDATED_SIGN, OnUpdatedSign);
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_RIGHT_CLICK, OnPlayerRightClick);
	LOG("Initialised " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end
function OnUpdatedSign(World, BlockX, BlockY, BlockZ, Line1, Line2, Line3, Line4, Player)
	if Line1 == "[SignShop]" then
		Player:SendMessage("SignShop created")
	end
end
function OnPlayerRightClick(Player, BlockX, BlockY, BlockZ, BlockFace, CursorX, CursorY, CursorZ)
	local world = Player:GetWorld()
	here, line1,buying,selling,item = world:GetSignLines(BlockX,BlockY,BlockZ)

	if line1 == "[SignShop]" then
		Player:SendMessage("You are using a sign shop :)")
		return true
	end
	return false
end