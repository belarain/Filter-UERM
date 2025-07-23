#include "include/uerm.as"
#include "utils.as"
#include "spawnpoints.as"
#include "roles.as"
#include "players.as"
#include "round.as"
#include "lobby.as"
#include "bans.as"
#include "adminpanel.as"

void OnInitialize() // Initialize when script loads. Don't use WORLD functions there.
{
	RegisterAllCallbacks();

	AdminPanel::Register();
	PlayerCallbacks::Register();
	Lobby::Create();

	@GlobalBans = BanList("banlist.txt");
	
	CreateTimer(Round::Update, 1000, true);
	CreateTimer(Lobby::Update, 1000, true);
	CreateTimer(Round::Promo, 150000, true);
	
	server.disablenpcs = true; // Forcely set disablenpcs flag
	server.gamemode = "Breach";
	server.respawntime = 0;

	print(" ");
	print("-------------------------------------------------------------------");
	print("[SERVER] Breach Mode modified with FondationX has been loaded");
	print("[SERVER] Developers: BelaRain, EthanSpleefan");
	print("[SERVER] Repository: https://github.com/FoundationXAU/SCP-CB-Breach");
	print("-------------------------------------------------------------------");
	print(" ");
}

void OnWorldUpdate()
{
	for(int i = 0; i < connPlayers.size(); i++) {
		if(connPlayers[i].IsBot()) PlayerTimers::BotLogic(connPlayers[i]);
	}
}

void OnWorldLoaded()
{
	Lobby::Load();
}