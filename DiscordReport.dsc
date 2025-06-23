DiscordPlayerReportDiscordEmbedData:
    type: data
    messages:
      report-message:
        title: Player Report
        description: <n>**Player Name:** <[args].get[1]><n><n>**Reason:** <[raw.args]><n><n>**Date:** <util.time_now.to_zone[+8].format_discord><n>
        thumbnail: https://mc-heads.net/avatar/<[args].get[1]>
        footer: Reported by <[player]>
        footer_icon: https://mc-heads.net/avatar/<[player]>
        color: orange

DiscordPlayerReportCommand:
    type: command
    description: Report a player
    name: playerreport
    usage: /playerreport [player] [reason] [attach link for proof (optional)]
    aliases:
    - preport
    - pr
    tab completions:
       1: [player]
       2: [reason]
       3: [attach link for proof (optional)]
    script:
      - define player <player.name>
      - define args <context.args>
      - define raw.args <context.raw_args>
      - define target <server.match_offline_player[<[args].get[1]>].if_null[null]>

      - if <[args].size> == 1:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Invalid command usage; proper usage is <&gradient[from=#7C4751;to=#7C4751]>/playerreport [player] [reason] [attach link for proof (optional)]"
        - stop
      - if <[target]> == null:
         - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>We can't seem find any player with that name on our databases"
         - stop

      - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You have reported <&l><[args].get[1]><&f>. Any staffs will be notified within 15 - 30 minutes."

      - define report.message <script[discordplayerreportdiscordembeddata].parsed_key[messages].get[report-message]>
      - define report.message.embed <discord_embed.with_map[<[report.message]>]>

      - discordmessage id:magbungkal channel:1266826172004700270 <[report.message.embed]>

DiscordBugReportDiscordEmbedData:
    type: data
    messages:
      bug-message:
        title: Bug Report
        description: <n>**Bug:** <[args].get[1]><n><n>**How to reproduce:** <[raw.args]><n><n>**Date:** <util.time_now.to_zone[+8].format_discord><n>
        thumbnail: https://media.discordapp.net/attachments/1266835691359436800/1270363498123104316/Warning-Emoji-1024x1024.png?ex=66b36db4&is=66b21c34&hm=40b65d1a46d536a69f8ca4a40f0a5b640b27ea76644d58593d959897b5fcd267&=&format=webp&quality=lossless&width=671&height=671
        footer: Reported by <[player]>
        footer_icon: https://mc-heads.net/avatar/<[player]>
        color: maroon


DiscordBugReportCommand:
    type: command
    description: Report a bug
    name: bugreport
    usage: /bugreport [type of bug] [explain how to reproduce] [attach link for proof (optional)]
    aliases:
    - breport
    - bug
    script:
      - define player <player.name>
      - define args <context.args>
      - define raw.args <context.raw_args>

      - if <[args].size> == 1:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Invalid command usage; proper usage is <&gradient[from=#7C4751;to=#7C4751]>/bugreport [type of bug] [explain how to reproduce] [attach link for proof (optional)]"
        - stop

      - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You have bug reported <&l><[args].get[1]><&f>. Any system admins will be notified within 15 - 30 minutes."

      - define bug.message <script[discordbugreportdiscordembeddata].parsed_key[messages].get[bug-message]>
      - define bug.message.embed <discord_embed.with_map[<[bug.message]>]>

      - discordmessage id:magbungkal channel:1266835691359436800 <[bug.message.embed]>