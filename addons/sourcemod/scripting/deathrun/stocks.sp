stock void StringToVector(const char[] buffer, float vec[3], float defvalue[3] =  { 0.0, 0.0, 0.0 } )
{
	if (strlen(buffer) == 0)
	{
		vec[0] = defvalue[0];
		vec[1] = defvalue[1];
		vec[2] = defvalue[2];
		return;
	}
	
	char sPart[3][32];
	int iReturned = ExplodeString(buffer, StrContains(buffer, ",") != -1 ? ", " : " ", sPart, 3, 32);
	
	if (iReturned != 3)
	{
		vec[0] = defvalue[0];
		vec[1] = defvalue[1];
		vec[2] = defvalue[2];
		return;
	}
	
	vec[0] = StringToFloat(sPart[0]);
	vec[1] = StringToFloat(sPart[1]);
	vec[2] = StringToFloat(sPart[2]);
}

stock int TF2_GetItemInSlot(int client, int slot)
{
	int weapon = GetPlayerWeaponSlot(client, slot);
	if (!IsValidEntity(weapon))
	{
		// If no weapon was found in the slot, check if it is a wearable
		int wearable = SDK_GetEquippedWearable(client, slot);
		if (IsValidEntity(wearable))
			weapon = wearable;
	}
	
	return weapon;
}