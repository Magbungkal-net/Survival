runic_rapture:
    type: item
    material: netherite_sword
    display name: <&gradient[from=#373215;to=#0D6E5F]>•∼• Runic Rapture •∼•
    enchantments:
    - looting:4
    mechanisms:
         unbreakable: true
         custom_model_data: 1343
         attribute_modifiers:
             generic_attack_damage:
                 1:
                     operation: add_number
                     amount: 9.5
                     slot: hand
                     id: 3a928201-96de-43b0-a4c2-e1908e16d815
             generic_attack_speed:
                 1:
                     operation: add_scalar
                     amount: 0.65
                     slot: hand
                     id: 64254909-1ae4-4f67-8567-5ac71758a05a
    lore:
    - <empty>
    -   <&gradient[from=#0D6E5F;to=#0D6E5F]>Engraved with ancient runes, this sword channels elemental magic
    -   <&gradient[from=#0D6E5F;to=#0D6E5F]>with every swing. The Runic Rapture unleashes destructive energy,
    -   <&gradient[from=#0D6E5F;to=#0D6E5F]>from fire to ice, with each strike.
    - <empty>
    - <&8><&l>▶ <&gradient[from=#0D6E5F;to=#0D6E5F]>When <&f>left-clicks <&gradient[from=#0D6E5F;to=#0D6E5F]>apply particle on target
    - <&gradient[from=#0D6E5F;to=#0D6E5F]>Particle: <&f>Snowflakes
    - <empty>
    - <&8><&l>▶ <&gradient[from=#0D6E5F;to=#0D6E5F]>When <&f>left-clicks <&gradient[from=#0D6E5F;to=#0D6E5F]>apply <&f>Lightning <&gradient[from=#0D6E5F;to=#0D6E5F]>on target
    - <empty>
    - <&8><&l>▶ <&gradient[from=#0D6E5F;to=#0D6E5F]>After equips gain <&f>Vanish <&gradient[from=#0D6E5F;to=#0D6E5F]>for 3 seconds
    - <&8><&l>▶ <&gradient[from=#0D6E5F;to=#0D6E5F]>and apply <&f>Darkness <&gradient[from=#0D6E5F;to=#0D6E5F]>on surroundings
    - <&gradient[from=#0D6E5F;to=#0D6E5F]>Effect Cooldown: <&f>30 seconds
    - <empty>
    - <&8><&l>▶ <&gradient[from=#0D6E5F;to=#0D6E5F]>When <&f>right-clicks <&gradient[from=#0D6E5F;to=#0D6E5F]>apply FREEZE & EXPLOSION on surroundings
    - <&gradient[from=#0D6E5F;to=#0D6E5F]>Skill Cooldown: <&f>1 minute
    - <empty>
    - <&8><&l>【<&gradient[from=#0D6E5F;to=#0D6E5F]>+9.5 Attack Damage<&8><&l>】
    - <&8><&l>【<&gradient[from=#0D6E5F;to=#0D6E5F]>+65% Attack Speed<&8><&l>】
    - <&8><&l>【<&gradient[from=#0D6E5F;to=#0D6E5F]>+35% Critical Chance<&8><&l>】
    - <&8><&l>【<&gradient[from=#0D6E5F;to=#0D6E5F]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#D2BE92;to=#78796B]><&l>⛏️ Magbungkal Crate ⛏️
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#92CFD2;to=#AB9D65]>Autumn Blossom
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Legendary
    - <&8><&m><&l>==============================

runic_rapture_events:
    type: world
    debug: false
    events:
        on entity damaged by player with:runic_rapture:
        - playeffect effect:DUST_COLOR_TRANSITION at:<context.entity.location> special_data:1.2|<&gradient[from=#0D6E5F;to=#0D6E5F]>|<&f> offset:1.5 quantity:500
        - strike <context.entity.location>
        - if <context.was_critical>:
            - determine <context.damage.mul[2.0]>

        on player right clicks entity with:runic_rapture:
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
          - determine cancelled
        - define item <context.item>
        - define runic_rapture <item[runic_rapture]>
        - define player.target <context.entity>
        #   - define player <[player.target].name>
        - if <[item]> == <[runic_rapture]>:
            # - if <player.has_flag[runic_rapture_blindness]>:
            #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[runic_rapture_blindness].from_now.formatted>"
            #     - determine cancelled
            # #  - define at <player.target.location.add[0,3,0]>
            # - explode power:10 <context.entity.location> fire breakblocks
            # - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
            # - hurt 50 <player.location.find_entities[player].within[20]>
            # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#0D6E5F;to=#0D6E5F]>|<&f> offset:5.5 quantity:5000
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
            # - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
            # - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
            # - flag player runic_rapture_blindness expire:1m
            - if <player.has_flag[runic_rapture_blindness]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[runic_rapture_blindness].from_now.formatted>"
            - else:
                #  - define at <player.target.location.add[0,3,0]>
                - explode power:10 <context.entity.location> fire breakblocks
                - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
                - hurt 50 <player.location.find_entities[player].within[20]>
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#0D6E5F;to=#0D6E5F]>|<&f> offset:5.5 quantity:5000
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
                - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
                - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
                - flag player runic_rapture_blindness expire:1m

        after player holds item item:runic_rapture:
        # - define player <player.name>
        # - if <player.location.in_region[spawn5]>:
        #   - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        #   - determine cancelled
        # - if <player.has_flag[runic_rapture_effect]>:
        #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[runic_rapture_effect].from_now.formatted>"
        #     - determine cancelled
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#0D6E5F;to=#0D6E5F]>|<&f> offset:1.5 quantity:500
        # - cast darkness duration:5s <player.location.find_entities[player].within[20]>
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - flag player runic_rapture_effect expire:30s
        # - wait 3
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#0D6E5F;to=#0D6E5F]>|<&f> offset:2.5 quantity:1000
        - define player <player.name>
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        - else:
            - if <player.has_flag[runic_rapture_effect]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[runic_rapture_effect].from_now.formatted>"
            - else:
                - flag player runic_rapture_effect expire:30s
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#0D6E5F;to=#0D6E5F]>|<&f> offset:1.5 quantity:500
                - cast darkness duration:5s <player.location.find_entities[player].within[20]>
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> on -s"
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - wait 3
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> off -s"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#0D6E5F;to=#0D6E5F]>|<&f> offset:2.5 quantity:1000