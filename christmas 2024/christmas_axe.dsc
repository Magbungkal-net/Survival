christmas_axe:
    type: item
    material: netherite_axe
    display name: <&gradient[from=#C4FFB4;to=#FF8E58]>❆ Frostbite Lumberjack ❆
    enchantments:
    - looting:4
    - sharpness:10
    mechanisms:
         unbreakable: true
         custom_model_data: 1075
         attribute_modifiers:
             generic_attack_damage:
                 1:
                     operation: add_number
                     amount: 11.5
                     slot: hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
             generic_attack_speed:
                 1:
                     operation: add_scalar
                     amount: 0.50
                     slot: hand
                     id: 1af08d70-7aa1-45a4-bbbe-7dc0235416cb
    lore:
    - <empty>
    -   <&gradient[from=#FF8E58;to=#FF8E58]>A mighty axe crafted from enchanted icewood, capable of splitting the toughest
    -   <&gradient[from=#FF8E58;to=#FF8E58]>logs with a single swing. Its blade glows with a frosty blue hue, and the handle is adorned with
    -   <&gradient[from=#FF8E58;to=#FF8E58]>shimmering holly leaves, giving it a festive, yet formidable, appearance.
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>Passive: <&gradient[from=#FF8E58;to=#FF8E58]>Winter's Blessing
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>When <&gradient[from=#FF8E58;to=#FF8E58]>left-clicks <&gradient[from=#FF8E58;to=#FF8E58]>apply Froststrike Slash
    - <&gradient[from=#FF8E58;to=#FF8E58]>Skill Cooldown: <&gradient[from=#FF8E58;to=#FF8E58]>15 seconds
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>After equips apply <&gradient[from=#FF8E58;to=#FF8E58]>Teleport<&gradient[from=#FF8E58;to=#FF8E58]>
    - <&gradient[from=#FF8E58;to=#FF8E58]>Skill Cooldown: <&gradient[from=#FF8E58;to=#FF8E58]>3 seconds
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>After equips apply <&gradient[from=#FF8E58;to=#FF8E58]>STRIKES
    - <&gradient[from=#FF8E58;to=#FF8E58]>Skill Cooldown: <&gradient[from=#FF8E58;to=#FF8E58]>1 minute
    - <empty>
    - <&8><&l>▶<&r> <&gradient[from=#FF8E58;to=#FF8E58]>When <&gradient[from=#FF8E58;to=#FF8E58]>right-clicks <&gradient[from=#FF8E58;to=#FF8E58]>apply Reindeer Charge
    - <&gradient[from=#FF8E58;to=#FF8E58]>Skill Cooldown: <&gradient[from=#FF8E58;to=#FF8E58]>3 minutes
    - <empty>
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>+11.5 Attack Damage<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>+50% Attack Speed<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>+30% Critical Chance<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#FF8E58;to=#FF8E58]>Unbreakable<&8><&l>】
    - <empty>
    - <&8><&m><&l>==============================
    - <&8><&l>▶ <&r><&gradient[from=#C4FFB4;to=#FF8E58]><&l>Christmas Crate 2024
    - <&8><&l>▶ <&r><&f>Season V: <&gradient[from=#C4FFB4;to=#FF8E58]>Winter Spirit
    - <&8><&l>▶ <&r><&f>Rarity: <&gradient[from=#C4FFB4;to=#FF8E58]>Mythical
    - <&8><&m><&l>==============================
    - <&8><&l>▶ 【<&6>Not advisable for putting vanilla enchants or custom enchants<&8><&l>】

christmas_axeEvents:
    type: world
    debug: false
    events:
      on entity damaged by player with:christmas_axe:
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:1.5 quantity:150
      - strike <player.location>
      - if <context.was_critical>:
         - determine <context.damage.mul[3.0]>

      on player right clicks entity with:christmas_axe:
      - define item <context.item>
      - define christmas_axe <item[christmas_axe]>
      - define player <player>
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>You can't use a skill at spawn!"
        - determine cancelled
      - if <[item]> == <[christmas_axe]>:
         - if <player.has_flag[christmas_axe_blindness]>:
            - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>You can use this skill again after <player.flag_expiration[christmas_axe_blindness].from_now.formatted>"
            - determine cancelled
         - define at <player.target.location.add[0,3,0]>
         - adjust <player.location.find_entities[player].within[20]> velocity:<location[0,0,10]>
         - wait 1t
         - explode power:50 <[at]> fire breakblocks
         - hurt 30 <player.location.find_entities[player].within[20]>
         - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:10 quantity:10000
         - playsound <player.location> sound:ENTITY_POLAR_BEAR_WARNING volume:10 pitch:3
         - flag player christmas_axe_blindness expire:3m
    
      after player holds item item:christmas_axe:
      - define player <player.name>
      - if <player.location.in_region[spawn5]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>You can't use a skill at spawn!"
        - determine cancelled
      - if <player.has_flag[christmas_axe_effect]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>Teleport is cooldown: <player.flag_expiration[christmas_axe_effect].from_now.formatted>"
         - determine cancelled
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>Applied Increase Damage for 5 minutes!"
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:1.5 quantity:500
      - cast increase_damage duration:5m
      - playsound <player.location> sound:ENTITY_FOX_TELEPORT volume:10 pitch:3
      - teleport <player.location.forward_flat[10]>
      - flag player christmas_axe_effect expire:3s
      - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&r><&gradient[from=#FF8E58;to=#FF8E58]>You teleported!"
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:10 quantity:10000
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&c>|<&a> offset:1.5 quantity:500
      # Passive for strike - This is only for testing @akyyaky
      - if <player.has_flag[christmas_axe_strikes]>:
        - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Strikes are on cooldown: <player.flag_expiration[christmas_axe_strikes].from_now.formatted>"
        - determine cancelled
      - strike <player.location.forward_flat[10]>
      - strike <player.location.add[0,0,3]>
      - strike <player.location.add[0,0,-3]>
      - wait 1s
      - strike <player.location.forward_flat[5]>
      - strike <player.location.add[0,0,5]>
      - strike <player.location.add[0,0,-5]>
      - wait 1s
      - strike <player.location.forward_flat[-5]>
      - strike <player.location.add[-3,0,0]>
      - wait 1s
      - strike <player.location.forward_flat[-10]>
      - strike <player.location.add[3,0,0]>
      - flag player christmas_axe_strikes expire:1m