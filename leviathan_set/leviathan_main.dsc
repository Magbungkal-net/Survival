leviathan_shop_command:
    type: command
    name: leviathancollectionset
    description: Does something
    usage: /leviathancollectionset
    permission: leviathan.permission
    script:
    - inventory open d:leviathan_shop
    - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1

leviathan_shop:
  type: inventory
  inventory: chest
  debug: true
  title: <&gradient[from=#CF741C;to=#085FD4]><&l>☠ Leviathan Collection Set ☠
  gui: true
  definitions:
    helmet: <item[leviathan_helmet_blackmarket]>
    chestplate: <item[leviathan_chestplate_blackmarket]>
    leggings: <item[leviathan_leggings_blackmarket]>
    boots: <item[leviathan_boots_blackmarket]>
    sword: <item[leviathan_sword_blackmarket]>
    axe: <item[leviathan_axe_blackmarket]>
    bow: <item[leviathan_bow_blackmarket]>
    pickaxe: <item[leviathan_pickaxe_blackmarket]>
    hoe: <item[leviathan_hoe_blackmarket]>
    shovel: <item[leviathan_shovel_blackmarket]>
    fishingrod: <item[leviathan_fishing_rod_blackmarket]>
    wings: <item[leviathan_wings_blackmarket]>
    whole set: <item[leviathan_set_buy]>

  slots:
    - [] [] [] [] [whole set] [] [] [] []
    - [] [] [helmet] [] [sword] [] [pickaxe] [] []
    - [] [] [chestplate] [] [axe] [] [shovel] [] []
    - [] [] [leggings] [] [bow] [] [hoe] [] []
    - [] [] [boots] [] [wings] [] [fishingrod] [] []
    - [] [] [] [] [whole set] [] [] [] []

leviathan_shop_handler:
  type: world
  debug: false
  events:
    on player drags in leviathan_shop:
    - determine cancelled
    on player clicks in leviathan_shop:
    - if <context.item> == air:
      - determine cancelled
    - choose <context.slot>:
   # sword
      - case 14:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 26000:
          - clickable leviathan_sword_event save:leviathan_sword_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>26,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_sword_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 26000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>26,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # axe
      - case 23:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 26000:
          - clickable leviathan_axe_event save:leviathan_axe_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>26,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_axe_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 26000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>26,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # bow
      - case 32:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 17000:
          - clickable leviathan_bow_event save:leviathan_bow_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>17,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_bow_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 17000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>17,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # wing
      - case 41:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 17000:
          - clickable leviathan_wing_event save:leviathan_wing_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>17,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_wing_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 17000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>17,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # pickaxe
      - case 16:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 14000:
          - clickable leviathan_pickaxe_event save:leviathan_pickaxe_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>14,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_pickaxe_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 14000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>14,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # shovel
      - case 25:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 14000:
          - clickable leviathan_shovel_event save:leviathan_shovel_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>14,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_shovel_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 14000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>14,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # hoe
      - case 34:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 14000:
          - clickable leviathan_hoe_event save:leviathan_hoe_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>14,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_hoe_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 14000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>14,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # fishing rod
      - case 43:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 14000:
          - clickable leviathan_fishing_rod_event save:leviathan_fishing_rod_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>14,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_fishing_rod_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 14000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>14,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # hat
      - case 27:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 24000:
          - clickable leviathan_hat_event save:leviathan_hat_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>24,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_hat_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 24000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>24,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # # wing
      # - case 35:
      #   - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
      #   - if <[coins]> >= 24000:
      #     - clickable leviathan_wing_event save:leviathan_wing_event
      #     - define text <list[<n><n><n><n><&0><&l>This cost <&l>24,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_wing_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
      #     - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      #     - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
      #   - if <[coins]> < 24000:
      #     - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
      #     - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>24,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
      #     - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # whole set
      - case 5:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 70000:
          - clickable leviathan_whole_set_event save:leviathan_whole_set_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>70,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_whole_set_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 70000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>70,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # whole set
      - case 51:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 70000:
          - clickable leviathan_whole_set_event save:leviathan_whole_set_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>70,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[leviathan_whole_set_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 70000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>70,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # armors
      - case 12:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 30000:
          - clickable armors_event save:armors_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>30,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[armors_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 30000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>30,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # armors
      - case 21:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 30000:
          - clickable armors_event save:armors_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>30,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[armors_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 30000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>30,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # armors
      - case 30:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 30000:
          - clickable armors_event save:armors_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>30,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[armors_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 30000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>30,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # armors
      - case 39:
        - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
        - if <[coins]> >= 30000:
          - clickable armors_event save:armors_event
          - define text <list[<n><n><n><n><&0><&l>This cost <&l>30,000 coins<&0><&l>, still want to purchase?<n><n><n>  <element[<&a><&l>[YES]].on_click[<entry[armors_event].command>]>    <&click[/leviathancollectionset].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[coins]> < 30000:
          - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
          - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>30,000 coins <&0>to purchase this item.<n><n>Top up coins on our webstore: <element[<&6><&l><&n>magbungkal.net/store].custom_color[emphasis].on_hover[<&f>https://magbungkal.net/store].click_url[https://store.magbungkal.net]>]>
          - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]

leviathan_wings_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 24000"
    - give leviathan_wing
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Abyssal Crown of the Leviathan ⚕ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
leviathan_fishing_rod_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 14000"
    - give leviathan_fishing_rod
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Leviathan’s Line ⚕ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
leviathan_hoe_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 14000"
    - give leviathan_hoe
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Stormrider Hoe ⚕ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
leviathan_shovel_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 14000"
    - give leviathan_shovel
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Ocean’s Fury Shovel ⚕ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
leviathan_pickaxe_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 14000"
    - give leviathan_pickaxe
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Leviathan’s Harvest ⚕ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
leviathan_bow_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 17000"
    - give leviathan_bow
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Ocean’s Wrath Bow ⚕ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
leviathan_axe_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 26000"
    - give leviathan_axe
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Abyssal Splitter ⚕ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
leviathan_sword_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 26000"
    - give leviathan_sword
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Leviathan's Edge ⚕ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
leviathan_whole_set_event:
    type: task
    debug: true
    script:
    - execute as_server "magbungkalcoins take <player.name> 70000"
    - execute as_server "n give <player.name> leviathan_chestplate"
    - execute as_server "n give <player.name> leviathan_helmet"
    - execute as_server "n give <player.name> leviathan_boots"
    - execute as_server "n give <player.name> leviathan_leggings"
    - give leviathan_axe
    - give leviathan_bow
    - give leviathan_wing
    - give leviathan_hat
    - give leviathan_hoe
    - give leviathan_pickaxe
    - give leviathan_shovel
    - give leviathan_sword
    - give leviathan_wing
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>☠ leviathan Whole Set ☠ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset)"
armors_event:
    type: task
    debug: false
    script:
    - execute as_server "magbungkalcoins take <player.name> 30000"
    - execute as_server "n give <player.name> leviathan_chestplate"
    - execute as_server "n give <player.name> leviathan_helmet"
    - execute as_server "n give <player.name> leviathan_boots"
    - execute as_server "n give <player.name> leviathan_leggings"
    - execute as_server "announce <&l><player.name> <&f>has bought <&gradient[from=#CF741C;to=#085FD4]><&l>☠ leviathan Armor Set ☠ <&r><&gradient[from=#CF741C;to=#085FD4]>(/leviathancollectionset))"