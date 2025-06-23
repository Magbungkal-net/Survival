christmas_2024_wing:
    type: item
    material: kelp
    display name: <&gradient[from=#C4FFB4;to=#FF8E58]>❆ Yuletide Tree Wings ❆
    mechanisms:
         unbreakable: true
         custom_model_data: 1009
         attribute_modifiers:
            #  generic_jump_strength:
            #      1:
            #          operation: add_scalar
            #          amount: 0.01
            #          slot: off_hand
            #          id: 6b911a85-d357-426b-9677-9808be31c376
             generic_max_health:
                 1:
                     operation: add_number
                     amount: 20
                     slot: off_hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
    lore:
    - <empty>
    -   <&gradient[from=#C4FFB4;to=#C4FFB4]>A dazzling pair of wings adorned with sparkling ornaments and festive lights, radiating
    -   <&gradient[from=#C4FFB4;to=#C4FFB4]>the warm glow of a Christmas tree in flight.
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#C4FFB4;to=#C4FFB4]>When equips apply<&gradient[from=#FF8E58;to=#FF8E58]> NIGHT VISION and FIRE RESISTANCE <&gradient[from=#C4FFB4;to=#C4FFB4]>
    - <&gradient[from=#C4FFB4;to=#C4FFB4]>Skill Cooldown: <&gradient[from=#FF8E58;to=#FF8E58]>30 minutes
    - <empty>
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>+20 Health<&8><&l>】
    # - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>+0.1% Jump Boost<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#C4FFB4;to=#FF8E58]><&l>Christmas Crate 2024
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#C4FFB4;to=#FF8E58]>Winter Spirit
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#C4FFB4;to=#FF8E58]>Mythical
    - <&8><&m><&l>==============================

christmas_2024_wingEvents:
    type: world
    debug: false
    events:
      after player holds item item:christmas_2024_wing:
      - define player <player.name>
      - if <player.has_flag[christmas_2024_wing_strength]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Night Vision is still on cooldown: <player.flag_expiration[christmas_2024_wing_strength].from_now.formatted>"
         - determine cancelled
      - cast night_vision amplifier:4 <player> duration:1h
      - cast fire_resistance amplifier:4 <player> duration:1h
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:10 quantity:10000
      - flag player christmas_2024_wing_strength expire:30m