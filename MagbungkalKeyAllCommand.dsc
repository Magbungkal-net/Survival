magbungkal_keyall:
    type: command
    name: keyall
    description: Does something
    usage: /keyall
    permission: denizen.admin
    tab completions:
       1: AJ_LOOTBOX_KEY|SPAWNER_KEY
    script:
    - define args <context.args>
    - if <[args].size> < 1:
       - narrate "<&8><&l><&gradient[from=#7C4751;to=#7C4751]>Magbungkal<&r><&8><&l>] <&r><&f>Invalid Argument! Usage: /keyall [AJ_LOOTBOX_KEY|SPAWNER_KEY]"

    - choose <[args].get[1].to_uppercase>:
       - case AJ_LOOTBOX_KEY:
          - run magbungkal_keyall_aj_lootbox_key
          - title "title:<&gradient[from=#7C4751;to=#7C4751]>[Aj's Lootbox Key x10] Key All" "subtitle:<&f>in 10 minutes" stay:10s targets:<server.online_players>
          - wait 5m
          - title "title:<&gradient[from=#7C4751;to=#7C4751]>[Aj's Lootbox Key x10] Key All" "subtitle:<&f>in 5 minutes" stay:10s targets:<server.online_players>
          - wait 4m
          - title "title:<&gradient[from=#7C4751;to=#7C4751]>[Aj's Lootbox Key x10] Key All" "subtitle:<&f>in 1 minute" stay:10s targets:<server.online_players>
          - wait 1m
          - execute as_server "crate key giveall keyall 10"
          - title "title:<&gradient[from=#7C4751;to=#7C4751]>[Spawner Key x3] Everyone has given their key" "subtitle:<&f>Thank you for playing Magbungkal.net!" stay:10s targets:<server.online_players>
       - case SPAWNER_KEY:
          - run magbungkal_keyall_spawner_key
          - title "title:<&gradient[from=#7C4751;to=#7C4751]>[Spawner Key x3] Key All" "subtitle:<&f>in 10 minutes" stay:10s targets:<server.online_players>
          - wait 5m
          - title "title:<&gradient[from=#7C4751;to=#7C4751]>[Spawner Key x3] Key All" "subtitle:<&f>in 5 minutes" stay:10s targets:<server.online_players>
          - wait 4m
          - title "title:<&gradient[from=#7C4751;to=#7C4751]>[Spawner Key x3] Key All" "subtitle:<&f>in 1 minute" stay:10s targets:<server.online_players>
          - wait 1m
          - execute as_server "crate key giveall spawner 3"
          - title "title:<&gradient[from=#7C4751;to=#7C4751]>[Spawner Key x3] Everyone has given their key" "subtitle:<&f>Thank you for playing Magbungkal.net!" stay:10s targets:<server.online_players>

magbungkal_keyall_aj_lootbox_key:
    type: task
    debug: false
    script:
    - definemap embed_map:
       image: https://media.discordapp.net/attachments/1182512909654438068/1398596743507218432/image.png?ex=6885f038&is=68849eb8&hm=18504986f2ca9deb4143e8fa96d962f194ff0d8f586d393ccbdcd6498f48c116&=&format=webp&quality=lossless
       color: <&color[#7C4751]>
       title: "Key All"
       description: "**KEY**: Aj's Lootbox Key<n>**CRATE**: Aj's Lootbox<n>**WHERE**: /warp crates"
    - define embed <discord_embed.with_map[<[embed_map]>]>
    - discordmessage id:magbungkal channel:1182512909654438068 embed:<[embed]> "@everyone Aj's Lootbox Key All (x10) in 10 minutes"
    - discordmessage id:magbungkal channel:1182318611088552026 embed:<[embed]> "@everyone Aj's Lootbox Key All (x10) in 10 minutes"

magbungkal_keyall_spawner_key:
    type: task
    debug: false
    script:
    - definemap embed_map:
       image: https://media.discordapp.net/attachments/1182512909654438068/1398598930467389551/image.png?ex=6885f241&is=6884a0c1&hm=272129dbcd9a3888a9814859190efafd059282386e4a861c225a58e825e5600e&=&format=webp&quality=lossless
       color: <&color[#7C4751]>
       title: "Key All"
       description: "**KEY**: Spawner Key<n>**CRATE**: Spawner Crate<n>**WHERE**: /warp crates"
    - define embed <discord_embed.with_map[<[embed_map]>]>
    - discordmessage id:magbungkal channel:1182512909654438068 embed:<[embed]> "@everyone Spawner Key All (x3) in 10 minutes"
    - discordmessage id:magbungkal channel:1182318611088552026 embed:<[embed]> "@everyone Spawner Key All (x3) in 10 minutes"
