blackmarketTokenCommand:
    type: command
    name: blackmarkettoken
    description: pogi si akyo :D
    usage: /blackmarkettoken
    script:
    # - inventory open d:blackmarketTokenInventory

    - if <util.time_now.day_of_week_name> == MONDAY:
        - playsound <player.location> sound:BLOCK_CONDUIT_ACTIVATE pitch:1 volume:1
        - inventory open d:blackmarketTokenInventory
        - cast blindness duration:1.5
        - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
        - stop
    - if <util.time_now.day_of_week_name> == WEDNESDAY:
        - playsound <player.location> sound:BLOCK_CONDUIT_ACTIVATE pitch:1 volume:1
        - inventory open d:blackmarketTokenInventory
        - cast blindness duration:1.5
        - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
        - stop
    - if <util.time_now.day_of_week_name> == FRIDAY:
        - playsound <player.location> sound:BLOCK_CONDUIT_ACTIVATE pitch:1 volume:1
        - inventory open d:blackmarketTokenInventory
        - cast blindness duration:1.5
        - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
        - stop
    - if <util.time_now.day_of_week_name> == SUNDAY:
        - playsound <player.location> sound:BLOCK_CONDUIT_ACTIVATE pitch:1 volume:1
        - inventory open d:blackmarketTokenInventory
        - cast blindness duration:1.5
        - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
        - stop
    - else if <util.time_now.day_of_week_name> == TUESDAY:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Blackmarket is closed. Come back Monday, Wednesday, Friday, or Sunday."
        - stop
    - else if <util.time_now.day_of_week_name> == THURSDAY:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Blackmarket is closed. Come back Monday, Wednesday, Friday, or Sunday."
        - stop
    - else if <util.time_now.day_of_week_name> == SATURDAY:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Blackmarket is closed. Come back Monday, Wednesday, Friday, or Sunday."
        - stop

blackmarketRuby:
    type: item
    material: paper
    display name: <&gradient[from=#FF7B73;to=#922F11]> Ruby
    lore:
    - <&f>Trade this at <&8><&n>/warp Blackmarket
    - <&f><&o>Non refundable!
    mechanisms:
      custom_model_data: 999913

blackmarketCarnelian:
    type: item
    material: paper
    display name: <&gradient[from=#73B3FF;to=#112B92]> Carnelian
    lore:
    - <&f>Trade this at <&8><&n>/warp Blackmarket
    - <&f><&o>Non refundable!
    mechanisms:
      custom_model_data: 999914

blackmarketTokenInventory:
  type: inventory
  inventory: chest
  debug: true
  title: <&b><&l>Tokens
  gui: true
  definitions:
    carnelian: <item[blackmarketCarnelian]>
    ruby: <item[blackmarketRuby]>
  slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [paper[display=<&gradient[from=#73B3FF;to=#112B92]>Carnelian;custom_model_data=999914;lore=<&e>1,500 Coins<n><n><&7><&o>Non refundable!<n><&f><&n>Right-click to purchase<&r>]] [] [paper[display=<&gradient[from=#FF7B73;to=#922F11]>Ruby;custom_model_data=999913;lore=<&a>₱50,000<n><n><&7><&o>Non refundable!<n><&f><&n>Right-click to purchase]] [] [] []
    - [] [] [] [] [] [] [] [] []

blackmarketTokenInventory_handler:
  type: world
  debug: false
  events:
    on player drags in blackmarketTokenInventory:
    - determine cancelled
    on player clicks in blackmarketTokenInventory:
    - if <context.item> == air:
      - determine cancelled
    - choose <context.slot>:
      - case 13:
         - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
         - if <[coins]> >= 1500:
            - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>1,500 Coins <&f>still want to purchase?"
            - clickable save:clickableCarnelian:
                - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><placeholder[player_displayname]> <&f>Bought <&8>(<&f>1x<&8>)<&f> of <&gradient[from=#73B3FF;to=#112B92]>Carnelian <&f>(/warp Blackmarket)"
                - give blackmarketcarnelian
                - execute as_server "magbungkalcoins take <player.name> 1500"
            - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableCarnelian].command>]> <&r><&f>to buy"
         - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1
      - case 15:
         - define money <player.money>
         - if <[money]> >= 50000:
            - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&a>₱50,000 <&f>still want to purchase?"
            - clickable save:clickableRuby:
                - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><placeholder[player_displayname]> <&f>Bought <&8>(<&f>1x<&8>)<&f> of <&gradient[from=#FF7B73;to=#922F11]>Ruby <&f>(/warp Blackmarket)"
                - give blackmarketruby
                - execute as_server "money take <player.name> 50k"
            - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableRuby].command>]> <&r><&f>to buy"
         - if <[money]> <= 50000:
            - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough money!"
         - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1
