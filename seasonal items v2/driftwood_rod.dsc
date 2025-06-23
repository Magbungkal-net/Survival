driftwood_fishing_rod:
    type: item
    material: fishing_rod
    display name: <&gradient[from=#483A1C;to=#675E4A]>•∼• Driftwood Fishing Rod •∼•
    enchantments:
    - looting:4
    mechanisms:
         unbreakable: true
         custom_model_data: 1414112
         attribute_modifiers:
             generic_attack_damage:
                 1:
                     operation: add_number
                     amount: 9.5
                     slot: hand
                     id: 41c3644b-c523-4f72-bd71-485dc71980d5
             generic_attack_speed:
                 1:
                     operation: add_scalar
                     amount: 0.65
                     slot: hand
                     id: 978e6fe6-8d52-4858-b8cf-721f4a858c14
    lore:
    - <empty>
    -   <&gradient[from=#675E4A;to=#675E4A]>Crafted from weathered driftwood, this rod is perfect for
    -   <&gradient[from=#675E4A;to=#675E4A]>peaceful fishing. A sturdy driftwood rod that lets you
    -   <&gradient[from=#675E4A;to=#675E4A]>fish with ease and patience.
    - <empty>
    - <&8><&l>▶ <&gradient[from=#675E4A;to=#675E4A]>When <&f>left-clicks <&gradient[from=#675E4A;to=#675E4A]>apply particle on target
    - <&gradient[from=#675E4A;to=#675E4A]>Particle: <&f>Snowflakes
    - <empty>
    - <&8><&l>▶ <&gradient[from=#675E4A;to=#675E4A]>When <&f>left-clicks <&gradient[from=#675E4A;to=#675E4A]>apply <&f>Lightning <&gradient[from=#675E4A;to=#675E4A]>on target
    - <empty>
    - <&8><&l>▶ <&gradient[from=#675E4A;to=#675E4A]>After equips gain <&f>Vanish <&gradient[from=#675E4A;to=#675E4A]>for 3 seconds
    - <&8><&l>▶ <&gradient[from=#675E4A;to=#675E4A]>and apply <&f>Darkness <&gradient[from=#675E4A;to=#675E4A]>on surroundings
    - <&gradient[from=#675E4A;to=#675E4A]>Effect Cooldown: <&f>30 seconds
    - <empty>
    - <&8><&l>▶ <&gradient[from=#675E4A;to=#675E4A]>When <&f>right-clicks <&gradient[from=#675E4A;to=#675E4A]>apply FREEZE & EXPLOSION on surroundings
    - <&gradient[from=#675E4A;to=#675E4A]>Skill Cooldown: <&f>1 minute
    - <empty>
    - <&8><&l>【<&gradient[from=#675E4A;to=#675E4A]>+9.5 Attack Damage<&8><&l>】
    - <&8><&l>【<&gradient[from=#675E4A;to=#675E4A]>+65% Attack Speed<&8><&l>】
    - <&8><&l>【<&gradient[from=#675E4A;to=#675E4A]>+35% Critical Chance<&8><&l>】
    - <&8><&l>【<&gradient[from=#675E4A;to=#675E4A]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#D2BE92;to=#78796B]><&l>⛏️ Magbungkal Crate ⛏️
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#92CFD2;to=#AB9D65]>Autumn Blossom
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#92CFD2;to=#AB9D65]>Legendary
    - <&8><&m><&l>==============================

driftwood_fishing_rod_events:
    type: world
    debug: false
    events:
        on entity damaged by player with:driftwood_fishing_rod:
        - playeffect effect:DUST_COLOR_TRANSITION at:<context.entity.location> special_data:1.2|<&gradient[from=#675E4A;to=#675E4A]>|<&f> offset:1.5 quantity:500
        - strike <context.entity.location>
        - if <context.was_critical>:
            - determine <context.damage.mul[2.0]>

        on player right clicks entity with:driftwood_fishing_rod:
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
          - determine cancelled
        - define item <context.item>
        - define driftwood_fishing_rod <item[driftwood_fishing_rod]>
        - define player.target <context.entity>
        #   - define player <[player.target].name>
        - if <[item]> == <[driftwood_fishing_rod]>:
            # - if <player.has_flag[driftwood_fishing_rod_blindness]>:
            #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[driftwood_fishing_rod_blindness].from_now.formatted>"
            #     - determine cancelled
            # #  - define at <player.target.location.add[0,3,0]>
            # - explode power:10 <context.entity.location> fire breakblocks
            # - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
            # - hurt 50 <player.location.find_entities[player].within[20]>
            # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#675E4A;to=#675E4A]>|<&f> offset:5.5 quantity:5000
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
            # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
            # - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
            # - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
            # - flag player driftwood_fishing_rod_blindness expire:1m
            - if <player.has_flag[driftwood_fishing_rod_blindness]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can use this skill again after <player.flag_expiration[driftwood_fishing_rod_blindness].from_now.formatted>"
            - else:
                #  - define at <player.target.location.add[0,3,0]>
                - explode power:10 <context.entity.location> fire breakblocks
                - adjust <player.location.find_entities[player].within[20]> freeze_duration:30
                - hurt 50 <player.location.find_entities[player].within[20]>
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#675E4A;to=#675E4A]>|<&f> offset:5.5 quantity:5000
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You used FREEZE & EXPLOSION skill to your surroundings"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You have been FREEZED by Aurora's Grace user!" targets:<player.target>
                - playsound <player.location> sound:AMBIENT_BASALT_DELTAS_MOOD volume:10 pitch:3
                - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:10 pitch:3
                - flag player driftwood_fishing_rod_blindness expire:1m

        after player holds item item:driftwood_fishing_rod:
        # - define player <player.name>
        # - if <player.location.in_region[spawn5]>:
        #   - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        #   - determine cancelled
        # - if <player.has_flag[driftwood_fishing_rod_effect]>:
        #     - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[driftwood_fishing_rod_effect].from_now.formatted>"
        #     - determine cancelled
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#675E4A;to=#675E4A]>|<&f> offset:1.5 quantity:500
        # - cast darkness duration:5s <player.location.find_entities[player].within[20]>
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - flag player driftwood_fishing_rod_effect expire:30s
        # - wait 3
        # - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
        # - execute as_server "vanish <[player]>"
        # - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
        # - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#675E4A;to=#675E4A]>|<&f> offset:2.5 quantity:1000
        - define player <player.name>
        - if <player.location.in_region[spawn5]>:
          - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You can't use a skill at spawn!"
        - else:
            - if <player.has_flag[driftwood_fishing_rod_effect]>:
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Vanish is still on cooldown: <player.flag_expiration[driftwood_fishing_rod_effect].from_now.formatted>"
            - else:
                - flag player driftwood_fishing_rod_effect expire:30s
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Applied Vanish for 5 seconds!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#675E4A;to=#675E4A]>|<&f> offset:1.5 quantity:500
                - cast darkness duration:5s <player.location.find_entities[player].within[20]>
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> on -s"
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - wait 3
                - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
                - execute as_server "vanish <[player]> off -s"
                - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>You became visibile, be aware!"
                - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&gradient[from=#675E4A;to=#675E4A]>|<&f> offset:2.5 quantity:1000