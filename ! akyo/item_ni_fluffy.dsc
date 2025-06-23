wings_ni_fluffy:
    type: item
    material: paper
    display name: <&gradient[from=#62313B;to=#240606]>✣ Phoenix Dracotaur Wings ✣
    mechanisms:
         unbreakable: true
         custom_model_data: 8439202
         attribute_modifiers:
             generic_max_health:
                 1:
                     operation: add_number
                     amount: 20
                     slot: off_hand
                     id: 6b911a85-d357-426b-9677-9808be31c376
    lore:
    - <empty>
    -   <&gradient[from=#62313B;to=#62313B]>A captivating fantasy concept that conjures images of majestic,
    -   <&gradient[from=#62313B;to=#62313B]>glowing with a vibrant blue hue, symbolizing freedom and the power of the sky.
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#62313B;to=#62313B]>When equips apply<&gradient[from=#240606;to=#240606]> INCREASE DAMAGE<&gradient[from=#62313B;to=#62313B]>
    - <&gradient[from=#62313B;to=#62313B]>Skill Cooldown: <&gradient[from=#240606;to=#240606]>30 seconds
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#62313B;to=#62313B]>When equips apply<&gradient[from=#240606;to=#240606]> SATURATION<&gradient[from=#62313B;to=#62313B]>
    - <&gradient[from=#62313B;to=#62313B]>Skill Cooldown: <&gradient[from=#240606;to=#240606]>30 seconds
    - <empty>
    - <&8><&l>▶ <&r><&gradient[from=#62313B;to=#62313B]>When equips apply<&gradient[from=#240606;to=#240606]> SPEED<&gradient[from=#62313B;to=#62313B]>
    - <&gradient[from=#62313B;to=#62313B]>Skill Cooldown: <&gradient[from=#240606;to=#240606]>30 seconds
    - <&8><&l>【<&r><&gradient[from=#240606;to=#240606]>+20 Health<&8><&l>】
    - <&8><&l>【<&r><&gradient[from=#240606;to=#240606]>Unbreakable<&8><&l>】

wings_ni_fluffyEvents:
    type: world
    debug: true
    events:
      after player holds item item:wings_ni_fluffy:
      - define player <player.name>
      - if <player.has_flag[wings_ni_fluffy_strength]>:
         - actionbar "<&8><&l>[<&6><&l>!<&8><&l>] <&f>Effects is still on cooldown: <player.flag_expiration[wings_ni_fluffy_strength].from_now.formatted>"
         - determine cancelled
      - cast increase_damage amplifier:5 <player> duration:1h
      - cast saturation amplifier:5 <player> duration:1h
      - cast speed amplifier:5 <player> duration:1h
      - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:1.2|<&b>|<&f> offset:10 quantity:10000
      - flag player wings_ni_fluffy_strength expire:30s