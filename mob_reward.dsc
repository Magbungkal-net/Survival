mob_kill_event:
  type: world
  debug: false
  events:
    after player kills entity:
    - ratelimit <player> 5t
    - if <context.entity.entity_type> == player || <context.entity.is_npc||false>:
      - stop
    - define data <script[mob_rewards_list]>
    - define mob <context.entity>
    - if <[data].data_key[excluded].contains[<[mob].entity_type>]>:
      - stop
    # check if entity is a custom entity and if it has a custom prize
    # custom entities must have the flag "custom_entity" and a custom_name
    - if <[mob].has_flag[custom_entity]||false> && <[data].data_key[custom].keys.contains[<[mob].flag[custom_entity]>]>:
      - define money <[data].data_key[custom].get[<[mob].flag[custom_entity]>]>
      - if <player.has_flag[killmsgnot].not>:
        - narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>You earned <&a>₱<[money]> <&f>for killing a <&gradient[from=#7C4751;to=#7C4751]><[<[mob].custom_name||<[mob].translated_name>>]>"
      - money give quantity:<[money]>
      - stop
    - if <[data].data_key[mobs].keys.contains[<[mob].entity_type>]>:
      - define from <[data].data_key[mobs].get[<[mob].entity_type>].get[from]>
      - define to <[data].data_key[mobs].get[<[mob].entity_type>].get[to]>
      - define money <util.random.int[<[from]>].to[<[to]>]>
    - else:
      - define money <util.random.int[<[data].data_key[default].get[from]>].to[<[data].data_key[default].get[to]>]>

    - if <server.has_flag[bonus_drop]> && <[mob].is_monster>:
      - define money <[money].mul[<util.random.int[3].to[5]>]>
    - if <player.has_flag[killmsgnot].not>:
      - narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>You earned <&a>₱<[money]> <&f>for killing a <&gradient[from=#7C4751;to=#7C4751]><[mob].custom_name||<[mob].translated_name>>"
    - money give quantity:<[money]>

KillMsgToggle:
  type: command
  debug: false
  name: mobkillmessage
  description: message toggle
  usage: /mobkillmessage on|off
  script:
  - choose <context.args.get[1]>:
    - case on:
      - if <player.has_flag[killmsgnot]>:
        - flag <player> killmsgnot:!
      - narrate "<&7>Toggled <&a>On <&7>Kill Reward Message"
    - case off:
      - flag <player> mobkillmsgnot
      - narrate "<&7>Toggled <&c>Off <&7>Kill Reward Message"

mob_rewards_list:
  type: data
  default:
    from: 1
    to: 5
  custom:
    custom_flag: 300
  excluded:
  - armor_stand
  - boat
  mobs:
    # monsters
    sheep:
      from: 1
      to: 3
    piglin_brute:
      from: 7
      to: 15
    ravager:
      from: 7
      to: 15
    blaze:
      from: 3
      to: 5
    guardian:
      from: 30
      to: 50
    evoker:
      from: 1
      to: 5
    iron_golem:
      from: 6
      to: 8
    breeze:
      from: 1
      to: 8
    pillager:
      from: 2
      to: 8
    skeleton:
      from: 1
      to: 5
    stray:
      from: 3
      to: 5
    bogged:
      from: 3
      to: 5
    vex:
      from: 3
      to: 5
    vindicator:
      from: 2
      to: 5
    witch:
      from: 1
      to: 5
    wither_skeleton:
      from: 5
      to: 10
    zombie:
      from: 1
      to: 5
    creeper:
      from: 1
      to: 5
    illusioner:
      from: 5
      to: 8
    husk:
      from: 1
      to: 7
    drowned:
      from: 1
      to: 7
    hoglin:
      from: 1
      to: 7
    piglin:
      from: 1
      to: 7
    spider:
      from: 1
      to: 5
    magma_cube:
      from: 15
      to: 30
    cave_spider:
      from: 1
      to: 5