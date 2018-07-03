/**
*  fn_endWave
*
*  Wave ended (mission complete)
*
*  Domain: Server
**/

bulwarkBox setVariable ["buildPhase", true, true];

["TaskSucceeded",["Complete","Wave " + str attkWave + " complete!"]] remoteExec ["BIS_fnc_showNotification", 0];
[0] remoteExec ["setPlayerRespawnTime", 0];

{
	// Try to force the spectator mode off when players are revived.
	["Terminate"] remoteExec ["BIS_fnc_EGSpectator", _x];

	// Revive players that died at the end of the round.
	if ((lifeState _x == "DEAD") || (lifeState _x == "INCAPACITATED")) then {
		forceRespawn _x;
	};
} foreach allPlayers;

sleep _downTime;