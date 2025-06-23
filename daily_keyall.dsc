daily_keyall:
  type: world
  debug: false
  events:
    on player joins:
    - define online_players <server.online_players.size>
    - if <[online_players]> < 30:
      - if <player.name> != sieccc && <player.name> != ellyieee:
        - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Needed <&f><server.online_players.size>/30 players more for Random Crate Key Voucher"
    - if <[online_players]> == 30:
      - if <player.name> != sieccc && <player.name> != ellyieee:
        - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Needed 10 more players more for Random Crate Key Voucher"
        - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Needed 10 more players more for Random Crate Key Voucher"
        - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Needed 10 more players more for Random Crate Key Voucher"
    # If server reached 40 players
    - if <[online_players]> == 30:
      # If the daily keyall has a cooldown
      - if <server.has_flag[cooldown]>:
         - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>NO RANDOM CRATE TIER KEY VOUCHER, EVERYONE MUST WAIT <&l><server.flag_expiration[cooldown].from_now.formatted>."
         - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>NO RANDOM CRATE TIER KEY VOUCHER, EVERYONE MUST WAIT <&l><server.flag_expiration[cooldown].from_now.formatted>."
         - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>NO RANDOM CRATE TIER KEY VOUCHER, EVERYONE MUST WAIT <&l><server.flag_expiration[cooldown].from_now.formatted>."
         - stop
      # Discord message to Magbungkal
      - definemap embed_map:
            title: RANDOM CRATE TIER KEY VOUCHER HAS GIVEN TO EVERYONE WHO ARE ONLINE - - <server.online_players.size>/30
            color: orange
      - flag server cooldown expire:12h
      - define embed <discord_embed.with_map[<[embed_map]>]>
      - ~discordmessage id:magbungkal channel:1182318611088552026 <[embed]>
      - ~discordmessage id:magbungkal channel:1182512909654438068 <[embed]>
      # Announcement In-Game
      - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>RANDOM CRATE TIER KEY VOUCHER HAS GIVEN TO EVERYONE WHO ARE ONLINE - <&f><&l><server.online_players.size><&8>/<&f><&l>50"
      # Running daily keyall task
      - run daily_keyall_task

daily_keyall_task:
  type: task
  debug: false
  script:
    - execute as_server "voucher giveall randomcratekey"

# daily_keyall:
#   type: world
#   debug: false
#   events:
#     on player joins:
#     - define excluded_players <list[sieccc|ellyieee]>
#     - if <[excluded_players].contains[<player.name>]>:
#         - stop

#     - define online_players <server.online_players.exclude[<[excluded_players]>].size>
#     - if <[online_players]> == 1:
#         - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
#         - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Needed <&b><[online_players]>/30 <&f>players for a Random Crate Key Voucher!"

#     - if <[online_players]> == 20:
#         - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
#         - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Needed 10 more players for a Random Crate Key Voucher!"

#     - if <[online_players]> == 40:
#         - if <server.has_flag[cooldown]>:
#             - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>NO RANDOM CRATE KEY VOUCHER, EVERYONE MUST WAIT <&l><server.flag_expiration[cooldown].from_now.formatted>."
#             - stop

#         # Discord message notification
#         - definemap embed_map:
#               title: "🎉 RANDOM CRATE TIER KEY VOUCHER HAS BEEN GIVEN! - <[online_players]>/30"
#               color: orange
#         - define embed <discord_embed.with_map[<[embed_map]>]>
#         - ~discordmessage id:magbungkal channel:1182318611088552026 <[embed]>
#         - ~discordmessage id:magbungkal channel:1182512909654438068 <[embed]>

#         - announce "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>RANDOM CRATE TIER KEY VOUCHER HAS BEEN GIVEN TO ONLINE PLAYERS - <&b><&l><[online_players]>/40"

#         - flag server cooldown expire:12h
#         - run daily_keyall_task

# daily_keyall_task:
#   type: task
#   debug: false
#   script:
#     - execute as_server "voucher giveall randomcratekey"
