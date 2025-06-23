leviathan_pickaxe:
    type: item
    material: netherite_pickaxe
    display name: <&gradient[from=#CF741C;to=#085FD4]>⚕ Leviathan’s Harvest ⚕
    enchantments:
    - fortune:4
    - efficiency: 10
    mechanisms:
         unbreakable: true
         custom_model_data: 1007
         attribute_modifiers:
             player_mining_efficiency:
                 1:
                     operation: add_scalar
                     amount: 0.80
                     slot: hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
             player_block_break_speed:
                 1:
                     operation: add_scalar
                     amount: 0.50
                     slot: hand
                     id: 1af08d70-7aa1-45a4-bbbe-7dc0235416cb
    lore:
    - <empty>
    -   <&gradient[from=#085FD4;to=#085FD4]>A pickaxe that can carve through solid stone with ease,
    -   <&gradient[from=#085FD4;to=#085FD4]>its design inspired by the sharp spines of the Leviathan.
    - <empty>
    - <&gradient[from=#085FD4;to=#085FD4]>Passive: <&gradient[from=#085FD4;to=#085FD4]>SQUID INK
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>When held gain <&gradient[from=#085FD4;to=#085FD4]>Night Vision <&gradient[from=#085FD4;to=#085FD4]>and <&gradient[from=#085FD4;to=#085FD4]>Water Breathing <&gradient[from=#085FD4;to=#085FD4]>for 3 hours
    - <&gradient[from=#085FD4;to=#085FD4]>Cooldown: <&gradient[from=#085FD4;to=#085FD4]>1 hour
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>When <&gradient[from=#085FD4;to=#085FD4]>right-clicks <&gradient[from=#085FD4;to=#085FD4]>explode blocks with power of 20
    - <&gradient[from=#085FD4;to=#085FD4]>Cooldown: <&gradient[from=#085FD4;to=#085FD4]>10 minutes
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>When break<&gradient[from=#085FD4;to=#085FD4]>STONE <&gradient[from=#085FD4;to=#085FD4]>regenerates user hunger by one point
    - <empty>
    - <&8><&l>【<&r><&b><&lc>+80% PLAYER_MINING_EFFICIENCY<&8><&rc><&l>】
    - <&8><&l>【<&r><&b><&lc>+50% Block Break Speed<&8><&rc><&l>】
    - <&8><&l>【<&r><&gradient[from=#085FD4;to=#085FD4]>+Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Leviathan Collection Set ⚕
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Mythical
    - <&8><&m><&l>==============================
    - <&8><&l>▶ 【<&6>Not advisable for putting vanilla enchants or custom enchants<&8><&l>】

leviathan_pickaxeEvents:
    type: world
    debug: false
    events:
      on player breaks block with:leviathan_pickaxe:
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500

      on player breaks end_stone with:leviathan_pickaxe:
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      - feed <player> 1 amount:1

      on player right clicks block with:leviathan_pickaxe:
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        - determine cancelled
      - if <player.has_flag[leviathan_pickaxe.explosion]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Explosion Skill is still on cooldown: <player.flag_expiration[leviathan_pickaxe.explosion].from_now.formatted>"
         - determine cancelled
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      - playsound at:<player.location> sound:block_bell_use volume:1
      - explode <player.location> power:20 breakblocks
      - flag player leviathan_pickaxe.explosion expire:10m

      after player holds item item:leviathan_pickaxe:
      - define player <player.name>
      - if <player.has_flag[leviathan_pickaxe_effect]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Night Vision and Water Breathing is still on cooldown: <player.flag_expiration[leviathan_pickaxe_effect].from_now.formatted>"
         - determine cancelled
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Night Vision & Water Breathing for 30 minutes!"
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      - playsound <player.location> sound:AMBIENT_UNDERWATER_ENTER volume:10 pitch:3
      - cast water_breathing amplifier:10 duration:1h
      - cast night_vision duration:1h
      - flag player leviathan_pickaxe_effect expire:30m