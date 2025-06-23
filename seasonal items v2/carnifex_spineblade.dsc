carnifex_spineblade:
    type: item
    material: netherite_sword
    display name: <&gradient[from=#AE1943;to=#A4415D]>•∼• Carnifex Spineblade •∼•
    enchantments:
    - looting:4
    mechanisms:
         unbreakable: true
         custom_model_data: 1342
         attribute_modifiers:
             generic_attack_damage:
                 1:
                     operation: add_number
                     amount: 9.5
                     slot: hand
                     id: c9d3a8ef-c51d-4d64-b8aa-293310d99227
             generic_attack_speed:
                 1:
                     operation: add_scalar
                     amount: 0.65
                     slot: hand
                     id: 72cb8226-2d26-450b-add8-1bc4c93d75cb
    lore:
    - <empty>
    -   <&gradient[from=#A4415D;to=#A4415D]>Forged from a titan<&sq>s spine, this jagged blade tears through flesh
    -   <&gradient[from=#A4415D;to=#A4415D]>with brutal precision. The Spineblade<&sq>s bone-like edge delivers
    -   <&gradient[from=#A4415D;to=#A4415D]>savage, unrelenting strikes.
    - <empty>
    - <&8><&l>▶ <&gradient[from=#A4415D;to=#A4415D]>When <&f>left-clicks <&gradient[from=#A4415D;to=#A4415D]>apply particle on target
    - <&gradient[from=#A4415D;to=#A4415D]>Particle: <&f>Snowflakes
    - <empty>
    - <&8><&l>▶ <&gradient[from=#A4415D;to=#A4415D]>When <&f>left-clicks <&gradient[from=#A4415D;to=#A4415D]>apply <&f>Lightning <&gradient[from=#A4415D;to=#A4415D]>on target
    - <empty>
    - <&8><&l>▶ <&gradient[from=#A4415D;to=#A4415D]>After equips gain <&f>Vanish <&gradient[from=#A4415D;to=#A4415D]>for 3 seconds
    - <&8><&l>▶ <&gradient[from=#A4415D;to=#A4415D]>and apply <&f>Darkness <&gradient[from=#A4415D;to=#A4415D]>on surroundings
    - <&gradient[from=#A4415D;to=#A4415D]>Effect Cooldown: <&f>30 seconds
    - <empty>
    - <&8><&l>▶ <&gradient[from=#A4415D;to=#A4415D]>When <&f>right-clicks <&gradient[from=#A4415D;to=#A4415D]>apply FREEZE & EXPLOSION on surroundings
    - <&gradient[from=#A4415D;to=#A4415D]>Skill Cooldown: <&f>1 minute
    - <empty>
    - <&8><&l>【<&gradient[from=#A4415D;to=#A4415D]>+9.5 Attack Damage<&8><&l>】
    - <&8><&l>【<&gradient[from=#A4415D;to=#A4415D]>+65% Attack Speed<&8><&l>】
    - <&8><&l>【<&gradient[from=#A4415D;to=#A4415D]>+35% Critical Chance<&8><&l>】
    - <&8><&l>【<&gradient[from=#A4415D;to=#A4415D]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#D2BE92;to=#78796B]><&l>⛏️ Magbungkal Crate ⛏️
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#92CFD2;to=#AB9D65]>Autumn Blossom
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Legendary
    - <&8><&m><&l>==============================

carnifex_spineblade_events:
    type: world
    debug: false
    events:
        on entity damaged by player with:carnifex_spineblade:
        - playeffect effect:DUST_COLOR_TRANSITION at:<context.entity.location> special_data:1.2|<&gradient[from=#A4415D;to=#A4415D]>|<&f> offset:1.5 quantity:500
        - strike <context.entity.location>
        - if <context.was_critical>:
            - determine <context.damage.mul[2.0]>

        on player right clicks entity with:carnifex_spineblade:
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
          - determine cancelled
        - define item <context.item>
        - define carnifex_spineblade <item[carnifex_spineblade]>
        - define player.target <context.entity>
        #   - define player <[player.target].name>
        - if <[item]> == <[carnifex_spineblade]>:
            # - if <player.has_flag[carnifex_spineblade_blindness]>:
            #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[carnifex_spineblade_blindness].from_now.formatted>"
            #     - determine cancelled
            # #  - define at <player.target.location.add[0,3,0]>
            # - explode power:10 <context.entity.location> fire breakblocks
            # - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
            # - hurt 50 <player.location.find_entities[player].within[20]>
            # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#A4415D;to=#A4415D]>|<&f> offset:5.5 quantity:5000
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
            # - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
            # - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
            # - flag player carnifex_spineblade_blindness expire:1m
            - if <player.has_flag[carnifex_spineblade_blindness]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[carnifex_spineblade_blindness].from_now.formatted>"
            - else:
                #  - define at <player.target.location.add[0,3,0]>
                - explode power:10 <context.entity.location> fire breakblocks
                - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
                - hurt 50 <player.location.find_entities[player].within[20]>
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#A4415D;to=#A4415D]>|<&f> offset:5.5 quantity:5000
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
                - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
                - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
                - flag player carnifex_spineblade_blindness expire:1m

        after player holds item item:carnifex_spineblade:
        # - define player <player.name>
        # - if <player.location.in_region[spawn5]>:
        #   - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        #   - determine cancelled
        # - if <player.has_flag[carnifex_spineblade_effect]>:
        #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[carnifex_spineblade_effect].from_now.formatted>"
        #     - determine cancelled
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#A4415D;to=#A4415D]>|<&f> offset:1.5 quantity:500
        # - cast darkness duration:5s <player.location.find_entities[player].within[20]>
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - flag player carnifex_spineblade_effect expire:30s
        # - wait 3
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#A4415D;to=#A4415D]>|<&f> offset:2.5 quantity:1000
        - define player <player.name>
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        - else:
            - if <player.has_flag[carnifex_spineblade_effect]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[carnifex_spineblade_effect].from_now.formatted>"
            - else:
                - flag player carnifex_spineblade_effect expire:30s
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#A4415D;to=#A4415D]>|<&f> offset:1.5 quantity:500
                - cast darkness duration:5s <player.location.find_entities[player].within[20]>
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> on -s"
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - wait 3
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> off -s"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#A4415D;to=#A4415D]>|<&f> offset:2.5 quantity:1000