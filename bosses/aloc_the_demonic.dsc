alocTheDemonicMech_rewards:
  type: world
  debug: false
  events:
    after mythicmob alocTheDemonicMech killed:
    - if <context.killer.is_player>:
      # Define the killer name
      - define player <context.killer.name>
      - execute as_server "money give <[player]> 7500"
      - experience give 500 player:<[player]>
      - execute as_server "magbungkalcoins give <[player]> 250"
      - execute as_server "a <&4><&l>Áloc the Demonic Mech <&7>was killed: by <&f><[player]>"

alocTheDemonicMech_events:
  type: world
  debug: false
  events:
    after mythicmob alocTheDemonicMech spawns:
    - announce <empty>
    - execute as_server "a <&4><&l>Áloc the Demonic Mech <&7>has spawned in <&l>/warp aloc_boss"
    - announce <empty>
    - define channel 1182512909654438068
    - definemap embed_map:
        author_name: Áloc the Demonic Mech has re-awakened
        description: "# /warp aloc_boss_aloc<n>> Rewards:<n>> **₱7,500**<n>> **500 XP**<n>> **250 Coins**"
        image: https://media.discordapp.net/attachments/1182512909654438068/1385709559125119107/01JJ14119VEJ68XJM4MP05TR5G.png?ex=68570e18&is=6855bc98&hm=3bb6b7e4c2f0399dcb37c81e6d32b16560f743c2d4aa5c474b7216ffe9b62aa9&=&format=webp&quality=lossless&width=1522&height=856
        color: red
    - define embed <discord_embed.with_map[<[embed_map]>]>
    - ~discordmessage id:magbungkal channel:<[channel]> <[embed]>
    after mythicmob alocTheDemonicMech dies:
    - announce <empty>
    - execute as_server "a <&4><&l>Áloc the Demonic Mech <&7>has turned into ashes"
    - announce <empty>

alocTheDemonic_task:
    type: task
    debug: false
    script:
    #   - define x 44
    #   - define z 58
    #   - define y 497
    #   - define spawnaloc_boss s3hub_1,<[x]>,<[y]>,<[z]>
      - wait 5t
      - mythicspawn alocTheDemonicMech <player.location> level:10

# gui for aloc_boss
cmdaloc_boss:
  type: command
  debug: false
  name: aloc_boss
  description: coins shop
  usage: /aloc_boss
  permission: denizen.admin
  script:
  - inventory open destination:aloc_boss_inventory
  - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1

aloc_boss_inventory:
  type: inventory
  inventory: chest
  debug: true
  title: <&4><&l>Áloc the Demonic Mech
  gui: true
  definitions:
    ?: <item[dAir]>
  slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [ghast_spawn_egg[display=<&4><&l>Áloc the Demonic Mech;lore=<&f>Price: <&a>₱1000]] [] [] [] []
    - [] [] [] [] [] [] [] [] []

aloc_boss_handler:
  type: world
  debug: false
  events:
    on player drags in aloc_boss_inventory:
    - determine cancelled
    on player clicks in aloc_boss_inventory:
    - if <context.item> == air:
      - determine cancelled
    - choose <context.slot>:
      - case 14:
        - define money <placeholder[vault_eco_balance]>
        - if <[money]> >= 1000:
          - execute as_server "eco take <player.name> 1000"
          - run alocTheDemonic_task
          - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1
          - inventory close
        - if <[money]> < 1000:
          - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You needed <&a><&l>₱1000 <&f>to spawn the aloc_boss."
          - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1
          - inventory close