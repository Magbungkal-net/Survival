npc_magbungkalhelp:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == npc_mageshaman:
          - execute as_player "magbungkalhelp"
        - if !<context.entity.mythicmob.internal_name> == npc_mageshaman:
          - determine cancelled

npc_profile:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == adventurerNPC:
          - execute as_player "profile"
        - if !<context.entity.mythicmob.internal_name> == adventurerNPC:
          - determine cancelled

npc_discord:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == Wumpus:
          - execute as_player "discord"
        - if !<context.entity.mythicmob.internal_name> == Wumpus:
          - determine cancelled

npc_vote:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == TavernNPC:
          - execute as_player "magbungkalvote"
        - if !<context.entity.mythicmob.internal_name> == TavernNPC:
          - determine cancelled

npc_store:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == ECNPCs_AdventurerTwinblade_Passive:
          - execute as_player "store"
        - if !<context.entity.mythicmob.internal_name> == ECNPCs_AdventurerTwinblade_Passive:
          - determine cancelled

npc_cshop:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == ECNPCs_AdventurerHemlock_Passive:
          - execute as_player "cshop"
        - if !<context.entity.mythicmob.internal_name> == ECNPCs_AdventurerHemlock_Passive:
          - determine cancelled

npc_ranks:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == ECNPCs_AdventurerBerserk_Passive:
          - execute as_player "ranks"
        - if !<context.entity.mythicmob.internal_name> == ECNPCs_AdventurerBerserk_Passive:
          - determine cancelled

npc_daily:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == ECNPCs_AdventurerSwordman_Passive:
          - execute as_player "daily"
        - if !<context.entity.mythicmob.internal_name> == ECNPCs_AdventurerSwordman_Passive:
          - determine cancelled

npc_economy:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == kingNPC:
          - execute as_player "economy"
        - if !<context.entity.mythicmob.internal_name> == kingNPC:
          - determine cancelled

npc_dwarf:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == npc_dwarf:
          - execute as_player "buystones"
        - if !<context.entity.mythicmob.internal_name> == npc_dwarf:
          - determine cancelled

npc_mshop:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == npc_kingdom_guardian:
          - execute as_player "mshop"
        - if !<context.entity.mythicmob.internal_name> == npc_kingdom_guardian:
          - determine cancelled

npc_pyromining:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == minerNPC:
          - execute as_player "mine menu"
        - if !<context.entity.mythicmob.internal_name> == minerNPC:
          - determine cancelled

npc_scrolls:
    type: world
    debug: false
    events:
        on player right clicks mythic_mob:
        - if <context.entity.mythicmob.internal_name> == npc_farmer:
          - execute as_player "scrolls"
        - if !<context.entity.mythicmob.internal_name> == npc_farmer:
          - determine cancelled