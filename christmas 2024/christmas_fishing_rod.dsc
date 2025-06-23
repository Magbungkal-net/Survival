christmas_fishing_rod:
    type: item
    material: fishing_rod
    display name: <&gradient[from=#C4FFB4;to=#FF8E58]>❆ Frostline Angler ❆
    enchantments:
    - luck:8
    - lure:10
    mechanisms:
         unbreakable: true
         custom_model_data: 1026
         attribute_modifiers:
             generic_luck:
                 1:
                     operation: add_number
                     amount: 11.5
                     slot: hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
    lore:
    - <empty>
    -   <&gradient[from=#FF8E58;to=#FF8E58]>This charming fishing rod is crafted from a sturdy winter pine, with a reel made from
    -   <&gradient[from=#FF8E58;to=#FF8E58]>polished peppermint. When cast, it not only attracts fish but also releases a cloud of snowflakes,
    -   <&gradient[from=#FF8E58;to=#FF8E58]>creating a serene winter wonderland on the water's surface.
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>After equips apply <&gradient[from=#FF8E58;to=#FF8E58]>Night Vision & Water Breathing<&gradient[from=#FF8E58;to=#FF8E58]>
    - <&gradient[from=#FF8E58;to=#FF8E58]>Skill Cooldown: <&gradient[from=#FF8E58;to=#FF8E58]>3 seconds
    - <empty>
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>+11.5 Luck<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#C4FFB4;to=#FF8E58]><&l>Christmas Crate 2024
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#C4FFB4;to=#FF8E58]>Winter Spirit
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#C4FFB4;to=#FF8E58]>Mythical
    - <&8><&m><&l>==============================
    - <&8><&l>▶ 【<&6>Not advisable for putting vanilla enchants or custom enchants<&8><&l>】

christmas_fishing_rodEvents:
    type: world
    debug: false
    events:
      after player holds item item:christmas_fishing_rod:
      - define player <player.name>
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>You can't use a skill at spawn!"
        - determine cancelled
      - if <player.has_flag[christmas_fishing_rod_effect]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>Teleport is cooldown: <player.flag_expiration[christmas_fishing_rod_effect].from_now.formatted>"
         - determine cancelled
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>Applied Increase Damage for 5 minutes!"
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:1.5 quantity:500
      - cast water_breathing duration:1h
      - cast night_vision duration:1h
      - flag player christmas_fishing_rod_effect expire:3om