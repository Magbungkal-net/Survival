cmdcoinsshop:
  type: command
  debug: false
  name: coinsshop
  description: coins shop
  usage: /coinsshop
  # permission: denizen.admin
  aliases:
  - cshop
  - cs
  script:
  - inventory open destination:coinsshop
  - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1

coinsshop:
  type: inventory
  inventory: chest
  debug: true
  title: <&e><&l>Coins Shop
  gui: true
  definitions:
    ?: <item[dAir]>
  slots:
    - [] [] [] [] [] [] [] [] []
    - [] [netherite_sword[display=<&6><&l>Item Cosmetics]] [] [tripwire_hook[display=<&6><&l>Crate Keys]] [] [book[display=<&6><&l>Custom Enchantments]] [] [barrier[display=<&c><&l>Coming soon...]] []
    - [] [] [] [] [] [] [] [] []

coinsshop_handler:
  type: world
  debug: false
  events:
    on player drags in coinsshop:
    - determine cancelled
    on player clicks in coinsshop:
    - if <context.item> == air:
      - determine cancelled
    - choose <context.slot>:
      - case 11:
         - inventory open destination:item_cosmetics
         - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1
      - case 13:
         - inventory open destination:keyshop
         - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1
      - case 15:
         - inventory open destination:ce_items
         - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1
      - case 17:
         - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1
         - narrate "<&c><&l>Coming soon...
         - inventory close