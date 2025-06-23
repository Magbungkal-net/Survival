leviathan_hoe:
    type: item
    material: netherite_hoe
    display name: <&gradient[from=#CF741C;to=#085FD4]>⚕ Stormrider Hoe ⚕
    enchantments:
    - fortune:4
    - efficiency: 10
    mechanisms:
         unbreakable: true
         custom_model_data: 1033
         attribute_modifiers:
             player_mining_efficiency:
                 1:
                     operation: add_scalar
                     amount: 0.95
                     slot: hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
             player_block_break_speed:
                 1:
                     operation: add_scalar
                     amount: 0.80
                     slot: hand
                     id: 1af08d70-7aa1-45a4-bbbe-7dc0235416cb
    lore:
    - <empty>
    -   <&gradient[from=#085FD4;to=#085FD4]>Created from Leviathan tusks,
    -   <&gradient[from=#085FD4;to=#085FD4]>his hoe empowers crops and can unleash
    -   <&gradient[from=#085FD4;to=#085FD4]>devastating electrical energy.
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>When equips apply<&gradient[from=#085FD4;to=#085FD4]> NIGHT VISION and WATER BREATHING <&gradient[from=#085FD4;to=#085FD4]>
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>30 minutes
    - <empty>
    - <&8><&l>【<&r><&b><&lc>+95% PLAYER_MINING_EFFICIENCY<&8><&rc><&l>】
    - <&8><&l>【<&r><&b><&lc>+80% PLAYER_BREAK_SPEED<&8><&rc><&l>】
    - <&8><&l>【<&r><&gradient[from=#085FD4;to=#085FD4]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Leviathan Collection Set ⚕
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Mythical
    - <&8><&m><&l>==============================
    - <&8><&l>▶ 【<&6>Not advisable for putting vanilla enchants or custom enchants<&8><&l>】

leviathan_hoeEvents:
    type: world
    debug: false
    events:
      after player holds item item:leviathan_hoe:
      - define player <player.name>
      - if <player.has_flag[leviathan_hoe_strength]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Night Vision is still on cooldown: <player.flag_expiration[leviathan_hoe_strength].from_now.formatted>"
         - determine cancelled
      - cast night_vision amplifier:4 <player> duration:1h
      - cast water_breathing amplifier:4 <player> duration:1h
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      - flag player leviathan_hoe_strength expire:30m