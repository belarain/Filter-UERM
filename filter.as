#include "scripts/include/uerm.as"

void OnInitialize()
{
    RegisterCallback(PlayerChat_c, OnChat);
    ChatFilter::Register();

    print(" ");
	print("------------------------------------------------------------------");
	print("[SERVER] Chat Filter has been loaded successfully");
	print("[SERVER] By BelaRain");
	print("[SERVER] Repository - https://github.com/belarain/chat-filter-UERM");
	print("------------------------------------------------------------------");
	print(" ");

}

bool OnChat(Player player, string message)
{
    if (ChatFilter::Contains(message)) { chat.SendPlayer(player, "[SERVER] No swear!"); return false; }
    return true;
}

namespace ChatFilter
{
    string[] Words;

    void Register()
    {
        Add({"nigga", "n1gga", "negga", "nigge", "n1gge"});
        Add({"asshole", "assh0le"});
        Add({"motherfuck", "m0therfuck"});
        Add("retard");
        Add("bastard");
        Add("moron"); // wattasigma
        Add({"idiot", "1d1ot", "1diot", "id1ot"});
        Add({"bitch", "b1tch", "b1t4", "bit4"});
    }

    void Add(string[] word)
    {
        for(int i = 0; i < word.size(); i++) Words.push_back(word[i].lower());
    }

    void Add(string word)
    {
        Words.push_back(word.lower());
    }

    bool Contains(string msg) 
    {
        for(int i = 0; i < Words.size(); i++) {
            if(msg.lower().findFirst(Words[i]) >= 0) return true;
        }

        return false;
    }
}