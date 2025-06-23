leviathan_axe:
    type: item
    material: netherite_axe
    display name: <&gradient[from=#CF741C;to=#085FD4]>⚕ Abyssal Splitter ⚕
    enchantments:
    - looting:4
    - sharpness:10
    mechanisms:
         unbreakable: true
         custom_model_data: 1077
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
    -   <&gradient[from=#085FD4;to=#085FD4]>Infused with the power of the abyss, this axe rends through enemies with brutal
    -   <&gradient[from=#085FD4;to=#085FD4]>force, leaving destruction in its wake.
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>When <&gradient[from=#085FD4;to=#085FD4]>left-clicks <&gradient[from=#085FD4;to=#085FD4]>apply LIGHTNING and particle to target
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>squid_ink
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>After equips increase <&gradient[from=#085FD4;to=#085FD4]>Damage <&gradient[from=#085FD4;to=#085FD4]>for 5 minutes
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>10 minutes
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>After equips apply <&gradient[from=#085FD4;to=#085FD4]>Teleport<&gradient[from=#085FD4;to=#085FD4]>
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>3 seconds
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>After equips apply <&gradient[from=#085FD4;to=#085FD4]>STRIKES & EXPLOSIONS
    - <&gradient[from=#085FD4;to=#085FD4]>Skill Cooldown: <&gradient[from=#085FD4;to=#085FD4]>1 minute
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#085FD4;to=#085FD4]>When <&gradient[from=#085FD4;to=#085FD4]>right-clicks <&gradient[from=#085FD4;to=#085FD4]>apply DASH & EXPLOSION to players on surroundings
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

leviathan_axeEvents:
    type: world
    debug: false
    events:
      on entity damaged by player with:leviathan_axe:
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      - strike <player.location>
      - if <context.was_critical>:
         - determine <context.damage.mul[5.0]>

      on player right clicks entity with:leviathan_axe:
      - define item <context.item>
      - define leviathan_axe <item[leviathan_axe]>
      - define player <player>
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You can't use a skill at spawn!"
        - determine cancelled
      - if <[item]> == <[leviathan_axe]>:
         - if <player.has_flag[leviathan_axe_blindness]>:
            - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You can use this skill again after <player.flag_expiration[leviathan_axe_blindness].from_now.formatted>"
            - determine cancelled
         - define at <player.target.location.add[0,3,0]>
         - adjust <player.location.find_entities[player].within[20]> velocity:<location[0,0,10]>
         - wait 1t
         - explode power:50 <[at]> fire breakblocks
         - hurt 30 <player.location.find_entities[player].within[20]>
         - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:100
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&gradient[from=#085FD4;to=#085FD4]>You used EXPLODE your surroundings"
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&gradient[from=#085FD4;to=#085FD4]>You have been EXPLODED by Petzls Glacier user!" targets:<player.target>
         - playsound <player.location> sound:ENTITY_POLAR_BEAR_WARNING volume:10 pitch:3
         - flag player leviathan_axe_blindness expire:3m
    
      after player holds item item:leviathan_axe:
      - define player <player.name>
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You can't use a skill at spawn!"
        - determine cancelled
      - if <player.has_flag[leviathan_axe_effect]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>Teleport is cooldown: <player.flag_expiration[leviathan_axe_effect].from_now.formatted>"
         - determine cancelled
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>Applied Increase Damage for 5 minutes!"
      - playeffect at:<player.location> effect:TRIAL_SPAWNER_DETECT_PLAYER_OMINOUS data:1 offset:3.0 quantity:500
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      - cast increase_damage duration:5m
      - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
      - teleport <player.location.forward_flat[10]>
      - flag player leviathan_axe_effect expire:3s
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#085FD4;to=#085FD4]>You teleported!"
      - playeffect at:<player.location> effect:TRIAL_SPAWNER_DETECT_PLAYER_OMINOUS data:1 offset:1 quantity:50
      - playeffect effect:squid_ink at:<player.location> data:1 offset:1.5 quantity:500
      # Passive for strike - This is only for testing @akyyaky
      - if <player.has_flag[leviathan_axe_strikes]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Strikes are on cooldown: <player.flag_expiration[leviathan_axe_strikes].from_now.formatted>"
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
      - flag player leviathan_axe_strikes expire:1m