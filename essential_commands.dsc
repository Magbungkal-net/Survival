#-------------------------------------------------------
# Author: sieccc
# Description: Get the flags of a player.
# Version: 1.1
# Date Published: 02-24-2025
# Last Updated: 02-24-2025
# Update:
# (02-22-2025) v1.0
# - Initial release
# (02-25-2025) v1.1
# - Fix bugs
# Known Issues: none
#-------------------------------------------------------
player_flags_command:
    debug: false
    type: command
    name: flags
    usage: /flags
    description: Shows a formatted list of a player's flags.
    permission: denizen.admin
    # permission message: <reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>You do not have permission to use this command.
    script:
    - define args <context.args>
    - if <[args].size> < 1:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Usage: <&e>/flags [player] [page]"
        - stop

    - define target <server.match_player[<[args].get[1]>].if_null[null]>
    - if <[target]> == null:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Player <&e>'<[args].get[1]>' <&c>not found!"
        - stop

    - define page <[args].get[2].if_null[1]>
    # Error Message: The list_flags and flag_map tags are meant for testing/debugging only. Do not use it in scripts
    - define flag_list <[target].list_flags>
    - if <[flag_list].is_empty>:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&e><[target].name> <&c>has no active flags."
        - stop

    - define total_pages <[flag_list].size.div[10].round_up>
    - if <[page]> > <[total_pages]> || <[page]> < 1:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Invalid page number! There are only <&e><[total_pages]> <&c>pages."
        - stop

    - narrate "<&e>===== <[target].name>'s Active Flags (Page <[page]>/<[total_pages]>) ====="

    - define start_index <[page].sub[1].mul[10]>
    - define end_index <[start_index].add[10]>
    - define current_index 0

    - foreach <[flag_list]> as:flag:
        - if <[current_index]> >= <[start_index]> && <[current_index]> < <[end_index]>:
            - narrate "<&6><[current_index].add[1]> <[flag]>"
        - define current_index <[current_index].add[1]>

addflags_command:
    debug: false
    type: command
    name: addflags
    usage: /addflags
    tab completions:
        1: <server.online_players.parse[name]>
    description: Add a flag to a player.
    permission: op
    script:
    - define args <context.args>

    - if <[args].size> < 2:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Usage: <&e>/addflags [player] [flag]"
        - stop

    - define target <server.match_player[<[args].get[1]>].if_null[null]>
    - if <[target]> == null:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Player <&e>'<[args].get[1]>' <&c>not found!"
        - stop

    - define flag_name <[args].get[2]>
    - if <[flag_name].length> < 3:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Flag name must be at least <&e>3 <&c>characters long!"
        - stop
    - if <[flag_name].length> > 32:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Flag name is too long! Max <&e>32 <&c>characters."
        - stop

    - if <player[<[target]>].has_flag[<[flag_name]>]>:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&e><[target].name> <&c>already has the flag <&e>'<[flag_name]>'!"
        - stop

    - flag <player[<[target]>]> <[flag_name]>:true
    - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&f>Successfully added flag <&e>'<[flag_name]>' <&f>to <&e><[target].name>!"


removeflags_command:
    debug: false
    type: command
    name: removeflags
    usage: /removeflags
    tab completions:
        1: <server.online_players.parse[name]>
    description: Remove a player's flag.
    permission: denizen.admin
    # permission message: <reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>You do not have permission to use this command.
    script:
    - if <player.name> != sieccc:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>You do not have permission to use this command."
        - stop

    - define args <context.args>
    - if <[args].size> < 2:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Usage: <&e>/removeflags [player] [flag_name]"
        - stop

    - define target <server.match_player[<[args].get[1]>].if_null[null]>
    - define flag_name <[args].get[2]>

    - if <[target]> == null:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Player <&e>'<[target].name>' <&c>not found!"
        - stop

    - if !<[target].has_flag[<[flag_name]>]>:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c><&e><[target].name> <&c>does not have the flag <&e>'<[flag_name]>' <&c>or maybe expired."
        - stop

    - flag <player[<[target]>]> <[flag_name]>:!
    - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&f>Successfully removed flag <&e>'<[flag_name]>' <&f>from <&e><[target].name>!"

server_flags_command:
    debug: false
    type: command
    name: serverflags
    usage: /serverflags
    tab completions:
        1: [amount]
    description: Shows a list of all server flags.
    permission: denizen.admin
    script:
    - define args <context.args>
    - define page <[args].get[1].if_null[1]>

    # Error Message: The list_flags and flag_map tags are meant for testing/debugging only. Do not use it in scripts
    - define flag_list <server.list_flags>
    - if <[flag_list].is_empty>:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>No active server flags found."
        - stop

    - define total_pages <[flag_list].size.div[10].round_up>
    - if <[page]> > <[total_pages]> || <[page]> < 1:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Invalid page number! There are only <&e><[total_pages]> <&c>pages."
        - stop

    - narrate "<&e>===== Server Flags (Page <[page]>/<[total_pages]>) ====="
    - define start_index <[page].sub[1].mul[10]>
    - define end_index <[start_index].add[10]>
    - define current_index 0

    - foreach <[flag_list]> as:flag:
        - if <[current_index]> >= <[start_index]> && <[current_index]> < <[end_index]>:
            - narrate "<&6><[current_index].add[1]> <[flag]>"
        - define current_index <[current_index].add[1]>

sremoveflag_command:
    type: command
    name: sremoveflag
    description: Remove a server flag.
    usage: /sremoveflag
    tab completions:
        1: <server.list_flags>
    permission: denizen.admin
    script:
    - if <player.name> != sieccc:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>You do not have permission to use this command."
        - stop

    - define args <context.args>
    - if <[args].size> < 1:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Usage: <&e>/sremoveflag [flag_name]"
        - stop

    - define flag_name <[args].get[1]>
    - if !<server.has_flag[<[flag_name]>]>:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Server flag <&e>'<[flag_name]>' <&c>does not exist!"
        - stop

    - flag server <[flag_name]>:!
    - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&f>Successfully removed server flag: <&e><[flag_name]>"

#-------------------------------------------------------
# Author: akiakyo
# Description: Get the UUID of a player.
# Version: 1.1
# Date Published: ?
# Last Updated: 02-24-2025
# Update:
# (02-22-2025) v1.1
# - Simplified codes
# Known Issues: none
#-------------------------------------------------------
UUID_Getter:
    debug: false
    type: command
    name: uuid
    usage: /uuid
    tab completions:
        1: <server.online_players.parse[name]>
    description: Get the UUID of a player.
    permission: denizen.admin
    # permission message: <reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>You do not have permission to use this command.
    script:
    - define args <context.args>
    - if <[args].size> < 1:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Usage: <&e>/uuid <&lb>player<&rb>"
        - stop

    - define target <server.match_offline_player[<context.args.get[1]>].if_null[null]>
    - if <[target]> == null:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&c>Player <&e>'<[args].get[1]>' <&c>not found."
        - stop

    - narrate <&f>
    - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>]<&e><[target].name><&sq>s UUID: <&b><[target].uuid>"
    - narrate <&f>
