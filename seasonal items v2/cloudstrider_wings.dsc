cloudstrider_wings:
    type: item
    material: paper
    display name: <&gradient[from=#0A7068;to=#7FB8B4]>•∼• Cloudstrider Wings •∼•
    # enchantments:
    # - looting:4
    mechanisms:
         unbreakable: true
         custom_model_data: 141416
         attribute_modifiers:
             generic_attack_damage:
                 1:
                     operation: add_number
                     amount: 9.5
                     slot: hand
                     id: 5f8e9cca-740e-418f-bd76-2af7a3edca88
             generic_attack_speed:
                 1:
                     operation: add_scalar
                     amount: 0.65
                     slot: hand
                     id: b5c49e05-aa42-4a6d-b70c-1379713a6bd0
    lore:
    - <empty>
    -   <&gradient[from=#7FB8B4;to=#7FB8B4]>These wings, made from old windmill blades, let you glide with
    -   <&gradient[from=#7FB8B4;to=#7FB8B4]>the wind. Crafted from a forgotten windmill, these wings let
    -   <&gradient[from=#7FB8B4;to=#7FB8B4]>you soar effortlessly through the air.
    - <empty>
    - <&8><&l>▶ <&gradient[from=#7FB8B4;to=#7FB8B4]>When <&f>left-clicks <&gradient[from=#7FB8B4;to=#7FB8B4]>apply particle on target
    - <&gradient[from=#7FB8B4;to=#7FB8B4]>Particle: <&f>Snowflakes
    - <empty>
    - <&8><&l>▶ <&gradient[from=#7FB8B4;to=#7FB8B4]>When <&f>left-clicks <&gradient[from=#7FB8B4;to=#7FB8B4]>apply <&f>Lightning <&gradient[from=#7FB8B4;to=#7FB8B4]>on target
    - <empty>
    - <&8><&l>▶ <&gradient[from=#7FB8B4;to=#7FB8B4]>After equips gain <&f>Vanish <&gradient[from=#7FB8B4;to=#7FB8B4]>for 3 seconds
    - <&8><&l>▶ <&gradient[from=#7FB8B4;to=#7FB8B4]>and apply <&f>Darkness <&gradient[from=#7FB8B4;to=#7FB8B4]>on surroundings
    - <&gradient[from=#7FB8B4;to=#7FB8B4]>Effect Cooldown: <&f>30 seconds
    - <empty>
    - <&8><&l>▶ <&gradient[from=#7FB8B4;to=#7FB8B4]>When <&f>right-clicks <&gradient[from=#7FB8B4;to=#7FB8B4]>apply FREEZE & EXPLOSION on surroundings
    - <&gradient[from=#7FB8B4;to=#7FB8B4]>Skill Cooldown: <&f>1 minute
    - <empty>
    - <&8><&l>【<&gradient[from=#7FB8B4;to=#7FB8B4]>+9.5 Attack Damage<&8><&l>】
    - <&8><&l>【<&gradient[from=#7FB8B4;to=#7FB8B4]>+65% Attack Speed<&8><&l>】
    - <&8><&l>【<&gradient[from=#7FB8B4;to=#7FB8B4]>+35% Critical Chance<&8><&l>】
    - <&8><&l>【<&gradient[from=#7FB8B4;to=#7FB8B4]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#D2BE92;to=#78796B]><&l>⛏️ Magbungkal Crate ⛏️
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#92CFD2;to=#AB9D65]>Autumn Blossom
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Legendary
    - <&8><&m><&l>==============================

cloudstrider_wings_events:
    type: world
    debug: false
    events:
        on entity damaged by player with:cloudstrider_wings:
        - playeffect effect:DUST_COLOR_TRANSITION at:<context.entity.location> special_data:1.2|<&gradient[from=#7FB8B4;to=#7FB8B4]>|<&f> offset:1.5 quantity:500
        - strike <context.entity.location>
        - if <context.was_critical>:
            - determine <context.damage.mul[2.0]>

        on player right clicks entity with:cloudstrider_wings:
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
          - determine cancelled
        - define item <context.item>
        - define cloudstrider_wings <item[cloudstrider_wings]>
        - define player.target <context.entity>
        #   - define player <[player.target].name>
        - if <[item]> == <[cloudstrider_wings]>:
            # - if <player.has_flag[cloudstrider_wings_blindness]>:
            #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[cloudstrider_wings_blindness].from_now.formatted>"
            #     - determine cancelled
            # #  - define at <player.target.location.add[0,3,0]>
            # - explode power:10 <context.entity.location> fire breakblocks
            # - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
            # - hurt 50 <player.location.find_entities[player].within[20]>
            # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#7FB8B4;to=#7FB8B4]>|<&f> offset:5.5 quantity:5000
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
            # - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
            # - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
            # - flag player cloudstrider_wings_blindness expire:1m
            - if <player.has_flag[cloudstrider_wings_blindness]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[cloudstrider_wings_blindness].from_now.formatted>"
            - else:
                #  - define at <player.target.location.add[0,3,0]>
                - explode power:10 <context.entity.location> fire breakblocks
                - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
                - hurt 50 <player.location.find_entities[player].within[20]>
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#7FB8B4;to=#7FB8B4]>|<&f> offset:5.5 quantity:5000
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
                - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
                - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
                - flag player cloudstrider_wings_blindness expire:1m

        after player holds item item:cloudstrider_wings:
        # - define player <player.name>
        # - if <player.location.in_region[spawn5]>:
        #   - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        #   - determine cancelled
        # - if <player.has_flag[cloudstrider_wings_effect]>:
        #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[cloudstrider_wings_effect].from_now.formatted>"
        #     - determine cancelled
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#7FB8B4;to=#7FB8B4]>|<&f> offset:1.5 quantity:500
        # - cast darkness duration:5s <player.location.find_entities[player].within[20]>
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - flag player cloudstrider_wings_effect expire:30s
        # - wait 3
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#7FB8B4;to=#7FB8B4]>|<&f> offset:2.5 quantity:1000
        - define player <player.name>
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        - else:
            - if <player.has_flag[cloudstrider_wings_effect]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[cloudstrider_wings_effect].from_now.formatted>"
            - else:
                - flag player cloudstrider_wings_effect expire:30s
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#7FB8B4;to=#7FB8B4]>|<&f> offset:1.5 quantity:500
                - cast darkness duration:5s <player.location.find_entities[player].within[20]>
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> on -s"
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - wait 3
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> off -s"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#7FB8B4;to=#7FB8B4]>|<&f> offset:2.5 quantity:1000