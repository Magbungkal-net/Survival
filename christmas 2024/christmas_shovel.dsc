christmas_shovel:
    type: item
    material: netherite_shovel
    display name: <&gradient[from=#C4FFB4;to=#FF8E58]>❆ Snowdrift Shovel ❆
    enchantments:
    - efficiency:10
    - fortune:4
    mechanisms:
         unbreakable: true
         custom_model_data: 1030
         attribute_modifiers:
             player_mining_efficiency:
                 1:
                     operation: add_scalar
                     amount: 0.81
                     slot: hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
             player_block_break_speed:
                 1:
                     operation: add_scalar
                     amount: 0.96
                     slot: hand
                     id: 1af08d70-7aa1-45a4-bbbe-7dc0235416cb
    lore:
    - <empty>
    -   <&gradient[from=#FF8E58;to=#FF8E58]>This enchanted shovel is crafted from sturdy, frosted wood and crowned with a blade of
    -   <&gradient[from=#FF8E58;to=#FF8E58]>shimmering ice. Perfect for digging through snowy landscapes or creating festive snowmen, the
    -   <&gradient[from=#FF8E58;to=#FF8E58]>Snowdrift Shovel is a versatile tool that magically accelerates your digging speed.
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>After equips apply <&gradient[from=#FF8E58;to=#FF8E58]>Night Vision & Water Breathing<&gradient[from=#FF8E58;to=#FF8E58]>
    - <&gradient[from=#FF8E58;to=#FF8E58]>Skill Cooldown: <&gradient[from=#FF8E58;to=#FF8E58]>30 minutes
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>After mined <&gradient[from=#FF8E58;to=#FF8E58]>DIRT<&gradient[from=#FF8E58;to=#FF8E58]> regenerates your hunger by one point
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>When <&gradient[from=#FF8E58;to=#FF8E58]>right-clicks<&gradient[from=#FF8E58;to=#FF8E58]> apply explosion
    - <empty>
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>+81% Mining Efficiency<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>+96% Block Break Speed<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#C4FFB4;to=#FF8E58]><&l>Christmas Crate 2024
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#C4FFB4;to=#FF8E58]>Winter Spirit
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#C4FFB4;to=#FF8E58]>Mythical
    - <&8><&m><&l>==============================
    - <&8><&l>▶ 【<&6>Not advisable for putting vanilla enchants or custom enchants<&8><&l>】

christmas_shovelEvents:
    type: world
    debug: false
    events:
      on player right clicks block with:christmas_shovel:
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>You can't use a skill at spawn!"
        - determine cancelled
      - if <player.has_flag[christmas_shovel_blindness]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[christmas_shovel_blindness].from_now.formatted>"
        - determine cancelled
      - define at <player.location.add[0,3,0]>
      - explode power:10 <[at]> breakblocks
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:10 quantity:10000
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used EXPLOSION skill to for mining"
      - flag player christmas_shovel_blindness expire:1m
      - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:10

      on player breaks block with:christmas_shovel:
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:1.5 quantity:150

      on player breaks dirt with:christmas_shovel:
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:1.5 quantity:500
      - feed <player> amount:1

      after player holds item item:christmas_shovel:
      - define player <player.name>
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>You can't use a skill at spawn!"
        - determine cancelled
      - if <player.has_flag[christmas_shovel_effect]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>Teleport is cooldown: <player.flag_expiration[christmas_shovel_effect].from_now.formatted>"
         - determine cancelled
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>Applied Increase Damage for 5 minutes!"
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:1.5 quantity:500
      - cast water_breathing duration:1h
      - cast night_vision duration:1h
      - flag player christmas_shovel_effect expire:3om