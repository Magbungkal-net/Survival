keyshop:
  type: inventory
  inventory: chest
  debug: true
  title: <&e><&l>Keys
  gui: true
  definitions:
    ?: <item[dAir]>
    1: <item[monthly_crate_key]>
    tags_key: <item[tags_key]>
    glow_key: <item[glow_key]>
    cosmetics_key: <item[cosmetics_key]>
    pets_key: <item[pets_key]>
    backButton: <item[backButton]>
  slots:
    - [] [] [] [] [1] [] [] [] []
    - [] [pets_key] [] [tags_key] [] [glow_key] [] [cosmetics_key] []
    - [] [] [] [] [] [] [] [] []

# 1,949.85 - 2,399.85

keyshop_handler:
  type: world
  debug: false
  events:
    on player drags in keyshop:
    - determine cancelled
    on player clicks in keyshop:
    - if <context.item> == air:
      - determine cancelled
    - if <context.item> == <item[backButton]>:
       - inventory open d:coinsshop
    - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
    - if <context.item> == <item[monthly_crate_key]>:
      - if <[coins]> >= 2399.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>2,399.85 Coins <&f>still want to purchase?"
        - clickable save:clickableMonthlyCrateKey:
            - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><placeholder[player_displayname]> <&f>Bought <&8>(<&f>1x<&8>)<&f> of <&gradient[from=#7C4751;to=#7C4751]>Monthly Crate Key <&e>(/cshop)"
            - execute as_server "magbungkalcoins take <player.name> 2399.85"
            - execute as_server "crate key give <player.name> shadow_bat_key 1"
            - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1 volume:1
            - stop
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableMonthlyCrateKey].command>]> <&r><&f>to buy"
      - if <[coins]> <= 2399.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
        - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - stop

    - if <context.item> == <item[pets_key]>:
      - if <[coins]> >= 1949.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>1,949.85 Coins <&f>still want to purchase?"
        - clickable save:clickablePetsKey:
            - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><placeholder[player_displayname]> <&f>Bought <&8>(<&f>1x<&8>)<&f> of <&gradient[from=#7C4751;to=#7C4751]>Pets Key <&e>(/cshop)"
            - execute as_server "magbungkalcoins take <player.name> 1949.85"
            - execute as_server "crate key give <player.name> pets 1"
            - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1 volume:1
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickablePetsKey].command>]> <&r><&f>to buy"
      - if <[coins]> <= 1949.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
        - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - stop

    - if <context.item> == <item[tags_key]>:
      - if <[coins]> >= 1485.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>1,485.85 Coins <&f>still want to purchase?"
        - clickable save:clickableTagsKey:
            - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><placeholder[player_displayname]> <&f>Bought <&8>(<&f>1x<&8>)<&f> of <&gradient[from=#7C4751;to=#7C4751]>Tags Key <&e>(/cshop)"
            - execute as_server "magbungkalcoins take <player.name> 1949.85"
            - execute as_server "crate key give <player.name> tags 1"
            - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1 volume:1
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableTagsKey].command>]> <&r><&f>to buy"
      - if <[coins]> <= 1485.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
        - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - stop

    - if <context.item> == <item[cosmetics_key]>:
      - if <[coins]> >= 1485.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>1,485.85 Coins <&f>still want to purchase?"
        - clickable save:clickableCosmeticKey:
            - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><placeholder[player_displayname]> <&f>Bought <&8>(<&f>1x<&8>)<&f> of <&gradient[from=#7C4751;to=#7C4751]>Cosmetic Key <&e>(/cshop)"
            - execute as_server "magbungkalcoins take <player.name> 1485.85"
            - execute as_server "crate key give <player.name> cosmetic 1"
            - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1 volume:1
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableCosmeticKey].command>]> <&r><&f>to buy"
      - if <[coins]> <= 1485.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
        - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - stop

    - if <context.item> == <item[glow_key]>:
      - if <[coins]> >= 1485.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>1,485.85 Coins <&f>still want to purchase?"
        - clickable save:clickableGlowKey:
            - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><placeholder[player_displayname]> <&f>Bought <&8>(<&f>1x<&8>)<&f> of <&gradient[from=#7C4751;to=#7C4751]>Glow Key <&e>(/cshop)"
            - execute as_server "magbungkalcoins take <player.name> 1485.85"
            - execute as_server "crate key give <player.name> glow 1"
            - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1 volume:1
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableGlowKey].command>]> <&r><&f>to buy"
      - if <[coins]> <= 1485.85:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
        - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - stop
