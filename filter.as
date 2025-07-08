#include "scripts/include/uerm.as"

void OnInitialize()
{
    RegisterCallback(PlayerChat_c, OnChat);
    TextFilter::Register();

    print(" ");
	print("------------------------------------------------------------------");
	print("[SERVER] Text Filter has been loaded successfully");
	print("[SERVER] By BelaRain");
	print("[SERVER] Repository - https://github.com/belarain/chat-filter-UERM");
	print("------------------------------------------------------------------");
	print(" ");

}

bool OnChat(Player player, string message)
{
    if (TextFilter::Contains(message)) { chat.SendPlayer(player, "[SERVER] No swear!"); return false; }
    return true;
}

namespace TextFilter
{
    string[] Words;

    void Register()
    {
        Add({"nigga", "n1gga", "negga", "nigger", "n1gger", "niggers", "n1ggers", "niggaz", "n1ggaz"});
        Add({"asshole", "assh0le", "assholes", "assh0les"});
        Add({"motherfucker", "m0therfucker", "motherfuckers", "m0therfuckers"});
        Add({"retard", "retards"});
        Add({"bastard", "bastards"});
        Add("kurwa"); // Bobr kurwa
        Add("moron"); // wattasigma
        Add({"idiot", "1d1ot", "1diot", "id1ot", "idiots", "1d1ots", "1diots", "id1ots"});
        Add({"bitch", "b1tch", "b1t4", "bit4", "bitches", "b1tches", "b1t4es", "bit4es"});
    }

    void Add(string word)
    {
        Words.push_back(word.lower());
    }

    void Add(string[] word)
    {
        for(int i = 0; i < word.size(); i++) Words.push_back(word[i].lower());
    }

    bool Contains(string input) 
    {
        for(int i = 0; i < Words.size(); i++) {
            if(input.lower().findFirst(Words[i]) >= 0) return true;
        }

        return false;
    }
}