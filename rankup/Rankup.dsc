# @Dotxzxc Rankup Script
# REQUIREMENTS (all optional)
# money
# playtime
# votes
# items
# advancements
force_rankup_command:
  type: command
  debug: false
  name: forcerankup
  usage: /forcerankup
  permission: denizen.force_rankup
  description: Type /rankup to ascend into a higher rank
  tab complete:
  - determine details
  script:
  - define rank <luckperms.track[rankupsystem].groups[<player>].get[1]>
  - define data <script[rankup_data]>
  - define rankData <[data].data_key[ranks.<[rank]>]>
  - if <context.args.get[1]||null> == detail || <context.args.get[1]||null> == details:
    - inject rankup_details
    - stop
  # <&8><&l>[<&6><&l>!<&8><&l>]
  - if <[rank]> == netheritev:
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>You have reached the highest rank!"
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>You have reached the highest rank!"
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>You have reached the highest rank!"
    - playsound sound:ENTITY_POLAR_BEAR_WARNING <player.location>
    - stop

  #
  # Changes here [- if <[rank]> == "":]
  #
   # error checking
  - if <[rank]> == " ":
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Rankup data error contact a system admin on the Magbungkal Discord ~1"
    - playsound sound:ENTITY_POLAR_BEAR_WARNING <player.location>
    - stop
  - if <[data].data_key[ranks].keys.contains[<[rank]>].not>:
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Rankup data error contact a system admin on the Magbungkal Discord ~2"
    - playsound sound:ENTITY_POLAR_BEAR_WARNING <player.location>
    - stop
  - if <script[rankup_data]||null> == null:
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Rankup data error contact a system admin on the Magbungkal Discord ~3"
    - playsound sound:EENTITY_POLAR_BEAR_WARNING <player.location>
    - stop

  # rankup verification
  - if <player.has_flag[confirmRankup]>:
    #- if <script[rank_health_data].list_keys[ranks].contains[<[rank]>]>:
    #  - define new_health <script[rank_health_data].data_key[ranks].get[<[rank]>]>
    #  - adjust <player> health_data:<[new_health]>/<[new_health]>
    - if <[rankData].get[requirements].keys.contains[money]>:
      - money take quantity:<[rankData].get[requirements].get[money]>
      - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>₱<[rankData].get[requirements].get[money]> has been taken from your account."
    - if <[rankData].get[requirements].keys.contains[items]>:
      - foreach <[rankData].get[requirements].get[items]>:
        - take material:<[key]> quantity:<[value]>
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f><[value]> <material[<[key]>].name.replace_text[_].with[ ]> has been taken from your inventory."
    - playsound <player> volume:0.8 pitch:0.3 sound:UI_TOAST_CHALLENGE_COMPLETE
    - announce "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f><player.name> <&f>has ranked up! (/rankup)"

    - define name <player.name>
    - define rank <placeholder[luckperms_primary_group_name].player[<player>].to_uppercase>
    - if <[rank]> == <element[Default]>:
      - define rank Default
    - define message "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f><player.name> has ranked up! (/rankup)"

    - toast "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>You have ranked up!" icon:<[rankData].get[icon]||golden_helmet>
    - execute as_server "lp user <player.name> promote rankupsystem"
    - adjust <player> max_health:<[rankData].get[heart]>
    - playeffect effect:TRIAL_SPAWNER_SPAWN at:<player.location.add[0,3,0]> quantity:20 data:1 offset:0.0
# discord message
    - definemap message_map:
          author_name: <player.name> has rankup! (/rankup)
          author_icon_url: https://mc-heads.net/avatar/<player.name>
          color: orange
    - define rankup_message <discord_embed.with_map[<[message_map]>]>
    - ~discordmessage id:magbungkal channel:1182512909654438068 <[rankup_message]>
  - else:
    - flag player confirmRankup duration:30s
    - if <[rankData].get[requirements].keys.contains[money]> || <[rankData].get[requirements].keys.contains[items]>:
      # - narrate <empty>
      # - narrate "  <&6>Are you sure you want to rankup?"
      # - narrate "  <&6>You will lose the following items:"
      # - narrate <empty>
      - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
      - define text <list[<&0><n><n><&l>Are you sure that you want to rankup?<n><n>You will lose this amount of money:<n><n><&8><&l>• <&a><&l>₱<[rankData].get[requirements].get[money]><n><n><n><&0><&l>Please click <&click[/rankup].type[RUN_COMMAND]><&a><&l>[YES]<&end_click> <&0><&l>to confirm.]>
      - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      - if <[rankData].get[requirements].keys.contains[money]>:
        # - narrate "  <&f>• ₱<[rankData].get[requirements].get[money]>"
        - define text <list[<&0><n><n><&l><&0>• ₱<[rankData].get[requirements].get[money]>]>
      - if <[rankData].get[requirements].keys.contains[items]>:
        - foreach <[rankData].get[requirements].get[items]>:
          - narrate "  <&f>• <[value]> <material[<[key]>].name.replace_text[_].with[ ]>"
      - narrate <empty>
    - else:
      # - narrate <empty>
      # - narrate "  <&6>Are you sure you want to rankup?"
      # - narrate "  <&6>Type <&l>/rankup <&6>again to confirm"
      # - narrate <empty>
      - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
      - define text <list[<&0><n><n><&l>Are you sure that you want to rankup?<n><n>Please click <&click[/rankup].type[RUN_COMMAND]><&a><&l>[YES]<&end_click> <&0><&l>to rankup.]>
      - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      - playeffect effect:TRIAL_SPAWNER_EJECT_ITEM at:<player.location.add[0,3,0]> quantity:20 data:1 offset:0.0


rankup_command:
  type: command
  debug: false
  name: rankup
  usage: /rankup
  description: Type /rankup to ascend into a higher rank
  tab complete:
  - determine details
  script:
  - define rank <luckperms.track[rankupsystem].groups[<player>].get[1]>
  - define data <script[rankup_data]>
  - define rankData <[data].data_key[ranks.<[rank]>]>
  - if <context.args.get[1]||null> == detail || <context.args.get[1]||null> == details:
    - inject rankup_details
    - stop

  - if <[rank]> == netheritev:
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>You have reached the highest rank!"
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>You have reached the highest rank!"
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>You have reached the highest rank!"
    - playsound sound:ENTITY_POLAR_BEAR_WARNING <player.location>
    - stop

  #
  # Changes here [- if <[rank]> == "":]
  #
   # error checking
  - if <[rank]> == " ":
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Rankup data error contact a system admin on the Magbungkal Discord ~1"
    - playsound sound:ENTITY_POLAR_BEAR_WARNING <player.location>
    - stop
  - if <[data].data_key[ranks].keys.contains[<[rank]>].not>:
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Rankup data error contact a system admin on the Magbungkal Discord ~2"
    - playsound sound:ENTITY_POLAR_BEAR_WARNING <player.location>
    - stop
  - if <script[rankup_data]||null> == null:
    - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Rankup data error contact a system admin on the Magbungkal Discord ~3"
    - playsound sound:EENTITY_POLAR_BEAR_WARNING <player.location>
    - stop


  # requirements
  # money check
  - if <[rankData].get[requirements].keys.contains[money]>:
    - if <player.money> < <[rankData].get[requirements].get[money]>:
      - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need <&6>₱<[rankData].get[requirements].get[money].sub[<player.money>].round_to[1]> <&f>to rank-up, to view requirements, check [/rankup details]"
      - playsound sound:ENTITY_VILLAGER_HURT <player.location>
      - stop
  # playtime check
  - if <[rankData].get[requirements].keys.contains[playtime]>:
    - if <player.time_lived.in_hours> < <[rankData].get[requirements].get[playtime]>:
      - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need <&6><[rankData].get[requirements].get[playtime].sub[<player.time_lived.in_hours>].round_to[1]> more hours <&f>of play-time to rank-up, to view requirements, check [/rankup details]"
      - playsound sound:ENTITY_VILLAGER_HURT <player.location>
      - stop
  # votecount check
  - if <[rankData].get[requirements].keys.contains[votecount]>:
    - if <placeholder[superbvote_votes]> < <[rankData].get[requirements].get[votecount]>:
      - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need <&6><element[<placeholder[superbvote_votes]>]>/<element[<[rankData].get[requirements].get[votecount]>]> more votes <&f>to rank-up, to view requirements, check [/rankup details]"
      - playsound sound:ENTITY_VILLAGER_HURT <player.location>
      - stop

  # items check
  - if <[rankData].get[requirements].keys.contains[items]>:
    - foreach <[rankData].get[requirements].get[items]>:
      - if <player.inventory.contains_item[<[key]>].quantity[<[value]>].not>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still don't have <&6><[value]> <material[<[key]>].name.replace_text[_].with[ ]> in your inventory<&f>, to view requirements, check [/rankup details]"
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop
  # advancements check
  - if <[rankData].get[requirements].keys.contains[advancements]>:
    - foreach <[rankData].get[requirements].get[advancements]>:
      - if <player.advancements.contains[minecraft:<[key]>].not||true>:
      #- if <player.has_advancement[<[key]>].not||true>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You don't have the advancement <&6><[value]><&f>, <&f>to view requirements, check [/rankup details]"
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop
  # mob check
  - if <[rankData].get[requirements].keys.contains[mob_kill]>:
    - foreach <[rankData].get[requirements].get[mob_kill]>:
      - if <placeholder[statistic_kill_entity:<[key]>].player[<player>]> < <[value]>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need to kill <&6><[key].replace_text[_].with[ ]> <placeholder[statistic_kill_entity:<[key]>].player[<player>]>/<[value]><&f>, to view requirements, check [/rankup details]"
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop
  # animals breed
  - if <[rankData].get[requirements].keys.contains[breed]>:
    - foreach <[rankData].get[requirements].get[breed]>:
      - if <placeholder[statistic_animals_bred].player[<player>]> < <[value]>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need to breed animals <&6><placeholder[statistic_animals_bred].player[<player>]>/<[value]><&f>, <&f>to view requirements, check [/rankup details]"
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop
  # enchant
  - if <[rankData].get[requirements].keys.contains[enchant]>:
    - foreach <[rankData].get[requirements].get[enchant]>:
      - if <placeholder[statistic_item_enchanted].player[<player>]> < <[value]>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need to enchant an item <&6><placeholder[statistic_item_enchanted].player[<player>]>/<[value]><&f>, <&f>to view requirements, check [/rankup details]"
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop
  # mine_block
  - if <[rankData].get[requirements].keys.contains[mine_block]>:
    - foreach <[rankData].get[requirements].get[mine_block]>:
      - if <placeholder[statistic_mine_block:<[key]>].player[<player>]> < <[value]>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need to mine <&6><[key].replace_text[_].with[ ]> <placeholder[statistic_mine_block:<[key]>].player[<player>]>/<[value]><&f>, <&f>to view requirements, check [/rankup details]"
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop
  # distance walked
  - if <[rankData].get[requirements].keys.contains[walk]>:
    - foreach <[rankData].get[requirements].get[walk]>:
      - if <placeholder[statistic_walk_one_cm].player[<player>].replace_text[,].with[].div[100000].round_up> < <[value]>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need to walk <&6><placeholder[statistic_walk_one_cm].player[<player>].replace_text[,].with[].div[100000].round_up>/<[value]> km<&f>, <&f>to view requirements, check [/rankup details]""
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop
  # craft item
  - if <[rankData].get[requirements].keys.contains[craft]>:
    - foreach <[rankData].get[requirements].get[craft]>:
      - if <placeholder[statistic_craft_item:<[key]>].player[<player>]> < <[value]>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need to craft <&6><[key].replace_text[_].with[ ]> <placeholder[statistic_craft_item:<[key]>].player[<player>]>/<[value]><&f>, <&f>to view requirements, check [/rankup details]""
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop
  # catch fish
  - if <[rankData].get[requirements].keys.contains[catch_fish]>:
    - foreach <[rankData].get[requirements].get[catch_fish]>:
      - if <placeholder[statistic_fish_caught].player[<player>]> < <[value]>:
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>Hey! You still need to catch <&6><placeholder[statistic_fish_caught].player[<player>]>/<[value]> fish<&f>, <&f>to view requirements, check [/rankup details]"
        - playsound sound:ENTITY_VILLAGER_HURT <player.location>
        - stop

  # rankup verification
  - if <player.has_flag[confirmRankup]>:
    #- if <script[rank_health_data].list_keys[ranks].contains[<[rank]>]>:
    #  - define new_health <script[rank_health_data].data_key[ranks].get[<[rank]>]>
    #  - adjust <player> health_data:<[new_health]>/<[new_health]>
    - if <[rankData].get[requirements].keys.contains[money]>:
      - money take quantity:<[rankData].get[requirements].get[money]>
      - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>₱<[rankData].get[requirements].get[money]> has been taken from your account."
    - if <[rankData].get[requirements].keys.contains[items]>:
      - foreach <[rankData].get[requirements].get[items]>:
        - take material:<[key]> quantity:<[value]>
        - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f><[value]> <material[<[key]>].name.replace_text[_].with[ ]> has been taken from your inventory."
    - playsound <player> volume:0.8 pitch:0.3 sound:UI_TOAST_CHALLENGE_COMPLETE
    - announce "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f><player.name> <&f>has ranked up! (/rankup)"

    - define name <player.name>
    - define rank <placeholder[luckperms_primary_group_name].player[<player>].to_uppercase>
    - if <[rank]> == <element[Default]>:
      - define rank Default
    - define message "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f><player.name> has ranked up! (/rankup)"

    - toast "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8&l>] <&f>You have ranked up!" icon:<[rankData].get[icon]||golden_helmet>
    - execute as_server "lp user <player.name> promote rankupsystem"
    - adjust <player> max_health:<[rankData].get[heart]>
# discord message
    - definemap message_map:
          author_name: <player.name> has rankup! (/rankup)
          author_icon_url: https://mc-heads.net/avatar/<player.name>
          color: orange
    - define rankup_message <discord_embed.with_map[<[message_map]>]>
    - ~discordmessage id:magbungkal channel:1182512909654438068 <[rankup_message]>
  - else:
    - flag player confirmRankup duration:30s
    - if <[rankData].get[requirements].keys.contains[money]> || <[rankData].get[requirements].keys.contains[items]>:
      # - narrate <empty>
      # - narrate "  <&6>Are you sure you want to rankup?"
      # - narrate "  <&6>You will lose the following items:"
      # - narrate <empty>
      - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
      - define text <list[<&0><n><n><&l>Are you sure that you want to rankup?<n><n>You will lose this amount of money:<n><n><&8><&l>• <&a><&l>₱<[rankData].get[requirements].get[money]><n><n><n><&0><&l>Please click <&click[/rankup].type[RUN_COMMAND]><&a><&l>[YES]<&end_click> <&0><&l>to confirm.]>
      - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      - if <[rankData].get[requirements].keys.contains[money]>:
        # - narrate "  <&f>• ₱<[rankData].get[requirements].get[money]>"
        - define text <list[<&0><n><n><&l><&0>• ₱<[rankData].get[requirements].get[money]>]>
      - if <[rankData].get[requirements].keys.contains[items]>:
        - foreach <[rankData].get[requirements].get[items]>:
          - narrate "  <&f>• <[value]> <material[<[key]>].name.replace_text[_].with[ ]>"
      - narrate <empty>
    - else:
      # - narrate <empty>
      # - narrate "  <&6>Are you sure you want to rankup?"
      # - narrate "  <&6>Type <&l>/rankup <&6>again to confirm"
      # - narrate <empty>
      - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
      - define text <list[<&0><n><n><&l>Are you sure that you want to rankup?<n><n>Please click <&click[/rankup].type[RUN_COMMAND]><&a><&l>[YES]<&end_click> <&0><&l>to rankup.]>
      - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]

# money
# playtime
# votes
# items
# advancements
rankup_details:
  type: task
  debug: false
  script:
  - narrate <empty>
  - narrate "<&f>Your rank: <&6><&l><[rankData].get[name]>"
  #- narrate <empty>
  #- foreach <[rankData].get[description]>:
  #  - narrate " <&7><[value]>"
  - narrate <empty>
  - narrate "<&6>Rank Requirements:"
  # money
  - if <[rankData].get[requirements].keys.contains[money]>:
    - narrate "<&8>» <&6>Money:"
    - if <player.money> < <[rankData].get[requirements].get[money]>:
      - narrate "<&8>╏ <&f>• ₱<[rankData].get[requirements].get[money]>"
    - else:
      - narrate "<&8>╏ <&8><&m>• ₱<[rankData].get[requirements].get[money]>"
  # playtime
  - if <[rankData].get[requirements].keys.contains[playtime]>:
    - narrate "<&8>» <&6>Play-time"
    - if <player.time_lived.in_hours> < <[rankData].get[requirements].get[playtime]>:
      - narrate "<&8>╏ <&f>• <[rankData].get[requirements].get[playtime]> hours"
    - else:
      - narrate "   <&8><&m>• <[rankData].get[requirements].get[playtime]> hours"
  # votecount
  - if <[rankData].get[requirements].keys.contains[votecount]>:
    - narrate "<&8>» <&6>Votes:"
    - if <placeholder[superbvote_votes]> < <[rankData].get[requirements].get[votecount]>:
      - narrate "<&8>╏ <&f>• <[rankData].get[requirements].get[votecount]>"
    - else:
      - narrate "<&8>╏ <&8><&m>• <[rankData].get[requirements].get[votecount]>"
  # items
  - if <[rankData].get[requirements].keys.contains[items]>:
    - narrate "<&8>» <&6>Items:"
    - foreach <[rankData].get[requirements].get[items]>:
      - if <player.inventory.contains_item[<[key]>].quantity[<[value]>].not>:
        - narrate "<&8>╏ <&f>• <[value]> <material[<[key]>].name.replace_text[_].with[ ]>"
      - else:
        - narrate "<&8>╏ <&8><&m>• <[value]> <material[<[key]>].name.replace_text[_].with[ ]>"
  # advancement
  - if <[rankData].get[requirements].keys.contains[advancements]>:
    - narrate "<&8>» <&6>Advancements:"
    - foreach <[rankData].get[requirements].get[advancements]>:
      - if <player.advancements.contains[minecraft:<[key]>].not||true>:
        - narrate "<&8>╏ <&f>• <[value]>"
      - else:
        - narrate "<&8>╏ <&8><&m>• <[value]>"
  # mob_kill
  - if <[rankData].get[requirements].keys.contains[mob_kill]>:
    - narrate "<&8>» <&6>Mob kill:"
    - foreach <[rankData].get[requirements].get[mob_kill]>:
      - if <placeholder[statistic_kill_entity:<[key]>].player[<player>]> < <[value]>:
        - narrate "<&8>╏ <&f>• <[key].replace_text[_].with[ ]>: <placeholder[statistic_kill_entity:<[key]>].player[<player>]>/<[value]>"
      - else:
        - narrate "<&8>╏ <&8><&m>• <[key].replace_text[_].with[ ]>: <placeholder[statistic_kill_entity:<[key]>].player[<player>]>/<[value]>"
  # animals breed
  - if <[rankData].get[requirements].keys.contains[breed]>:
    - narrate "<&8>» <&6>Animal breed:"
    - foreach <[rankData].get[requirements].get[breed]>:
      - if <placeholder[statistic_animals_bred].player[<player>]> < <[value]>:
        - narrate "<&8>╏ <&f>• <placeholder[statistic_animals_bred].player[<player>]>/<[value]>"
      - else:
        - narrate "<&8>╏ <&8><&m>• <placeholder[statistic_animals_bred].player[<player>]>/<[value]>"

  # enchant
  #- if <[rankData].get[requirements].keys.contains[enchant]>:
  #  - narrate "  <&6>Enchant item:"
  #  - foreach <[rankData].get[requirements].get[enchant]>:
  #    - if <placeholder[statistic_item_enchanted].player[<player>]> < <[value]>:
  #      - narrate "   <&f>• <placeholder[statistic_item_enchanted].player[<player>]>/<[value]>"
  #    - else:
  #      - narrate "   <&8><&m>• <placeholder[statistic_item_enchanted].player[<player>]>/<[value]>"

  # mine_block
  - if <[rankData].get[requirements].keys.contains[mine_block]>:
    - narrate "<&8>» <&6>Mine block:"
    - foreach <[rankData].get[requirements].get[mine_block]>:
      - if <placeholder[statistic_mine_block:<[key]>].player[<player>]> < <[value]>:
        - narrate "<&8>╏ <&f>• <[key].replace_text[_].with[ ]>: <placeholder[statistic_mine_block:<[key]>].player[<player>]>/<[value]>"
      - else:
        - narrate "<&8>╏ <&8><&m>• <[key].replace_text[_].with[ ]>: <placeholder[statistic_mine_block:<[key]>].player[<player>]>/<[value]>"
  # distance walked
  - if <[rankData].get[requirements].keys.contains[walk]>:
    - narrate "<&8>» <&6>Travel by walking:"
    - foreach <[rankData].get[requirements].get[walk]>:
      - if <placeholder[statistic_walk_one_cm].player[<player>].replace_text[,].with[].div[100000].round_up> < <[value]>:
        - narrate "<&8>╏ <&f>• walk <placeholder[statistic_walk_one_cm].player[<player>].replace_text[,].with[].div[100000].round_up>/<[value]> km"
      - else:
        - narrate "<&8>╏ <&8><&m>• walk <placeholder[statistic_walk_one_cm].player[<player>].replace_text[,].with[].div[100000].round_up>/<[value]> km"
  # craft item
  - if <[rankData].get[requirements].keys.contains[craft]>:
    - narrate "<&8>» <&6>Craft item:"
    - foreach <[rankData].get[requirements].get[craft]>:
      - if <placeholder[statistic_craft_item:<[key]>].player[<player>]> < <[value]>:
        - narrate "<&8>╏ <&f>• <[key].replace_text[_].with[ ]>: <placeholder[statistic_craft_item:<[key]>].player[<player>]>/<[value]>"
      - else:
        - narrate "<&8>╏ <&8><&m>• <[key].replace_text[_].with[ ]>: <placeholder[statistic_craft_item:<[key]>].player[<player>]>/<[value]>"
  # catch fish
  - if <[rankData].get[requirements].keys.contains[catch_fish]>:
    - narrate "<&8>» <&6>Catch fish:"
    - foreach <[rankData].get[requirements].get[catch_fish]>:
      - if <placeholder[statistic_fish_caught].player[<player>]> < <[value]>:
        - narrate "<&8>╏ <&f>• <placeholder[statistic_fish_caught].player[<player>]>/<[value]>"
      - else:
        - narrate "<&8>╏ <&8><&m>• <placeholder[statistic_fish_caught].player[<player>]>/<[value]>"
  - narrate <empty>