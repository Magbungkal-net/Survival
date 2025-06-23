pixies_serenade_wings:
    type: item
    material: paper
    display name: <&gradient[from=#3A71C8;to=#6091DE]>•∼• Pixie's Serenade Wings •∼•
    # enchantments:
    # - looting:4
    mechanisms:
         unbreakable: true
         custom_model_data: 1144
         attribute_modifiers:
             generic_attack_damage:
                 1:
                     operation: add_number
                     amount: 9.5
                     slot: hand
                     id: ddb02899-1a81-4fd1-b19b-21705e147b5d
             generic_attack_speed:
                 1:
                     operation: add_scalar
                     amount: 0.65
                     slot: hand
                     id: affeb6c6-f2fc-4f21-a390-8b75e2da4543
    lore:
    - <empty>
    -   <&gradient[from=#6091DE;to=#6091DE]>These shimmering wings let you glide gracefully, leaving a soft,
    -   <&gradient[from=#6091DE;to=#6091DE]>magical trail behind. Light as air, these wings allow effortless
    -   <&gradient[from=#6091DE;to=#6091DE]>flight, accompanied by a soft, ethereal melody.
    - <empty>
    - <&8><&l>▶ <&gradient[from=#6091DE;to=#6091DE]>When <&f>left-clicks <&gradient[from=#6091DE;to=#6091DE]>apply particle on target
    - <&gradient[from=#6091DE;to=#6091DE]>Particle: <&f>Snowflakes
    - <empty>
    - <&8><&l>▶ <&gradient[from=#6091DE;to=#6091DE]>When <&f>left-clicks <&gradient[from=#6091DE;to=#6091DE]>apply <&f>Lightning <&gradient[from=#6091DE;to=#6091DE]>on target
    - <empty>
    - <&8><&l>▶ <&gradient[from=#6091DE;to=#6091DE]>After equips gain <&f>Vanish <&gradient[from=#6091DE;to=#6091DE]>for 3 seconds
    - <&8><&l>▶ <&gradient[from=#6091DE;to=#6091DE]>and apply <&f>Darkness <&gradient[from=#6091DE;to=#6091DE]>on surroundings
    - <&gradient[from=#6091DE;to=#6091DE]>Effect Cooldown: <&f>30 seconds
    - <empty>
    - <&8><&l>▶ <&gradient[from=#6091DE;to=#6091DE]>When <&f>right-clicks <&gradient[from=#6091DE;to=#6091DE]>apply FREEZE & EXPLOSION on surroundings
    - <&gradient[from=#6091DE;to=#6091DE]>Skill Cooldown: <&f>1 minute
    - <empty>
    - <&8><&l>【<&gradient[from=#6091DE;to=#6091DE]>+9.5 Attack Damage<&8><&l>】
    - <&8><&l>【<&gradient[from=#6091DE;to=#6091DE]>+65% Attack Speed<&8><&l>】
    - <&8><&l>【<&gradient[from=#6091DE;to=#6091DE]>+35% Critical Chance<&8><&l>】
    - <&8><&l>【<&gradient[from=#6091DE;to=#6091DE]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#D2BE92;to=#78796B]><&l>⛏️ Magbungkal Crate ⛏️
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#92CFD2;to=#AB9D65]>Autumn Blossom
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Legendary
    - <&8><&m><&l>==============================

pixies_serenade_wings_events:
    type: world
    debug: false
    events:
        on entity damaged by player with:pixies_serenade_wings:
        - playeffect effect:DUST_COLOR_TRANSITION at:<context.entity.location> special_data:1.2|<&gradient[from=#6091DE;to=#6091DE]>|<&f> offset:1.5 quantity:500
        - strike <context.entity.location>
        - if <context.was_critical>:
            - determine <context.damage.mul[2.0]>

        on player right clicks entity with:pixies_serenade_wings:
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
          - determine cancelled
        - define item <context.item>
        - define pixies_serenade_wings <item[pixies_serenade_wings]>
        - define player.target <context.entity>
        #   - define player <[player.target].name>
        - if <[item]> == <[pixies_serenade_wings]>:
            # - if <player.has_flag[pixies_serenade_wings_blindness]>:
            #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[pixies_serenade_wings_blindness].from_now.formatted>"
            #     - determine cancelled
            # #  - define at <player.target.location.add[0,3,0]>
            # - explode power:10 <context.entity.location> fire breakblocks
            # - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
            # - hurt 50 <player.location.find_entities[player].within[20]>
            # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#6091DE;to=#6091DE]>|<&f> offset:5.5 quantity:5000
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
            # - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
            # - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
            # - flag player pixies_serenade_wings_blindness expire:1m
            - if <player.has_flag[pixies_serenade_wings_blindness]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[pixies_serenade_wings_blindness].from_now.formatted>"
            - else:
                #  - define at <player.target.location.add[0,3,0]>
                - explode power:10 <context.entity.location> fire breakblocks
                - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
                - hurt 50 <player.location.find_entities[player].within[20]>
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#6091DE;to=#6091DE]>|<&f> offset:5.5 quantity:5000
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
                - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
                - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
                - flag player pixies_serenade_wings_blindness expire:1m

        after player holds item item:pixies_serenade_wings:
        # - define player <player.name>
        # - if <player.location.in_region[spawn5]>:
        #   - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        #   - determine cancelled
        # - if <player.has_flag[pixies_serenade_wings_effect]>:
        #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[pixies_serenade_wings_effect].from_now.formatted>"
        #     - determine cancelled
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#6091DE;to=#6091DE]>|<&f> offset:1.5 quantity:500
        # - cast darkness duration:5s <player.location.find_entities[player].within[20]>
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - flag player pixies_serenade_wings_effect expire:30s
        # - wait 3
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#6091DE;to=#6091DE]>|<&f> offset:2.5 quantity:1000
        - define player <player.name>
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        - else:
            - if <player.has_flag[pixies_serenade_wings_effect]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[pixies_serenade_wings_effect].from_now.formatted>"
            - else:
                - flag player pixies_serenade_wings_effect expire:30s
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#6091DE;to=#6091DE]>|<&f> offset:1.5 quantity:500
                - cast darkness duration:5s <player.location.find_entities[player].within[20]>
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> on -s"
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - wait 3
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> off -s"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#6091DE;to=#6091DE]>|<&f> offset:2.5 quantity:1000