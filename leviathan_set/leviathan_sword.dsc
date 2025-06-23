leviathan_sword:
    type: item
    material: netherite_sword
    display name: <&gradient[from=#CF741C;to=#085FD4]>⚕ Leviathan's Edge ⚕
    enchantments:
    - looting:4
    - sharpness:10
    mechanisms:
         unbreakable: true
         custom_model_data: 1348
         attribute_modifiers:
             generic_attack_damage:
                 1:
                     operation: add_number
                     amount: 13.5
                     slot: hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
             generic_attack_speed:
                 1:
                     operation: add_scalar
                     amount: 0.75
                     slot: hand
                     id: 1af08d70-7aa1-45a4-bbbe-7dc0235416cb
    lore:
    - <empty>
    -   <&gradient[from=#085FD4;to=#085FD4]>Infused with the strength of the Leviathan,
    -   <&gradient[from=#085FD4;to=#085FD4]>this sword is a symbol of power and mastery over both land and sea,
    -   <&gradient[from=#085FD4;to=#085FD4]>the Leviathan Edge cuts through armor and flesh with unparalleled precision.
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>When <&gradient[from=#085FD4;to=#085FD4]>left-clicks <&gradient[from=#085FD4;to=#085FD4]>apply LIGHTNING and particle to target
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>SQUID INK
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>After equips increase <&gradient[from=#085FD4;to=#085FD4]>Damage <&gradient[from=#085FD4;to=#085FD4]>for 5 minutes
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>10 minutes
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>After equips apply <&gradient[from=#085FD4;to=#085FD4]>LONG DASH<&gradient[from=#085FD4;to=#085FD4]>
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>15 seconds
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>After equips apply <&gradient[from=#085FD4;to=#085FD4]>STRIKES & EXPLOSIONS
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>1 minute
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>When <&gradient[from=#085FD4;to=#085FD4]>right-clicks <&gradient[from=#085FD4;to=#085FD4]>Absorb player target hearts to heal user<&gradient[from=#085FD4;to=#085FD4]>
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>3 minutes
    - <empty>
    - <&8><&l>【<&r><&b><&lc>+13.5 GENERIC_ATTACK_DAMAGE<&8><&rc><&l>】
    - <&8><&l>【<&r><&b><&lc>+75% GENERIC_ATTACK_SPEED<&8><&rc><&l>】
    - <&8><&l>【<&r><&b><&lc>+50% CRITICAL_CHANCE<&8><&rc><&l>】
    - <&8><&l>【<&r><&gradient[from=#085FD4;to=#085FD4]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#CF741C;to=#085FD4]><&l>⚕ Leviathan Collection Set ⚕
    - <&8><&l>▶ <&r><&gradient[from=#085FD4;to=#085FD4]>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Mythical
    - <&8><&m><&l>==============================
    - <&8><&l>▶ 【<&6>Not advisable for putting vanilla enchants or custom enchants<&8><&l>】

leviathan_swordEvents:
    type: world
    debug: false
    events:
      on entity damaged by player with:leviathan_sword:
      - playeffect effect:squid_ink at:<context.entity.location> data:1 offset:1.5 quantity:500
      - strike <context.entity.location>
      - hurt 30
      - if <context.was_critical>:
         - determine <context.damage.mul[5.0]>

      on player right clicks entity with:leviathan_sword:
      - define item <context.item>
      - define leviathan_sword <item[leviathan_sword]>
      - define player <player>
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You can't use a skill at spawn!"
        - determine cancelled
      - if <[item]> == <[leviathan_sword]>:
         - if <player.has_flag[leviathan_sword_blindness]>:
            - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You can use this skill again after <player.flag_expiration[leviathan_sword_blindness].from_now.formatted>"
            - determine cancelled
      - hurt <context.entity> 10
      - playeffect effect:trial_spawner_detection_ominous at:<player.location> data:1 offset:3.0 quantity:500
      - wait 0.2s
      - hurt <context.entity> 30
      - playeffect effect:trial_spawner_detection_ominous at:<player.location> data:1 offset:3.0 quantity:500
      - heal <player>
      - wait 0.5s
      - hurt <context.entity> 60
      - playeffect effect:trial_spawner_detection_ominous at:<player.location> data:1 offset:3.0 quantity:500
      - heal <player>
      - wait 1s
      - hurt <context.entity> 100
      - playeffect effect:trial_spawner_detection_ominous at:<player.location> data:1 offset:3.0 quantity:500
      - heal <player>
      - flag player leviathan_sword_blindness expire:3m
    
      after player holds item item:leviathan_sword:
      - define player <player.name>
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You can't use a skill at spawn!"
        - determine cancelled
      - if <player.has_flag[leviathan_sword_effect]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You are tired!: <player.flag_expiration[leviathan_sword_effect].from_now.formatted>"
         - determine cancelled
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>Applied Increase Damage for 5 minutes!"
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      - cast increase_damage duration:5m
      - playeffect at:<player.location> effect:TRIAL_SPAWNER_DETECT_PLAYER_OMINOUS data:1 offset:3.0 quantity:500
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      - cast increase_damage duration:5m
      - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
      - adjust <player> velocity:<player.location.forward[20].sub[<player.location>]>
      - flag player leviathan_sword_effect expire:15s
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You teleported!"
      - playeffect at:<player.location> effect:TRIAL_SPAWNER_DETECT_PLAYER_OMINOUS data:1 offset:3.0 quantity:500
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      # Passive for strike - This is only for testing @akyyaky
      - if <player.has_flag[leviathan_sword_strikes]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Strikes are on cooldown: <player.flag_expiration[leviathan_sword_strikes].from_now.formatted>"
        - determine cancelled
      - strike <player.location.forward_flat[10]>
      - strike <player.location.add[0,0,3]>
      - strike <player.location.add[0,0,-3]>
      - explode power:2 breakblocks fire
      - wait 1s
      - strike <player.location.forward_flat[5]>
      - strike <player.location.add[0,0,5]>
      - strike <player.location.add[0,0,-5]>
      - explode power:6 breakblocks fire
      - wait 1s
      - strike <player.location.forward_flat[-5]>
      - strike <player.location.add[-3,0,0]>
      - explode power:10 breakblocks fire
      - wait 1s
      - strike <player.location.forward_flat[-10]>
      - strike <player.location.add[3,0,0]>
      - explode power:15 breakblocks fire
      - flag player leviathan_sword_strikes expire:1m