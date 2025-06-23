uchigatana_sword:
    type: item
    material: netherite_sword
    display name: <&gradient[from=#9B831B;to=#41485D]>•∼• Uchigatana •∼•
    enchantments:
    - looting:4
    mechanisms:
         unbreakable: true
         custom_model_data: 1339
         attribute_modifiers:
             generic_attack_damage:
                 1:
                     operation: add_number
                     amount: 9.5
                     slot: hand
                     id: e0d6c20d-cc56-46bc-809e-06f9945bba5b
             generic_attack_speed:
                 1:
                     operation: add_scalar
                     amount: 0.65
                     slot: hand
                     id: 73c02c4b-4b95-40b0-a58d-96694f8a2fef
    lore:
    - <empty>
    -   <&gradient[from=#9B831B;to=#9B831B]>This sword excels at swift, slicing attacks, perfect for
    -   <&gradient[from=#9B831B;to=#9B831B]>quick, devastating cuts.The Uchigatana<&sq>s sharp blade
    -   <&gradient[from=#9B831B;to=#9B831B]>allows for fast and deadly strikes.
    - <empty>
    - <&8><&l>▶ <&gradient[from=#9B831B;to=#9B831B]>When <&f>left-clicks <&gradient[from=#9B831B;to=#9B831B]>apply particle on target
    - <&gradient[from=#9B831B;to=#9B831B]>Particle: <&f>Snowflakes
    - <empty>
    - <&8><&l>▶ <&gradient[from=#9B831B;to=#9B831B]>When <&f>left-clicks <&gradient[from=#9B831B;to=#9B831B]>apply <&f>Lightning <&gradient[from=#9B831B;to=#9B831B]>on target
    - <empty>
    - <&8><&l>▶ <&gradient[from=#9B831B;to=#9B831B]>After equips gain <&f>Vanish <&gradient[from=#9B831B;to=#9B831B]>for 3 seconds
    - <&8><&l>▶ <&gradient[from=#9B831B;to=#9B831B]>and apply <&f>Darkness <&gradient[from=#9B831B;to=#9B831B]>on surroundings
    - <&gradient[from=#9B831B;to=#9B831B]>Effect Cooldown: <&f>30 seconds
    - <empty>
    - <&8><&l>▶ <&gradient[from=#9B831B;to=#9B831B]>When <&f>right-clicks <&gradient[from=#9B831B;to=#9B831B]>apply FREEZE & EXPLOSION on surroundings
    - <&gradient[from=#9B831B;to=#9B831B]>Skill Cooldown: <&f>1 minute
    - <empty>
    - <&8><&l>【<&gradient[from=#9B831B;to=#9B831B]>+9.5 Attack Damage<&8><&l>】
    - <&8><&l>【<&gradient[from=#9B831B;to=#9B831B]>+65% Attack Speed<&8><&l>】
    - <&8><&l>【<&gradient[from=#9B831B;to=#9B831B]>+35% Critical Chance<&8><&l>】
    - <&8><&l>【<&gradient[from=#9B831B;to=#9B831B]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#D2BE92;to=#78796B]><&l>⛏️ Magbungkal Crate ⛏️
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#92CFD2;to=#AB9D65]>Autumn Blossom
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Legendary
    - <&8><&m><&l>==============================

uchigatana_sword_events:
    type: world
    debug: false
    events:
        on entity damaged by player with:uchigatana_sword:
        - playeffect effect:DUST_COLOR_TRANSITION at:<context.entity.location> special_data:1.2|<&gradient[from=#9B831B;to=#9B831B]>|<&f> offset:1.5 quantity:500
        - strike <context.entity.location>
        - if <context.was_critical>:
            - determine <context.damage.mul[2.0]>

        on player right clicks entity with:uchigatana_sword:
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
          - determine cancelled
        - define item <context.item>
        - define uchigatana_sword <item[uchigatana_sword]>
        - define player.target <context.entity>
        #   - define player <[player.target].name>
        - if <[item]> == <[uchigatana_sword]>:
            # - if <player.has_flag[uchigatana_sword_blindness]>:
            #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[uchigatana_sword_blindness].from_now.formatted>"
            #     - determine cancelled
            # #  - define at <player.target.location.add[0,3,0]>
            # - explode power:10 <context.entity.location> fire breakblocks
            # - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
            # - hurt 50 <player.location.find_entities[player].within[20]>
            # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#9B831B;to=#9B831B]>|<&f> offset:5.5 quantity:5000
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
            # - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
            # - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
            # - flag player uchigatana_sword_blindness expire:1m
            - if <player.has_flag[uchigatana_sword_blindness]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[uchigatana_sword_blindness].from_now.formatted>"
            - else:
                #  - define at <player.target.location.add[0,3,0]>
                - explode power:10 <context.entity.location> fire breakblocks
                - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
                - hurt 50 <player.location.find_entities[player].within[20]>
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#9B831B;to=#9B831B]>|<&f> offset:5.5 quantity:5000
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
                - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
                - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
                - flag player uchigatana_sword_blindness expire:1m

        after player holds item item:uchigatana_sword:
        # - define player <player.name>
        # - if <player.location.in_region[spawn5]>:
        #   - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        #   - determine cancelled
        # - if <player.has_flag[uchigatana_sword_effect]>:
        #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[uchigatana_sword_effect].from_now.formatted>"
        #     - determine cancelled
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#9B831B;to=#9B831B]>|<&f> offset:1.5 quantity:500
        # - cast darkness duration:5s <player.location.find_entities[player].within[20]>
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - flag player uchigatana_sword_effect expire:30s
        # - wait 3
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#9B831B;to=#9B831B]>|<&f> offset:2.5 quantity:1000
        - define player <player.name>
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        - else:
            - if <player.has_flag[uchigatana_sword_effect]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[uchigatana_sword_effect].from_now.formatted>"
            - else:
                - flag player uchigatana_sword_effect expire:30s
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#9B831B;to=#9B831B]>|<&f> offset:1.5 quantity:500
                - cast darkness duration:5s <player.location.find_entities[player].within[20]>
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> on -s"
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - wait 3
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> off -s"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#9B831B;to=#9B831B]>|<&f> offset:2.5 quantity:1000