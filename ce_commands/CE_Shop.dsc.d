#-------------------------------------------------------
# Author: sieccc
# Description: Custom Enchantment Shop GUI for AdvancedEnchantments
# Version: 1.1
# Date Published: 01-15-2025?
# Last Updated: 02-22-2025
# Update:
# (02-22-2025) v1.1
# - Double check all the CE balls price
# - Change back button from redstone block to nether star
# Known Issues: none
#-------------------------------------------------------
ce_bundle_shop:
  debug: false
  type: command
  name: ce
  usage: /ce
  aliases:
  - e
  description: Open GUI for CE shop
  # permission: ceshop.open
  script:
  - inventory open d:ce_shop

ce_shop_fill:
  type: item
  material: gray_stained_glass_pane
  display name: <&7>

tinkerer:
  type: item
  material: anvil
  display name: <&7>Open <&b><&l>Tinkerer <&7>
  lore:
  - <&7>Tinker Books for Magic Dusts and EXP.
  - <empty>
  - <&b><&l>Click to Visit

alchemist:
  type: item
  material: end_portal_frame
  display name: <&7>Open <&b><&l>Alchemist <&7>
  lore:
  - <&7>Combine Books and Magic Dusts.
  - <empty>
  - <&b><&l>Click to Visit

ce_shop_back_button:
  type: item
  material: nether_star
  display name: <&c><&l>Go Back

simple_enchantment:
  type: item
  material: white_stained_glass_pane
  display name: <&f><&l>Simple Enchantment
  lore:
  - <&7>Examine to receive a random
  - <&f>simple <&7>enchantment book.
  - <empty>
  - <&b><&l>COST <&7>400 EXP each (You currently have <player.calculate_xp> EXP)
  #(You need <player.calculate_xp.sub[400]> more EXP)

unique_enchantment:
  type: item
  material: lime_stained_glass_pane
  display name: <&a><&l>Unique Enchantment
  lore:
  - <&7>Examine to receive a random
  - <&a>unique <&7>enchantment book.
  - <empty>
  - <&b><&l>COST <&7>800 EXP each (You currently have <player.calculate_xp> EXP)
  #(You need <player.calculate_xp.sub[800].abs> more EXP)

elite_enchantment:
  type: item
  material: light_blue_stained_glass_pane
  display name: <&b><&l>Elite Enchantment
  lore:
  - <&7>Examine to receive a random
  - <&b>elite <&7>enchantment book.
  - <empty>
  - <&b><&l>COST <&7>2,500 EXP each (You currently have <player.calculate_xp> EXP)
  #(You need <player.calculate_xp.sub[2500].abs> more EXP)

ultimate_enchantment:
  type: item
  material: yellow_stained_glass_pane
  display name: <&e><&l>Ultimate Enchantment
  lore:
  - <&7>Examine to receive a random
  - <&e>ultimate <&7>enchantment book.
  - <empty>
  - <&b><&l>COST <&7>5,000 EXP each (You currently have <player.calculate_xp> EXP)
  #(You need <player.calculate_xp.sub[5000].abs> more EXP)

legendary_enchantment:
  type: item
  material: orange_stained_glass_pane
  display name: <&6><&l>Legendary Enchantment
  lore:
  - <&7>Examine to receive a random
  - <&6>legendary <&7>enchantment book.
  - <empty>
  - <&b><&l>COST <&7>25,000 EXP each (You currently have <player.calculate_xp> EXP)
  #(You need <player.calculate_xp.sub[25000].abs> more EXP)

heroic_enchantment:
  type: item
  material: red_stained_glass_pane
  display name: <&4><&l>Heroic Enchantment
  lore:
  - <&7>Examine to receive a random
  - <&4>heroic <&7>enchantment book.
  - <empty>
  - <&b><&l>COST <&7>50,000 EXP each (You currently have <player.calculate_xp> EXP)
  #(You need <player.calculate_xp.sub[50000].abs> more EXP)

ce_shop:
  type: inventory
  inventory: chest
  debug: false
  title: <&7>Server Enchanter
  gui: true
  definitions:
    ?: <item[ce_shop_fill]>
    1: <item[simple_enchantment]>
    2: <item[unique_enchantment]>
    3: <item[elite_enchantment]>
    4: <item[ultimate_enchantment]>
    5: <item[legendary_enchantment]>
    6: <item[heroic_enchantment]>
    7: <item[tinkerer]>
    8: <item[alchemist]>
  slots:
    - [?] [?] [1] [2] [3] [4] [5] [?] [?]
    - [7] [?] [?] [?] [6] [?] [?] [?] [8]

ce_shop_handler:
  type: world
  debug: false
  events:
    on player drags in ce_shop:
    - determine cancelled
    on player clicks in ce_shop:
    - if <context.item> == gray_stained_glass_pane:
      - determine cancelled
    - else if <context.item> == <item[simple_enchantment]>:
      - inventory open d:simple_shop
    - else if <context.item> == <item[unique_enchantment]>:
      - inventory open d:unique_shop
    - else if <context.item> == <item[elite_enchantment]>:
      - inventory open d:elite_shop
    - else if <context.item> == <item[ultimate_enchantment]>:
      - inventory open d:ultimate_shop
    - else if <context.item> == <item[legendary_enchantment]>:
      - inventory open d:legendary_shop
    - else if <context.item> == <item[heroic_enchantment]>:
      - inventory open d:heroic_shop
    - else if <context.item> == <item[tinkerer]>:
      - execute as_player tinkerer
    - else if <context.item> == <item[alchemist]>:
      - execute as_player alchemist

simple_shop:
  type: inventory
  inventory: chest
  debug: false
  title: <&7>Simple Enchantments
  gui: true
  definitions:
    ?: <item[ce_shop_fill]>
    1: <item[simple_single_item[quantity=1]]>
    2: <item[simple_sixteen_item[quantity=16]]>
    3: <item[simple_thirty_two_item[quantity=32]]>
    4: <item[simple_sixty_four_item[quantity=64]]>
    5: <item[ce_shop_back_button]>
  slots:
    - [?] [1] [?] [2] [?] [3] [?] [4] [?]
    - [?] [?] [?] [?] [5] [?] [?] [?] [?]

simple_single_item:
  type: item
  material: firework_star
  display name: <&7><&l>Simple Enchantment Book
  lore:
  - <empty>
  - <&7>Click this to pay 400 with EXP
  mechanisms:
    firework: <map[type=BALL;color=200,200,200;fade_color=200,200,200;trail=false;flicker=false]>
    hides: ALL

simple_sixteen_item:
  type: item
  material: firework_star
  display name: <&7><&l>Simple Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 6400 with EXP
  mechanisms:
    firework: <map[type=BALL;color=200,200,200;fade_color=200,200,200;trail=false;flicker=false]>
    hides: ALL

simple_thirty_two_item:
  type: item
  material: firework_star
  display name: <&7><&l>Simple Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 12800 with EXP
  mechanisms:
    firework: <map[type=BALL;color=200,200,200;fade_color=200,200,200;trail=false;flicker=false]>
    hides: ALL

simple_sixty_four_item:
  type: item
  material: firework_star
  display name: <&7><&l>Simple Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 25600 with EXP
  mechanisms:
    firework: <map[type=BALL;color=200,200,200;fade_color=200,200,200;trail=false;flicker=false]>
    hides: ALL
# 45,200 total if you purchase one of each item

simple_ce_shop_handler:
  type: world
  debug: false
  events:
    on player drags in simple_shop:
    - determine cancelled
    on player clicks in simple_shop:
    - define playername <player.name>
    - define uuid <server.match_offline_player[<[playername]>].uuid>
    - define empty_slot <player.inventory.empty_slots>
    - define exp <player.calculate_xp>
    - if <context.item> == gray_stained_glass_pane || <[empty_slot]> == 0:
      - determine cancelled
    - else if <context.item> == <item[simple_single_item[quantity=1]]>:
      - if <[exp]> >= 400:
        - experience take 400 player:<[uuid]>
        - execute as_server "ae givercbook SIMPLE <[playername]> 1" silent
        - narrate "<&a>Purchase successful! -400 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[simple_sixteen_item[quantity=16]]>:
      - if <[exp]> >= 6400:
        - experience take 6400 player:<[uuid]>
        - execute as_server "ae givercbook SIMPLE <[playername]> 16" silent
        - narrate "<&a>Purchase successful! -6400 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[simple_thirty_two_item[quantity=32]]>:
      - if <[exp]> >= 12800:
        - experience take 12800 player:<[uuid]>
        - execute as_server "ae givercbook SIMPLE <[playername]> 32" silent
        - narrate "<&a>Purchase successful! -12800 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[simple_sixty_four_item[quantity=64]]>:
      - if <[exp]> >= 25600:
        - experience take 25600 player:<[uuid]>
        - execute as_server "ae givercbook SIMPLE <[playername]> 64" silent
        - narrate "<&a>Purchase successful! -25600 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ce_shop_back_button]>:
      - inventory open d:ce_shop

unique_shop:
  type: inventory
  inventory: chest
  debug: false
  title: <&a>Unique Enchantments
  gui: true
  definitions:
    ?: <item[ce_shop_fill]>
    1: <item[unique_single_item[quantity=1]]>
    2: <item[unique_sixteen_item[quantity=16]]>
    3: <item[unique_thirty_two_item[quantity=32]]>
    4: <item[unique_sixty_four_item[quantity=64]]>
    5: <item[ce_shop_back_button]>
  slots:
    - [?] [1] [?] [2] [?] [3] [?] [4] [?]
    - [?] [?] [?] [?] [5] [?] [?] [?] [?]

unique_single_item:
  type: item
  material: firework_star
  display name: <&a><&l>Unique Enchantment Book
  lore:
  - <empty>
  - <&7>Click this to pay 800 with EXP
  mechanisms:
    firework: <map[type=BALL;color=122,255,80;fade_color=122,255,80;trail=false;flicker=false]>
    hides: ALL

unique_sixteen_item:
  type: item
  material: firework_star
  display name: <&a><&l>Unique Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 12800 with EXP
  mechanisms:
    firework: <map[type=BALL;color=122,255,80;fade_color=122,255,80;trail=false;flicker=false]>
    hides: ALL

unique_thirty_two_item:
  type: item
  material: firework_star
  display name: <&a><&l>Unique Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 25600 with EXP
  mechanisms:
    firework: <map[type=BALL;color=122,255,80;fade_color=122,255,80;trail=false;flicker=false]>
    hides: ALL

unique_sixty_four_item:
  type: item
  material: firework_star
  display name: <&a><&l>Unique Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 51200 with EXP
  mechanisms:
    firework: <map[type=BALL;color=122,255,80;fade_color=122,255,80;trail=false;flicker=false]>
    hides: ALL
# 90,400 total if you purchase one of each item

unique_ce_shop_handler:
  type: world
  debug: false
  events:
    on player drags in unique_shop:
    - determine cancelled
    on player clicks in unique_shop:
    - define playername <player.name>
    - define uuid <server.match_offline_player[<[playername]>].uuid>
    - define empty_slot <player.inventory.empty_slots>
    - define exp <player.calculate_xp>
    - if <context.item> == gray_stained_glass_pane || <[empty_slot]> == 0:
      - determine cancelled
    - else if <context.item> == <item[unique_single_item[quantity=1]]>:
      - if <[exp]> >= 800:
        - experience take 800 player:<[uuid]>
        - execute as_server "ae givercbook UNIQUE <[playername]> 1" silent
        - narrate "<&a>Purchase successful! -800 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[unique_sixteen_item[quantity=16]]>:
      - if <[exp]> >= 12800:
        - experience take 12800 player:<[uuid]>
        - execute as_server "ae givercbook UNIQUE <[playername]> 16" silent
        - narrate "<&a>Purchase successful! -12800 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[unique_thirty_two_item[quantity=32]]>:
      - if <[exp]> >= 25600:
        - experience take 25600 player:<[uuid]>
        - execute as_server "ae givercbook UNIQUE <[playername]> 32" silent
        - narrate "<&a>Purchase successful! -25600 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[unique_sixty_four_item[quantity=64]]>:
      - if <[exp]> >= 51200:
        - experience take 51200 player:<[uuid]>
        - execute as_server "ae givercbook UNIQUE <[playername]> 64" silent
        - narrate "<&a>Purchase successful! -51200 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ce_shop_back_button]>:
      - inventory open d:ce_shop

elite_shop:
  type: inventory
  inventory: chest
  debug: false
  title: <&b>Elite Enchantments
  gui: true
  definitions:
    ?: <item[ce_shop_fill]>
    1: <item[elite_single_item[quantity=1]]>
    2: <item[elite_sixteen_item[quantity=16]]>
    3: <item[elite_thirty_two_item[quantity=32]]>
    4: <item[elite_sixty_four_item[quantity=64]]>
    5: <item[ce_shop_back_button]>
  slots:
    - [?] [1] [?] [2] [?] [3] [?] [4] [?]
    - [?] [?] [?] [?] [5] [?] [?] [?] [?]

elite_single_item:
  type: item
  material: firework_star
  display name: <&b><&l>Elite Enchantment Book
  lore:
  - <empty>
  - <&7>Click this to pay 2500 with EXP
  mechanisms:
    firework: <map[type=BALL;color=20,250,255;fade_color=20,250,255;trail=false;flicker=false]>
    hides: ALL

elite_sixteen_item:
  type: item
  material: firework_star
  display name: <&b><&l>Elite Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 40000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=20,250,255;fade_color=20,250,255;trail=false;flicker=false]>
    hides: ALL

elite_thirty_two_item:
  type: item
  material: firework_star
  display name: <&b><&l>Elite Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 80000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=20,250,255;fade_color=20,250,255;trail=false;flicker=false]>
    hides: ALL

elite_sixty_four_item:
  type: item
  material: firework_star
  display name: <&b><&l>Elite Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 160000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=20,250,255;fade_color=20,250,255;trail=false;flicker=false]>
    hides: ALL
# 282,500 total if you purchase one of each item

elite_ce_shop_handler:
  type: world
  debug: false
  events:
    on player drags in elite_shop:
    - determine cancelled
    on player clicks in elite_shop:
    - define playername <player.name>
    - define uuid <server.match_offline_player[<[playername]>].uuid>
    - define empty_slot <player.inventory.empty_slots>
    - define exp <player.calculate_xp>
    - if <context.item> == gray_stained_glass_pane || <[empty_slot]> == 0:
      - determine cancelled
    - else if <context.item> == <item[elite_single_item[quantity=1]]>:
      - if <[exp]> >= 2500:
        - experience take 2500 player:<[uuid]>
        - execute as_server "ae givercbook ELITE <[playername]> 1" silent
        - narrate "<&a>Purchase successful! -2500 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[elite_sixteen_item[quantity=16]]>:
      - if <[exp]> >= 40000:
        - experience take 40000 player:<[uuid]>
        - execute as_server "ae givercbook ELITE <[playername]> 16" silent
        - narrate "<&a>Purchase successful! -40000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[elite_thirty_two_item[quantity=32]]>:
      - if <[exp]> >= 80000:
        - experience take 80000 player:<[uuid]>
        - execute as_server "ae givercbook ELITE <[playername]> 32" silent
        - narrate "<&a>Purchase successful! -80000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[elite_sixty_four_item[quantity=64]]>:
      - if <[exp]> >= 160000:
        - experience take 160000 player:<[uuid]>
        - execute as_server "ae givercbook ELITE <[playername]> 64" silent
        - narrate "<&a>Purchase successful! -160000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ce_shop_back_button]>:
      - inventory open d:ce_shop

ultimate_shop:
  type: inventory
  inventory: chest
  debug: false
  title: <&e>Ultimate Enchantments
  gui: true
  definitions:
    ?: <item[ce_shop_fill]>
    1: <item[ultimate_single_item[quantity=1]]>
    2: <item[ultimate_sixteen_item[quantity=16]]>
    3: <item[ultimate_thirty_two_item[quantity=32]]>
    4: <item[ultimate_sixty_four_item[quantity=64]]>
    5: <item[ce_shop_back_button]>
  slots:
    - [?] [1] [?] [2] [?] [3] [?] [4] [?]
    - [?] [?] [?] [?] [5] [?] [?] [?] [?]

ultimate_single_item:
  type: item
  material: firework_star
  display name: <&e><&l>Ultimate Enchantment Book
  lore:
  - <empty>
  - <&7>Click this to pay 5000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=250,255,0;fade_color=250,255,0;trail=false;flicker=false]>
    hides: ALL

ultimate_sixteen_item:
  type: item
  material: firework_star
  display name: <&e><&l>Ultimate Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 80000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=250,255,0;fade_color=250,255,0;trail=false;flicker=false]>
    hides: ALL

ultimate_thirty_two_item:
  type: item
  material: firework_star
  display name: <&e><&l>Ultimate Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 160000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=250,255,0;fade_color=250,255,0;trail=false;flicker=false]>
    hides: ALL

ultimate_sixty_four_item:
  type: item
  material: firework_star
  display name: <&e><&l>Ultimate Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 320000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=250,255,0;fade_color=250,255,0;trail=false;flicker=false]>
    hides: ALL
# 565,000 total if you purchase one of each item

ultimate_ce_shop_handler:
  type: world
  debug: false
  events:
    on player drags in ultimate_shop:
    - determine cancelled
    on player clicks in ultimate_shop:
    - define playername <player.name>
    - define uuid <server.match_offline_player[<[playername]>].uuid>
    - define empty_slot <player.inventory.empty_slots>
    - define exp <player.calculate_xp>
    - if <context.item> == gray_stained_glass_pane || <[empty_slot]> == 0:
      - determine cancelled
    - else if <context.item> == <item[ultimate_single_item[quantity=1]]>:
      - if <[exp]> >= 5000:
        - experience take 5000 player:<[uuid]>
        - execute as_server "ae givercbook ULTIMATE <[playername]> 1" silent
        - narrate "<&a>Purchase successful! -5000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ultimate_sixteen_item[quantity=16]]>:
      - if <[exp]> >= 80000:
        - experience take 80000 player:<[uuid]>
        - execute as_server "ae givercbook ULTIMATE <[playername]> 16" silent
        - narrate "<&a>Purchase successful! -80000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ultimate_thirty_two_item[quantity=32]]>:
      - if <[exp]> >= 160000:
        - experience take 160000 player:<[uuid]>
        - execute as_server "ae givercbook ULTIMATE <[playername]> 32" silent
        - narrate "<&a>Purchase successful! -160000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ultimate_sixty_four_item[quantity=64]]>:
      - if <[exp]> >= 320000:
        - experience take 320000 player:<[uuid]>
        - execute as_server "ae givercbook ULTIMATE <[playername]> 64" silent
        - narrate "<&a>Purchase successful! -320000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ce_shop_back_button]>:
      - inventory open d:ce_shop

legendary_shop:
  type: inventory
  inventory: chest
  debug: false
  title: <&6>Legendary Enchantments
  gui: true
  definitions:
    ?: <item[ce_shop_fill]>
    1: <item[legendary_single_item[quantity=1]]>
    2: <item[legendary_sixteen_item[quantity=16]]>
    3: <item[legendary_thirty_two_item[quantity=32]]>
    4: <item[legendary_sixty_four_item[quantity=64]]>
    5: <item[ce_shop_back_button]>
  slots:
    - [?] [1] [?] [2] [?] [3] [?] [4] [?]
    - [?] [?] [?] [?] [5] [?] [?] [?] [?]

legendary_single_item:
  type: item
  material: firework_star
  display name: <&6><&l>Legendary Enchantment Book
  lore:
  - <empty>
  - <&7>Click this to pay 25000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=255,182,0;fade_color=255,182,0;trail=false;flicker=false]>
    hides: ALL

legendary_sixteen_item:
  type: item
  material: firework_star
  display name: <&6><&l>Legendary Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 400000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=255,182,0;fade_color=255,182,0;trail=false;flicker=false]>
    hides: ALL

legendary_thirty_two_item:
  type: item
  material: firework_star
  display name: <&6><&l>Legendary Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 800000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=255,182,0;fade_color=255,182,0;trail=false;flicker=false]>
    hides: ALL

legendary_sixty_four_item:
  type: item
  material: firework_star
  display name: <&6><&l>Legendary Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 1600000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=255,182,0;fade_color=255,182,0;trail=false;flicker=false]>
    hides: ALL
# 2,825,000 total if you purchase one of each item

legendary_ce_shop_handler:
  type: world
  debug: false
  events:
    on player drags in legendary_shop:
    - determine cancelled
    on player clicks in legendary_shop:
    - define playername <player.name>
    - define uuid <server.match_offline_player[<[playername]>].uuid>
    - define empty_slot <player.inventory.empty_slots>
    - define exp <player.calculate_xp>
    - if <context.item> == gray_stained_glass_pane || <[empty_slot]> == 0:
      - determine cancelled
    - else if <context.item> == <item[legendary_single_item[quantity=1]]>:
      - if <[exp]> >= 25000:
        - experience take 25000 player:<[uuid]>
        - execute as_server "ae givercbook LEGENDARY <[playername]> 1" silent
        - narrate "<&a>Purchase successful! -25000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[legendary_sixteen_item[quantity=16]]>:
      - if <[exp]> >= 400000:
        - experience take 400000 player:<[uuid]>
        - execute as_server "ae givercbook LEGENDARY <[playername]> 16" silent
        - narrate "<&a>Purchase successful! -400000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[legendary_thirty_two_item[quantity=32]]>:
      - if <[exp]> >= 800000:
        - experience take 800000 player:<[uuid]>
        - execute as_server "ae givercbook LEGENDARY <[playername]> 32" silent
        - narrate "<&a>Purchase successful! -800000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[legendary_sixty_four_item[quantity=64]]>:
      - if <[exp]> >= 1600000:
        - experience take 1600000 player:<[uuid]>
        - execute as_server "ae givercbook LEGENDARY <[playername]> 64" silent
        - narrate "<&a>Purchase successful! -1600000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ce_shop_back_button]>:
      - inventory open d:ce_shop

heroic_shop:
  type: inventory
  inventory: chest
  debug: false
  title: <&4>Heroic Enchantments
  gui: true
  definitions:
    ?: <item[ce_shop_fill]>
    1: <item[heroic_single_item[quantity=1]]>
    2: <item[heroic_sixteen_item[quantity=16]]>
    3: <item[heroic_thirty_two_item[quantity=32]]>
    4: <item[heroic_sixty_four_item[quantity=64]]>
    5: <item[ce_shop_back_button]>
  slots:
    - [?] [1] [?] [2] [?] [3] [?] [4] [?]
    - [?] [?] [?] [?] [5] [?] [?] [?] [?]

heroic_single_item:
  type: item
  material: firework_star
  display name: <&d><&l>Heroic Enchantment Book
  lore:
  - <empty>
  - <&7>Click this to pay 50000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=133,50,168;fade_color=133,50,168;trail=false;flicker=false]>
    hides: ALL

heroic_sixteen_item:
  type: item
  material: firework_star
  display name: <&d><&l>Heroic Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 800000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=133,50,168;fade_color=133,50,168;trail=false;flicker=false]>
    hides: ALL

heroic_thirty_two_item:
  type: item
  material: firework_star
  display name: <&d><&l>Heroic Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 1600000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=133,50,168;fade_color=133,50,168;trail=false;flicker=false]>
    hides: ALL

heroic_sixty_four_item:
  type: item
  material: firework_star
  display name: <&d><&l>Heroic Enchantment Books
  lore:
  - <empty>
  - <&7>Click this to pay 3200000 with EXP
  mechanisms:
    firework: <map[type=BALL;color=133,50,168;fade_color=133,50,168;trail=false;flicker=false]>
    hides: ALL
# 5,650,000 total if you purchase one of each item

heroic_ce_shop_handler:
  type: world
  debug: false
  events:
    on player drags in heroic_shop:
    - determine cancelled
    on player clicks in heroic_shop:
    - define playername <player.name>
    - define uuid <server.match_offline_player[<[playername]>].uuid>
    - define empty_slot <player.inventory.empty_slots>
    - define exp <player.calculate_xp>
    - if <context.item> == gray_stained_glass_pane || <[empty_slot]> == 0:
      - determine cancelled
    - else if <context.item> == <item[heroic_single_item[quantity=1]]>:
      - if <[exp]> >= 50000:
        - experience take 50000 player:<[uuid]>
        - execute as_server "ae givercbook HEROIC <[playername]> 1" silent
        - narrate "<&a>Purchase successful! -50000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[heroic_sixteen_item[quantity=16]]>:
      - if <[exp]> >= 800000:
        - experience take 800000 player:<[uuid]>
        - execute as_server "ae givercbook HEROIC <[playername]> 16" silent
        - narrate "<&a>Purchase successful! -800000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[heroic_thirty_two_item[quantity=32]]>:
      - if <[exp]> >= 1600000:
        - experience take 1600000 player:<[uuid]>
        - execute as_server "ae givercbook HEROIC <[playername]> 32" silent
        - narrate "<&a>Purchase successful! -1600000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[heroic_sixty_four_item[quantity=64]]>:
      - if <[exp]> >= 3200000:
        - experience take 3200000 player:<[uuid]>
        - execute as_server "ae givercbook HEROIC <[playername]> 64" silent
        - narrate "<&a>Purchase successful! -3200000 xp points" targets:<[uuid]>
      - else:
        - narrate "<&c>You do not have enough EXP to purchase that" targets:<[uuid]>
    - else if <context.item> == <item[ce_shop_back_button]>:
      - inventory open d:ce_shop
