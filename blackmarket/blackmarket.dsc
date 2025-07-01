commandBlackmarket:
    type: command
    name: blackmarket
    description: teleport to blackmarket
    usage: /blackmarket
    script:
    - if  <util.time_now.day_of_week_name> == MONDAY &&  WEDNESDAY && FRIDAY && SUNDAY :
        - playsound <player.location> sound:BLOCK_CONDUIT_ACTIVATE pitch:1 volume:1
        - teleport <location[488.483,84.00000,265.269,s3hub_1]>
        - cast blindness duration:1.5
        - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
    - else:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Blackmarket is closed. Come back Monday, Wednesday, Friday, or Sunday."
        - stop


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
