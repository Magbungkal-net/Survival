yata_stick_command:
    type: command
    description: Stick ni ein
    name: stick_ni_ein
    usage: /stick_ni_ein
    script:
    - give yata_stick

yata_stick:
    type: item
    material: netherite_sword
    display name: <&6>Pang troll lang poh.. #AdMin AbooOOzzZz
    mechanisms:
       custom_model_data: 1285
    lore:
    - <&f> Pang troll lang poh.. #AdMin AbooOOzzZz

yata_stick_events:
    type: world
    debug: false
    events:
      on player right clicks block with:yata_stick:
      - playsound <player.location> sound:ENTITY_SHULKER_AMBIENT volume:10 pitch:3
