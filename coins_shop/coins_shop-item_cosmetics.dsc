item_cosmetics:
  type: inventory
  inventory: chest
  debug: true
  title: <&e><&l>Item_Cosmetics
  gui: true
  definitions:
    ?: <item[dAir]>
    1: <item[riversofblood]>
    2: <item[irithyllblade]>
    3: <item[frayedblade]>
    4: <item[moonveil]>
    5: <item[meteoricoreblade]>
    backButton: <item[backButton]>
  slots:
    - [] [] [] [] [] [] [] [] []
    - [] [1] [] [2] [] [3] [] [4] []
    - [] [] [] [] [5] [] [] [] []

item_cosmetics_handler:
  type: world
  debug: true
  events:
    on player drags in item_cosmetics:
    - determine cancelled
    on player clicks in item_cosmetics:
    - if <context.item> == air:
      - determine cancelled
    - if <context.item> == <item[backButton]>:
       - inventory open d:coinsshop
    - choose <context.slot>:
        - case 11:
            - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
            - if <[coins]> >= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>5,835.85 Coins <&f>still want to purchase?"
                - clickable save:clickableRiversOfBlood:
                    - execute as_server "magbungkalcoins take <player.name> 5835"
                    - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><&l><player.name> <&f>bought <&gradient[from=#8B0000;to=#8B0000]>Sanguis <&gradient[from=#C34343;to=#C34343]>Reaver"
                    - give riversofblood
                    - firework <player.eye_location.add[0,-2,0]> random trail
                    - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1 volume:1
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableRiversOfBlood].command>]> <&r><&f>to buy"
            - if <[coins]> <= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
                - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
                - stop
        - case 13:
            - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
            - if <[coins]> >= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>5,835.85 Coins <&f>still want to purchase?"
                - clickable save:clickableIrithyllBlade:
                    - execute as_server "magbungkalcoins take <player.name> 5835"
                    - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><&l><player.name> <&f>bought <&gradient[from=#87CEEB;to=#87CEEB]>Boreas <&gradient[from=#FFFFFF;to=#FFFFFF]>Whisperr"
                    - give irithyllblade
                    - firework <player.eye_location.add[0,-2,0]> random trail
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableIrithyllBlade].command>]> <&r><&f>to buy"
            - if <[coins]> <= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
                - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
                - stop
        - case 15:
            - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
            - if <[coins]> >= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>5,835.85 Coins <&f>still want to purchase?"
                - clickable save:clickableFrayedBlade:
                    - execute as_server "magbungkalcoins take <player.name> 5835"
                    - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><&l><player.name> <&f>bought <&gradient[from=#E287E9;to=#E287E9]>Oblivion’s <&gradient[from=#A390E8;to=#A390E8]>Call"
                    - give frayedblade
                    - firework <player.eye_location.add[0,-2,0]> random trail
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableFrayedBlade].command>]> <&r><&f>to buy"
            - if <[coins]> <= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
                - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
                - stop
        - case 17:
            - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
            - if <[coins]> >= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>5,835.85 Coins <&f>still want to purchase?"
                - clickable save:clickableMoonVeil:
                    - execute as_server "magbungkalcoins take <player.name> 5835"
                    - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><&l><player.name> <&f>bought <&gradient[from=#3F75C8;to=#3F75C8]>Blade of <&gradient[from=#A1E4F3;to=#A1E4F3]>Lunaris"
                    - give moonveil
                    - firework <player.eye_location.add[0,-2,0]> random trail
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableMoonVeil].command>]> <&r><&f>to buy"
            - if <[coins]> <= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
                - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
                - stop
        - case 23:
            - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
            - if <[coins]> >= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>This will cost you <&e>5,835.85 Coins <&f>still want to purchase?"
                - clickable save:clickableMeteoiricoreBlade:
                    - execute as_server "magbungkalcoins take <player.name> 5835"
                    - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><&l><player.name> <&f>bought <&gradient[from=#E7B563;to=#E7B563]>Solar <&gradient[from=#93593F;to=#93593F]>Fissure"
                    - give meteoricoreblade
                    - firework <player.eye_location.add[0,-2,0]> random trail
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Click <element[<&a><&l>[CONFIRM]].on_click[<entry[clickableMeteoiricoreBlade].command>]> <&r><&f>to buy"
            - if <[coins]> <= 5835:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins!"
                - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
                - stop
