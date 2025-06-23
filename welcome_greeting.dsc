welcome_greeting:
    type: world
    debug: false
    events:
        after player joins bukkit_priority:lowest:
        - wait 15s
        - title "title:<&gradient[from=#7C4751;to=#7C4751]><&l>Magbungkal <&gradient[from=#7C4751;to=#7C4751]>Season VII" "subtitle:<&f>Welcome <player.name>!"
        - narrate "<&8><&m>+---------------------------+"
        - narrate "         "
        - narrate "                  <&gradient[from=#7C4751;to=#7C4751]><&l>Magbungkal"
        - narrate "                   <&gradient[from=#7C4751;to=#7C4751]>Season VII"
        - narrate "         "
        - narrate "            <&7>Welcome, <&f><&n><player.name><&7>!"
        - narrate "         "
        - narrate " <&gradient[from=#7C4751;to=#7C4751]>Website<&7>: <element[<&f>https://magbungkal.net/].on_click[https://magbungkal.net/].type[OPEN_URL]>"
        - narrate " <&gradient[from=#7C4751;to=#7C4751]>Store<&7>: <element[<&f>https://magbungkal.net/store].on_click[https://magbungkal.net/store].type[OPEN_URL]>"
        - narrate " <&9>Discord<&7>: <element[<&f>http://discord.com/magbungkal].on_click[http://discord.com/magbungkal].type[OPEN_URL]>"
        - narrate "         "
        - narrate "         <&8>» <&gradient[from=#7C4751;to=#7C4751]>play.magbungkal.net <&8>« "
        - narrate "<&8><&m>+---------------------------+"
#         - wait 5s
#         - define text <list[<&0><n><n><&l>Hello <player.name>, <reset><n><n><&0>If you are wondering that where the other players...<n><n>Server is going to reset soon, We suggested that do not grind, or build as they'll going to reset soon.]>
#         - define text:->:<element[<&0><n><n><&l>Please migrate your items on your vaults, to keep them for next server reset.<n><n><n><&8>[<&gradient[from=#7C4751;to=#7C4751]>/pv<&8>]<&0><&l> For command]>
#         - define text:->:<element[<&0><n><n><&l>Also please join to our discord for announcements and updates. <n><n><n><&8>[<&9>/discord<&8>]<&0><&l> For command]>
#         - define text:->:<element[<&0><n><n><&l>Check the Survival reset countdown by typing <&8>[<&gradient[from=#7C4751;to=#7C4751]>/svreset<&8>]]>
#         - define text:->:<element[<&0><n><n><&l>Thank you for understanding, <n><n><n><&l>@akiakyo]>
#         - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
#         - playsound <player.location> sound:BLOCK_NOTE_BLOCK_BELL pitch:1 volume:0.3
#         - playsound <player.location> sound:BLOCK_NOTE_BLOCK_HARP pitch:1 volume:0.3

# survival_reset_cmd:
#   type: command
#   debug: false
#   name: survivalreset
#   description: Show the countdown on survival reset
#   usage: /survivalreset
#   # permission: denizen.admin
#   aliases:
#   - svreset
#   script:
#   #- narrate "<&f><&l>Survival Reset: <&7><placeholder[server_countdown_dd.MM.yyyy_30.07.2024.HH:mm:ss.12.00.AM]>"
#   - define text <list[<&0><n><n><&l>Hey <player.name>, <n><n>Survival is going to reset soon.<n><n><&0><&l>Survival Reset: <&7><&l><placeholder[server_countdown_dd.MM.yyyy_30.07.2024.HH:mm:ss.12.00.AM]>]>
#   - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
#   - playsound <player.location> sound:BLOCK_NOTE_BLOCK_BELL pitch:1 volume:0.3