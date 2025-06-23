commandBlackmarket:
    type: command
    name: blackmarket
    description: teleport to blackmarket
    usage: /blackmarket
    script:
    - playsound <player.location> sound:BLOCK_CONDUIT_ACTIVATE pitch:1 volume:1
    - execute as_player "warp blackmarket"
    - cast blindness duration:1.5
    - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5

eventsBlackmarket:
    type: world
    debug: false
    events:
        on player right clicks npc:
        - if <npc.id> == 233:
            - if <server.has_flag[cooldownBlackmarket]>:
                - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Blackmarket is closed. You must wait <server.flag_expiration[cooldownBlackmarket].from_now.formatted>."
                - stop
            - wait 1t
            - run tradesblackmarket
            - wait 30m
            - flag server cooldownBlackmarket expire:3h


taskBlackmarket:
    type: task
    debug: false
    script:
    - announce <empty>
    - execute as_server "a <&f>Blackmarket is now open! <&8>/blackmarket"
    - announce <empty>

    - define channel 1182512909654438068
    - definemap embed_map:
        author_name: Blackmarket is now open!
        description: "# /blackmarket"
        image: https://media.discordapp.net/attachments/1182512909654438068/1386562630096916580/2025-06-23_12.24.38.png?ex=685a2894&is=6858d714&hm=5aee67d838fb138e7b023c3302c779a0949c292a904076781117ff8cf57f2c58&=&format=webp&quality=lossless&width=550&height=289
        color: gray
    - define embed <discord_embed.with_map[<[embed_map]>]>
    - ~discordmessage id:magbungkal channel:<[channel]> <[embed]>

tradesBlackmarket:
    type: task
    debug: false
    script:
    - define rusted_sword <item[rustedswordblackmarket]>
    - define rusted_bow <item[rustedbowblackmarket]>
    - define rusted_crossbow <item[rustedcrossbowblackmarket]>
    - define rusted_shield <item[rustedshieldblackmarket]>

    - opentrades trade[max_uses=5;inputs=music_disc_pigstep|netherite_sword;result=<[rusted_sword]>]|trade[max_uses=5;inputs=music_disc_precipice|bow;result=<[rusted_bow]>]|trade[max_uses=5;inputs=music_disc_otherside|crossbow;result=<[rusted_crossbow]>]|trade[max_uses=5;inputs=music_disc_11|shield;result=<[rusted_shield]>]

# items
rustedswordBlackmarket:
    type: item
    material: netherite_sword
    display name: <&f><&l>Rusted Sword
    enchantments:
    - unbreaking:5
    mechanisms:
      custom_model_data: 1016

rustedbowBlackmarket:
    type: item
    material: bow
    display name: <&f><&l>Rusted Bow
    enchantments:
    - unbreaking:5
    mechanisms:
      custom_model_data: 1003

rustedcrossbowBlackmarket:
    type: item
    material: crossbow
    display name: <&f><&l>Rusted Crossbow
    enchantments:
    - unbreaking:5
    mechanisms:
      custom_model_data: 1002

rustedshieldBlackmarket:
    type: item
    material: shield
    display name: <&f><&l>Rusted Shield
    enchantments:
    - unbreaking:5
    mechanisms:
      custom_model_data: 1002