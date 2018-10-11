﻿/*
* Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

/* ScriptData
SDName: Npc_Innkeeper
SDAuthor: WarHead
SD%Complete: 99%
SDComment: Complete
SDCategory: NPCs
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "GameEventMgr.h"
#include "Player.h"
#include "WorldSession.h"

enum Spells
{
    SPELL_TRICK_OR_TREATED = 24755,
    SPELL_TREAT = 24715
};

#define LOCALE_TRICK_OR_TREAT_0 u8"不招待就使坏!"
#define LOCALE_TRICK_OR_TREAT_2 "Des bonbons ou des blagues!"
#define LOCALE_TRICK_OR_TREAT_4 u8"不招待就使坏!"

#define LOCALE_INNKEEPER_0 u8"把这个旅馆设置成我的家."
#define LOCALE_INNKEEPER_2 "Faites de cette auberge votre foyer."
#define LOCALE_INNKEEPER_4 u8"把这个旅馆设置成我的家."

#define LOCALE_VENDOR_0 u8"我想看看你的货物."
#define LOCALE_VENDOR_2 "Je voudrais regarder vos articles."
#define LOCALE_VENDOR_4 u8"我想看看你的货物."

class npc_innkeeper : public CreatureScript
{
public:
    npc_innkeeper() : CreatureScript("npc_innkeeper") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (IsHolidayActive(HOLIDAY_HALLOWS_END) && !player->HasAura(SPELL_TRICK_OR_TREATED))
        {
            char const* localizedEntry;
            switch (player->GetSession()->GetSessionDbcLocale())
            {
            case LOCALE_frFR: localizedEntry = LOCALE_TRICK_OR_TREAT_2; break;
            case LOCALE_zhCN: case LOCALE_zhTW: localizedEntry = LOCALE_TRICK_OR_TREAT_4; break;
            case LOCALE_enUS: default: localizedEntry = LOCALE_TRICK_OR_TREAT_0;
            }
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, localizedEntry, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }

        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (creature->IsVendor())
        {
            char const* localizedEntry;
            switch (player->GetSession()->GetSessionDbcLocale())
            {
            case LOCALE_frFR: localizedEntry = LOCALE_VENDOR_2; break;
            case LOCALE_zhCN: case LOCALE_zhTW: localizedEntry = LOCALE_VENDOR_4; break;
            case LOCALE_enUS: default: localizedEntry = LOCALE_VENDOR_0;
            }
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, localizedEntry, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
        }

        if (creature->IsInnkeeper())
        {
            char const* localizedEntry;
            switch (player->GetSession()->GetSessionDbcLocale())
            {
            case LOCALE_frFR: localizedEntry = LOCALE_INNKEEPER_2; break;
            case LOCALE_zhCN: case LOCALE_zhTW: localizedEntry = LOCALE_INNKEEPER_4; break;
            case LOCALE_enUS: default: localizedEntry = LOCALE_INNKEEPER_0;
            }
            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, localizedEntry, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INN);
        }

        player->TalkedToCreature(creature->GetEntry(), creature->GetGUID());
        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
    {
        ClearGossipMenuFor(player);
        if (action == GOSSIP_ACTION_INFO_DEF + 1 && IsHolidayActive(HOLIDAY_HALLOWS_END) && !player->HasAura(SPELL_TRICK_OR_TREATED))
        {
            player->CastSpell(player, SPELL_TRICK_OR_TREATED, true);

            if (urand(0, 1))
                player->CastSpell(player, SPELL_TREAT, true);
            else
            {
                uint32 trickspell = 0;
                switch (urand(0, 13))
                {
                case 0: trickspell = 24753; break; // cannot cast, random 30sec
                case 1: trickspell = 24713; break; // lepper gnome costume
                case 2: trickspell = 24735; break; // male ghost costume
                case 3: trickspell = 24736; break; // female ghostcostume
                case 4: trickspell = 24710; break; // male ninja costume
                case 5: trickspell = 24711; break; // female ninja costume
                case 6: trickspell = 24708; break; // male pirate costume
                case 7: trickspell = 24709; break; // female pirate costume
                case 8: trickspell = 24723; break; // skeleton costume
                case 9: trickspell = 24753; break; // Trick
                case 10: trickspell = 24924; break; // Hallow's End Candy
                case 11: trickspell = 24925; break; // Hallow's End Candy
                case 12: trickspell = 24926; break; // Hallow's End Candy
                case 13: trickspell = 24927; break; // Hallow's End Candy
                }
                player->CastSpell(player, trickspell, true);
            }
            CloseGossipMenuFor(player);
            return true;
        }

        CloseGossipMenuFor(player);

        switch (action)
        {
        case GOSSIP_ACTION_TRADE: player->GetSession()->SendListInventory(creature->GetGUID()); break;
        case GOSSIP_ACTION_INN: player->SetBindPoint(creature->GetGUID()); break;
        }
        return true;
    }


    struct npc_innkeeperAI : public ScriptedAI
    {
        npc_innkeeperAI(Creature* creature) : ScriptedAI(creature) { }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_innkeeperAI(creature);
    }
};

void AddSC_npc_innkeeper()
{
    new npc_innkeeper();
}
