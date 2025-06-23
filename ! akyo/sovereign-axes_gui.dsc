cmdSovereignGUI:
  type: command
  debug: false
  name: buysovereignaxes
  description: buysovereignaxes
  usage: /buysovereignaxes
  permission: denizen.admin
  aliases:
  - sovereignaxes
  script:
  - inventory open destination:sovereignaxesshop
  - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1

sovereignaxesshop:
  type: inventory
  inventory: chest
  debug: true
  title: Buy Sovereign Axes
  gui: true
  definitions:
    ?: gray_stained_glass_pane
    vindicators_edge: <item[vindicators_edge]>
    dreadnought_cleaver: <item[dreadnought_cleaver]>
    ethereal_reaver: <item[ethereal_reaver]>
    sentinels_guardian: <item[sentinels_guardian]>
    stormbringers_fury: <item[stormbringers_fury]>
    infernal_doomcleaver: <item[infernal_doomcleaver]>
    celestial_arbiter: <item[celestial_arbiter]>
  slots:
    - [?] [?] [?] [?] [?] [?] [?] [?] [?]
    - [?] [vindicators_edge] [dreadnought_cleaver] [ethereal_reaver] [sentinels_guardian] [stormbringers_fury] [infernal_doomcleaver] [celestial_arbiter] [?]
    - [?] [?] [?] [?] [?] [?] [?] [?] [?]

sovereignshop_handler:
  type: world
  debug: false
  events:
    on player drags in sovereignaxesshop:
    - determine cancelled
    on player clicks in sovereignaxesshop:
    - if <context.item> == gray_stained_glass_pane:
      - determine cancelled
    - define tokens <placeholder[tm_tokens]>
    - choose <context.slot>:
    # Vindicator Edge
      - case 11:
        - if <[tokens]> >= 2800:
            - define text <list[<n><n><n><n><&0><&l>This axe cost <&b>2,800 tokens<&0><&l>, still want to purchase?<n><n><n>  <&click[/zxwakjsdlaaskajlsdhakjsdhaksjd].type[RUN_COMMAND]><&a><&l>[YES]<&end_click>     <&click[/buysovereignaxes].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[tokens]> < 2800:
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
            - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>2,800 Tokens <&0>to purchase this item.<n><n>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store.].click_url[https://store.magbungkal.net]>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    # Dreadnought Cleaver
      - case 12:
        - if <[tokens]> >= 2800:
            - define text <list[<n><n><n><n><&0><&l>This axe cost <&b>2,800 tokens<&0><&l>, still want to purchase?<n><n><n>  <&click[/klajksdkljhwkabsndjkwnakjsd].type[RUN_COMMAND]><&a><&l>[YES]<&end_click>     <&click[/buysovereignaxes].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[tokens]> < 2800:
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
            - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>2,800 Tokens <&0>to purchase this item.<n><n>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store.].click_url[https://store.magbungkal.net]>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    # Ethereal Reaver
      - case 13:
        - if <[tokens]> >= 2800:
            - define text <list[<n><n><n><n><&0><&l>This axe cost <&b>2,800 tokens<&0><&l>, still want to purchase?<n><n><n>  <&click[/uiaosdajksbdakjsdbhjkbkajwbkjasbd].type[RUN_COMMAND]><&a><&l>[YES]<&end_click>     <&click[/buysovereignaxes].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[tokens]> < 2800:
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
            - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>2,800 Tokens <&0>to purchase this item.<n><n>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store.].click_url[https://store.magbungkal.net]>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    # Sentinel's Guardian
      - case 14:
        - if <[tokens]> >= 2800:
            - define text <list[<n><n><n><n><&0><&l>This axe cost <&b>2,800 tokens<&0><&l>, still want to purchase?<n><n><n>  <&click[/yyyyuaisdbnaskdjasdkjhakjdsnaskjdbwasd].type[RUN_COMMAND]><&a><&l>[YES]<&end_click>     <&click[/buysovereignaxes].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[tokens]> < 2800:
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
            - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>2,800 Tokens <&0>to purchase this item.<n><n>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store.].click_url[https://store.magbungkal.net]>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    # Stormbringer's Fury
      - case 15:
        - if <[tokens]> >= 2800:
            - define text <list[<n><n><n><n><&0><&l>This axe cost <&b>2,800 tokens<&0><&l>, still want to purchase?<n><n><n>  <&click[/zzdasdaszxcasdasdasdkhaskjdhasdasdawad].type[RUN_COMMAND]><&a><&l>[YES]<&end_click>     <&click[/buysovereignaxes].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[tokens]> < 2800:
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
            - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>2,800 Tokens <&0>to purchase this item.<n><n>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store.].click_url[https://store.magbungkal.net]>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # Infernal Doomcleaver
      - case 16:
        - if <[tokens]> >= 2800:
            - define text <list[<n><n><n><n><&0><&l>This axe cost <&b>2,800 tokens<&0><&l>, still want to purchase?<n><n><n>  <&click[/aaaaaaaaaadjlakshdijwhajksdbnkjwbaksndbwadasd].type[RUN_COMMAND]><&a><&l>[YES]<&end_click>     <&click[/buysovereignaxes].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[tokens]> < 2800:
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
            - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>2,800 Tokens <&0>to purchase this item.<n><n>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store.].click_url[https://store.magbungkal.net]>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
      # Celestial Arbiter
      - case 17:
        - if <[tokens]> >= 2800:
            - define text <list[<n><n><n><n><&0><&l>This axe cost <&b>2,800 tokens<&0><&l>, still want to purchase?<n><n><n>  <&click[/uiwakslhjdkjwbakjnsbdjnkwbaknsdbwkhjabsjhkdbwjhkabsdddd].type[RUN_COMMAND]><&a><&l>[YES]<&end_click>     <&click[/buysovereignaxes].type[RUN_COMMAND]><&c><&l>[NO]<&end_click>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - if <[tokens]> < 2800:
            - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
            - define text <list[<n><n><n><&0>Hey <player.name>!<n><n>You do not have enough <&l>2,800 Tokens <&0>to purchase this item.<n><n>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store.].click_url[https://store.magbungkal.net]>]>
            - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]


# Commands for items
# Letters are randomly generated by @akiakyo
VindicatorEdge:
  type: command
  debug: false
  name: zxwakjsdlaaskajlsdhakjsdhaksjd
  description: zxwakjsdlaaskajlsdhakjsdhaksjd
  usage: /zxwakjsdlaaskajlsdhakjsdhaksjd
  script:
    - playsound <player.location> sound:UI_TOAST_CHALLENGE_COMPLETE pitch:1 volume:1
    - firework <player.location> power:2 star primary:yellow fade:white
    - give vindicators_edge
    - execute as_server "tokenmanager remove <player.name> 2800"
    - define text <list[<n><n><n><n><n><n><&0><&l>Thank you for purchasing! :heart:]>
    - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Successfully bought Vindicators Edge"

# Dreadnought Cleaver
DreadnoughtCleaver:
  type: command
  debug: false
  name: klajksdkljhwkabsndjkwnakjsd
  description: klajksdkljhwkabsndjkwnakjsd
  usage: /klajksdkljhwkabsndjkwnakjsd
  script:
    - playsound <player.location> sound:UI_TOAST_CHALLENGE_COMPLETE pitch:1 volume:1
    - firework <player.location> power:2 star primary:yellow fade:white  
    - give dreadnought_cleaver
    - execute as_server "tokenmanager remove <player.name> 2800"
    - define text <list[<n><n><n><n><n><n><&0><&l>Thank you for purchasing! :heart:]>
    - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Successfully bought Vindicators Edge"

# Ethereal Reaver
EtherealReaver:
  type: command
  debug: false
  name: uiaosdajksbdakjsdbhjkbkajwbkjasbd
  description: uiaosdajksbdakjsdbhjkbkajwbkjasbd
  usage: /uiaosdajksbdakjsdbhjkbkajwbkjasbd
  script:
    - playsound <player.location> sound:UI_TOAST_CHALLENGE_COMPLETE pitch:1 volume:1
    - firework <player.location> power:2 star primary:yellow fade:white  
    - give ethereal_reaver
    - execute as_server "tokenmanager remove <player.name> 2800"
    - define text <list[<n><n><n><n><n><n><&0><&l>Thank you for purchasing! :heart:]>
    - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Successfully bought Vindicators Edge"

# Sentinel's Guardian
SentinelsGuardian:
  type: command
  debug: false
  name: yyyyuaisdbnaskdjasdkjhakjdsnaskjdbwasd
  description: yyyyuaisdbnaskdjasdkjhakjdsnaskjdbwasd
  usage: /yyyyuaisdbnaskdjasdkjhakjdsnaskjdbwasd
  script:
    - playsound <player.location> sound:UI_TOAST_CHALLENGE_COMPLETE pitch:1 volume:1
    - firework <player.location> power:2 star primary:yellow fade:white  
    - give sentinels_guardian
    - execute as_server "tokenmanager remove <player.name> 2800"
    - define text <list[<n><n><n><n><n><n><&0><&l>Thank you for purchasing! :heart:]>
    - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Successfully bought Vindicators Edge"

# Stormbringer's Fury
StormbringersFury:
  type: command
  debug: false
  name: zzdasdaszxcasdasdasdkhaskjdhasdasdawad
  description: zzdasdaszxcasdasdasdkhaskjdhasdasdawad
  usage: /zzdasdaszxcasdasdasdkhaskjdhasdasdawad
  script:
    - playsound <player.location> sound:UI_TOAST_CHALLENGE_COMPLETE pitch:1 volume:1
    - firework <player.location> power:2 star primary:yellow fade:white
    - give stormbringers_fury
    - execute as_server "tokenmanager remove <player.name> 2800"
    - define text <list[<n><n><n><n><n><n><&0><&l>Thank you for purchasing! :heart:]>
    - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Successfully bought Vindicators Edge"

# Infernal Doomcleaver
InfernalDoomcleaver:
  type: command
  debug: false
  name: aaaaaaaaaadjlakshdijwhajksdbnkjwbaksndbwadasd
  description: aaaaaaaaaadjlakshdijwhajksdbnkjwbaksndbwadasd
  usage: /aaaaaaaaaadjlakshdijwhajksdbnkjwbaksndbwadasd
  script:
    - playsound <player.location> sound:UI_TOAST_CHALLENGE_COMPLETE pitch:1 volume:1
    - firework <player.location> power:2 star primary:yellow fade:white
    - give infernal_doomcleaver
    - execute as_server "tokenmanager remove <player.name> 2800"
    - define text <list[<n><n><n><n><n><n><&0><&l>Thank you for purchasing! :heart:]>
    - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Successfully bought Vindicators Edge"

# Celestial Arbiter
CelestialArbiter:
  type: command
  debug: false
  name: uiwakslhjdkjwbakjnsbdjnkwbaknsdbwkhjabsjhkdbwjhkabsdddd
  description: uiwakslhjdkjwbakjnsbdjnkwbaknsdbwkhjabsjhkdbwjhkabsdddd
  usage: /uiwakslhjdkjwbakjnsbdjnkwbaknsdbwkhjabsjhkdbwjhkabsdddd
  script:
    - playsound <player.location> sound:UI_TOAST_CHALLENGE_COMPLETE pitch:1 volume:1
    - firework <player.location> power:2 star primary:yellow fade:white
    - give celestial_arbiter
    - execute as_server "tokenmanager remove <player.name> 2800"
    - define text <list[<n><n><n><n><n><n><&0><&l>Thank you for purchasing! :heart:]>
    - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
    - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Successfully bought Vindicators Edge"