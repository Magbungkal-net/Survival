# PlayerRefferalCommand:
#     type: command
#     debug: false
#     name: referrer
#     usage: /referrer [playerName]
#     aliases:
#     - refer
#     - referral
#     description: Refferer Command
#     tab completions:
#       1: <server.online_players.parse[name]>
#     script:
#     - define args <context.args>
#     - define refferer.name <server.match_offline_player[<[args].get[1]>].if_null[null]>
#     - define player <player>
#     - define playtime <placeholder[statistic_time_played:days]>

#     - if <[args].size> != 1:
#         - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Hey! Invalid command usage; proper usage is <&gradient[from=#7C4751;to=#7C4751]>/referrer [playerName]"
#         - stop

#     - if <[refferer.name]> == <[player]>:
#        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You can't refferer your self!"
#        - stop

#     - if <[playtime]> >= 1:
#        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You needed to play 1 day to reffer a player!"
#        - stop

#     - if <[refferer.name]> == null:
#         - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Invalid player specified; <&l><[args].get[1]> <&f>did not match any player!"
#         - stop

#     - if <[player].has_flag[already_reffered]>:
#         - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You can only reffered one player!"
#         - stop

#     - flag player already_reffered
#     - execute as_server "magbungkalcoins give <[args].get[1]> 2000"
#     - execute as_server "magbungkalcoins give <[player].name> 750"
#     - execute as_server "money give <[player].name> 100000"
#     - execute as_server "money give <[args].get[1]> 200000"
#     - execute as_server "etoken 15 <[player].name>"
#     - execute as_server "etoken 30 <[args].get[1]>"
#     - wait 1t
#     - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You recieved ₱100,000, 250 Coins, and 15 Exchange Tokens for referring <&l><[args].get[1].to_uppercase>"
#     - execute as_server "msg <[args].get[1]> <&f>You have been referred by <&l><[player].name>"

#     - define at <player.location.add[0,3,0]>
#     - define quantity 20
#     - define data 1
#     - define offset 0.0

#     - playeffect effect:wax_off at:<[at]> quantity:<[quantity]> data:<[data]> offset:<[offset]> targets:<[player]>
#     - playeffect effect:wax_on at<[at]> quantity:<[quantity]> data:<[data]> offset:<[offset]> targets:<[args].get[1]>

#     - define random.int.000.9 <util.random.int[000].to[9]>
#     - define random.int.000.999 <util.random.int[000].to[99]>
#     - define refferal.id <list[blj|q|t|<[random.int.000.9]>|<[random.int.000.999]>].random[5].replace_text[li@].with[].replace_text[|].with[]>

#     - definemap message_map:
#          author_name: Referral Log - <[player].name.to_uppercase> reffered <[args].get[1].to_uppercase>
#          description: "```<n>Refferer: <[player].name.to_uppercase><n>Reffered: <[args].get[1].to_uppercase><n>Date: <util.time_now[+8].format><n>Rewards given to <[args].get[1].to_uppercase>:<n>- ₱200,000<n>- 2,500 Coins<n>- 30 Exchange Tokens<n>Server: Survival<n>```"
#          color: orange
#          thumbnail: https://mc-heads.net/avatar/<[args].get[1]>.png
#          footer: Referral ID: <[refferal.id]>
    
#     - define embed <discord_embed.with_map[<[message_map]>]>
#     - ~discordmessage id:magbungkal channel:1274718218648293437 <[embed]>
#-------------------------------------------------------
# Author: akiakyo
# Description: Referral System
# Version: 1.1
# Date Published: ?
# Last Updated: 02-24-2025
# Update:
# (02-24-2025) v1.1
# - remove required OP permission
# Known Issues: none
#-------------------------------------------------------

PlayerRefferalCommand:
    type: command
    debug: false
    name: referrer
    usage: /referrer [playerName]
    aliases:
    - refer
    - referral
    description: Referrer Command
    # permission: op
    tab completions:
      1: <server.online_players.parse[name]>
    script:
    - define args <context.args>
    - define referrer_uuid <server.match_offline_player[<[args].get[1]>].if_null[null]>
    - define referrer_name <[referrer_uuid].name>
    - define referrer_IP <player[<[referrer_name]>].ip.address_only.split[:].get[1]>
    - define player <player>
    - define playtime <placeholder[statistic_time_played:days]>

    - if <[player].has_flag[already_reffered]>:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You can only refer one player!"
        - stop

    # Check if player provide a referrer name
    - if <[args].size> != 1:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Invalid command usage. proper usage is: <&gradient[from=#7C4751;to=#7C4751]>/referrer [playerName]"
        - stop

    # Check if the player exist
    - if <[referrer_uuid]> == null:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Invalid player specified: <&l><[args].get[1]> <&f>did not match any player!"
        - stop

    - if <[referrer_name]> == <[player].name>:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You can't refer yourself!"
        - stop

    # Check if the player have the same IP Address
    - if <[referrer_uuid].is_online>:
        - if <[player].ip.address_only.split[:].get[1]> == <[referrer_IP]>:
            - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You can't refer a player with the same IP Address"
            - stop
    - else:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Referrer must be online"
        - stop

    # Check player playtime
    - if <[playtime]> == 0:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You needed to play 1 day to refer a player!"
        - stop

    - flag player already_reffered
    - execute as_server "magbungkalcoins give <[args].get[1]> 1000"
    - execute as_server "magbungkalcoins give <[player].name> 500"
    - execute as_server "eco give <[player].name> 15000"
    - execute as_server "eco give <[args].get[1]> 25000"
    - wait 1t
    - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You recieved ₱15,000, 500 Coins for referring <&l><[args].get[1].to_uppercase>"
    - execute as_server "msg <[args].get[1]> <&f>You have been referred by <&l><[player].name>"

    - define at <player.location.add[0,3,0]>
    - define quantity 20
    - define data 1
    - define offset 0.0

    - playeffect effect:wax_off at:<[at]> quantity:<[quantity]> data:<[data]> offset:<[offset]> targets:<[player]>
    - playeffect effect:wax_on at<[at]> quantity:<[quantity]> data:<[data]> offset:<[offset]> targets:<[args].get[1]>

    - define random.int.000.9 <util.random.int[000].to[9]>
    - define random.int.000.999 <util.random.int[000].to[99]>
    - define refferal.id <list[blj|q|t|<[random.int.000.9]>|<[random.int.000.999]>].random[5].replace_text[li@].with[].replace_text[|].with[]>

    - definemap message_map:
         author_name: Referral Log - <[player].name.to_uppercase> reffered <[args].get[1].to_uppercase>
         description: "```<n>Refferer: <[player].name.to_uppercase><n>Reffered: <[args].get[1].to_uppercase><n>Date: <util.time_now[+8].format><n>Rewards given to <[args].get[1].to_uppercase>:<n>- ₱25,000<n>- 1,000 Coins<n>Server: Survival<n>```"
         color: orange
         thumbnail: https://mc-heads.net/avatar/<[args].get[1]>.png
         footer: Referral ID: <[refferal.id]>

    - define embed <discord_embed.with_map[<[message_map]>]>
    - ~discordmessage id:magbungkal channel:1274718218648293437 <[embed]>