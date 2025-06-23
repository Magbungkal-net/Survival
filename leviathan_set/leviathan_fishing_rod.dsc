leviathan_fishing_rod:
    type: item
    material: fishing_rod
    display name: <&gradient[from=#CF741C;to=#085FD4]>⚕ Leviathan’s Line ⚕
    enchantments:
    - looting:4
    mechanisms:
         unbreakable: true
         custom_model_data: 1027
         attribute_modifiers:
             generic_luck:
                 1:
                     operation: add_scalar
                     amount: 0.95
                     slot: hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
    lore:
    - <empty>
    -   <&gradient[from=#085FD4;to=#085FD4]> A fishing rod forged from the tendrils of a Leviathan,
    -   <&gradient[from=#085FD4;to=#085FD4]>ble to catch the rarest of fish and even summon the power of the deep.
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>When equips apply<&gradient[from=#085FD4;to=#085FD4]> NIGHT VISION and WATER BREATHING <&gradient[from=#085FD4;to=#085FD4]>
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>30 minutes
    - <empty>
    - <&8><&l>【<&r><&gradient[from=#085FD4;to=#085FD4]>+95% Luck<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#085FD4;to=#085FD4]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Leviathan Collection Set ⚕
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Mythical
    - <&8><&m><&l>==============================
    - <&8><&l>▶ 【<&6>Not advisable for putting vanilla enchants or custom enchants<&8><&l>】

leviathan_fishing_rodEvents:
    type: world
    debug: false
    events:
      after player holds item item:leviathan_fishing_rod:
      - define player <player.name>
      - if <player.has_flag[leviathan_fishing_rod_strength]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Night Vision and Water Breathing is still on cooldown: <player.flag_expiration[leviathan_fishing_rod_strength].from_now.formatted>"
         - determine cancelled
      - cast night_vision amplifier:4 <player> duration:1h
      - cast water_breathing amplifier:4 <player> duration:1h
      - playeffect effect:trial_spawner_detection_ominous at:<player.location> data:1 offset:5.5 quantity:500
      - playsound <player.location> sound:ENTITY_ALLAY_ITEM_TAKEN volume:10 pitch:1
      - flag player leviathan_fishing_rod_strength expire:30m