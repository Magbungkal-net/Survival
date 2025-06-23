colorgame_command:
    debug: false
    type: command
    name: colorgame
    usage: /colorgame
    aliases:
    - cgame
    - cg
    tab completions:
        1: status|start|close|restart|refresh|bets
        # For future needs
        # 2: <context.args.get[1].equals[start].if_true[manual|-m].if_false[<context.args.get[1].equals[close].if_true[force].if_false[]>]>
        2: <context.args.get[1].equals[start].if_true[manual|-m].if_false[]>
    description: Start, roll, or restart the Color Game.
    permission: denizen.admin
    # permission message: <&8>[<&gradient[from=#7C4751;to=#7C4751]>SYSTEM<&8>] <&c>You do not have permission to use this command.
    script:
    - define args <context.args>
    - if <[args].size> < 1:
        - narrate "<proc[colorgame_prefix_proc]> <&c>Usage: <&e>/colorgame start [manual|-m] <&c>| <&e>/colorgame roll <&c>| <&e>/colorgame restart"
        - stop

    - choose <[args].get[1].to_uppercase>:
        - case REFRESH:
            - run colorgame_refresh_task
        - case STATUS:
            - run colorgame_status_task
        - case START:
            - run colorgame_start_task def.modes:<[args]>
        - case CLOSE:
            - run colorgame_close_override_task
        - case RESTART:
            - run colorgame_restart_task
        - case BETS:
            - run colorgame_listbets_task
        - default:
            - narrate "<proc[colorgame_prefix_proc]> <&c>Invalid argument! Use <&e>/colorgame start, close, restart, refresh, bets or status."
            - stop

#-    _____ _             _
#-   / ____| |           | |
#-  | (___ | |_ __ _ _ __| |_
#-   \___ \| __/ _` | '__| __|
#-   ____) | || (_| | |  | |_
#-  |_____/ \__\__,_|_|   \__|

# - Checks if the game needs to confirm refresh.
# - Checks if the game refresh is in progress.
# - Set mode to auto.
# - Announce that betting has started.
# - Checks if a game is already running.
# - Checks if there are existing bets. (If yes, must restart first. or start rolling)
# - Sets color_game_open flag.
# - Starts betting phase:
# - If auto mode, waits 15s, then automatically rolls.
# - If manual mode, requires /colorgame roll.

colorgame_start_task:
    debug: false
    type: task
    definitions: modes
    script:
    - run continue_play_task
    - run waitrefresh_task

    - define mode auto
    - define announce_mode "<proc[colorgame_prefix_proc]> <&f>Betting has started! You have <&b>15 <&f>seconds to place your bets!"

    - if <[modes].size> > 1:
        - define input_mode <[modes].get[2].to_lowercase>
        - if <[input_mode]> == manual || <[input_mode]> == -m:
            - define mode manual
            - define announce_mode "<proc[colorgame_prefix_proc]> <&f>Place your bets! The game will remain open until the operator closes it."
        - else:
            - narrate "<proc[colorgame_prefix_proc]> <&c>Usage: <&e>/colorgame start [manual|-m]"
            - stop

    - if <server.has_flag[color_game_open]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>The game is already running!"
        - stop

    - if <server.has_flag[color_game_bets]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>There are active bets in this game!"
        - narrate "<proc[colorgame_prefix_proc]> <&c>You must clear them before proceeding."
        - narrate "<proc[colorgame_prefix_proc]> <&c>Use <&e>/colorgame restart <&c>to refund all bets."
        - narrate "<proc[colorgame_prefix_proc]> <&c>Or use <&e>/colorgame close <&c>to start rolling the cubes!"
        - stop

    - announce <[announce_mode]>
    - announce "<proc[colorgame_prefix_proc]> <&e>/bet [color] [amount]"
    - playsound <server.online_players> sound:block.note_block.pling volume:1 pitch:1
    - flag server color_game_bets:!

    - if <[mode]> == auto:
        - flag server color_game_open:auto expire:15s
        - wait 15s
        - run colorgame_close_task
    - else:
        - flag server color_game_open:manual
    - stop

#-    _____ _
#-   / ____| |
#-  | |    | | ___  ___  ___
#-  | |    | |/ _ \/ __|/ _ \
#-  | |____| | (_) \__ \  __/
#-   \_____|_|\___/|___/\___|

# - Checks if the game needs to confirm refresh.
# - Checks if the game refresh is in progress.
# - Checks if the game is active and if not "The game is not currently running!" message pop up
# - Announce "Betting has closed. No more bets!"
# - wait 3 seconds
# - run colorgame_roll_task task

colorgame_close_task:
    debug: false
    type: task
    script:
    - run continue_play_task
    - run waitrefresh_task

    - if <server.flag_expiration[color_game_open].exists>:
        - flag server color_game_open:!
        - playsound <server.online_players> sound:entity.armadillo.scute_drop volume:1 pitch:0.1
        - announce <&f>
        - announce "<proc[colorgame_prefix_proc]> <&f>Betting has closed. No more bets!"
        - announce <&f>
        - wait 3s
        - run colorgame_roll_task
    - else:
        - narrate "<proc[colorgame_prefix_proc]> <&6>[DEBUG]"
        - narrate "<proc[colorgame_prefix_proc]> <&c>Script malfunction, please execute <&e>/colorgame restart"

colorgame_close_override_task:
    debug: false
    type: task
    script:
    - run continue_play_task
    - run waitrefresh_task

    - if !<server.has_flag[color_game_open]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>[manual] The game is not currently running!"
        - stop

    - define mode <server.flag[color_game_open]>
    - if <[mode]> == auto:
        - narrate "<proc[colorgame_prefix_proc]> <&c>The game is in auto mode. Please wait for it to close automatically!"
        - stop

    - flag server color_game_open:!
    - playsound <server.online_players> sound:entity.armadillo.scute_drop volume:1 pitch:0.1
    - announce <&f>
    - announce "<proc[colorgame_prefix_proc]> <&f>Betting has closed. No more bets!"
    - announce <&f>
    - wait 3s
    - run colorgame_roll_task

#-   _____       _ _
#-  |  __ \     | | |
#-  | |__) |___ | | |
#-  |  _  // _ \| | |
#-  | | \ \ (_) | | |
#-  |_|  \_\___/|_|_|

# - Checks if the game needs to confirm refresh.
# - Checks if the game refresh is in progress.
# - Checks if the game is active and mode is auto.
# - Checks if the game is currently active.
# - Checks if the player place bets.
# - Announce "ROLLING!"
# - Randomly selects 3 colors.
# - Displays rolled colors with formatting.
# - Checks all player bets against the rolled colors.
# - Calculates winnings based on matches:
# - 1 match → Return money.
# - 2 matches → 2x payout.
# - 3 matches → 3x payout.
# - Applies possible multipliers based on bettors.
# - Distributes payouts.
# - Resets color_game_bets flag after payouts.

colorgame_roll_task:
    debug: false
    type: task
    script:
    - run continue_play_task
    - run waitrefresh_task

    - if !<server.has_flag[color_game_bets]>:
        - announce "<proc[colorgame_prefix_proc]> <&c>No bets were placed!"
        - stop

    - announce <&f>
    - announce "<proc[colorgame_prefix_proc]> <&f><&l>ROLLING!"
    - announce <&f>
    - wait 3s
    - playsound <server.online_players> sound:block.wood.hit volume:1 pitch:0.6
    - wait 0.4s
    - playsound <server.online_players> sound:block.wood.hit volume:1 pitch:0.8
    - wait 0.3s
    - playsound <server.online_players> sound:block.wood.hit volume:1 pitch:1
    - wait 0.3s

    - define colors <list[RED|BLUE|GREEN|YELLOW|WHITE|PINK]>
    - define rolled_colors <[colors].random>|<[colors].random>|<[colors].random>

    - define color_codes1 <&f>
    - define color_codes2 <&f>
    - define color_codes3 <&f>
    - define color_index 1

    - foreach <[rolled_colors].split[|]> as:color:
        - if <[color_index]> == 1:
            - define color_codes1 <proc[colorgame_colorformating_proc].context[<[color]>]>
        - if <[color_index]> == 2:
            - define color_codes2 <proc[colorgame_colorformating_proc].context[<[color]>]>
        - if <[color_index]> == 3:
            - define color_codes3 <proc[colorgame_colorformating_proc].context[<[color]>]>
        - define color_index <[color_index].add[1]>

    - announce "<&e>-------------------<&gradient[from=#FBEB08;to=#31C187]><&l>[COLOR GAME!]<&e>-------------------"
    - announce "    <&f><[color_codes1]>|||||||||||||||                        <&f><[color_codes2]>|||||||||||||||                        <&f><[color_codes3]>|||||||||||||||"
    - announce "    <&f><[color_codes1]>|||||||||||||||                        <&f><[color_codes2]>|||||||||||||||                        <&f><[color_codes3]>|||||||||||||||"
    - announce <&e>----------------------------------------------------

    - flag server total_payouts:!
    - define bettors <list>

    - foreach <server.flag[color_game_bets]> as:entry:
        - define data <[entry].split[|]>
        - define player <[data].get[1]>
        - define bet_color <[data].get[2]>
        - define bet_amount <[data].get[3]>
        - define win_count 0

        - foreach <[rolled_colors].split[|]> as:color:
            - if <[color]> == <[bet_color]>:
                - define win_count <[win_count].add[1]>

        - define final_payout 0
        - if <[win_count]> > 0:
            - define payout <[bet_amount].mul[<[win_count]>]>
            - flag server total_payouts.<[player]>:+:<[payout]>
            - define bettors <[bettors].include[<&6><[player]> <&f>bet on <proc[colorgame_colorformating_proc].context[<[bet_color]>]><[bet_color]> <&f>and won <&a>₱<[payout].format_number>]>
        - else:
            - define bettors <[bettors].include[<&6><[player]> <&f>bet on <proc[colorgame_colorformating_proc].context[<[bet_color]>]><[bet_color]> <&f>and lost <&c>₱<[bet_amount].format_number>]>

    - define total_bettors <server.flag[color_game_bets].size>
    - define multiplier 1

    - if <[total_bettors]> >= 1:
        - if <util.random_chance[99]>:
            - define multiplier <util.random.decimal[1].to[2].round_to[1]>
    - else if <[total_bettors]> >= 8:
        - if <util.random_chance[37]>:
            - define multiplier <util.random.decimal[2].to[3].round_to[1]>
    - else if <[total_bettors]> >= 12:
        - if <util.random_chance[30]>:
            - define multiplier <util.random.decimal[3].to[4].round_to[1]>
    - else if <[total_bettors]> >= 20:
        - if <util.random_chance[20]>:
            - define multiplier <util.random.decimal[4].to[5].round_to[1]>

    - if <[multiplier]> > 1:
        - announce "<&f>A <&a><[multiplier]>x Multiplier! <&f>All winnings will be multiplied!"
        - playsound <server.online_players> sound:block.enchantment_table.use volume:1 pitch:1
        - wait 5s

    - announce "<&6><&l>Bettors:"
    - foreach <[bettors]> as:bettor:
        - announce "<&7>- <&r><[bettor]>"
    - announce <&f>

    - if <server.has_flag[total_payouts]>:
        # - MARKED! ERROR
        - foreach <server.flag[total_payouts].keys> as:pay_player:
            - define total_winnings <server.flag[total_payouts.<[pay_player]>]>
            - define final_payout <[total_winnings].mul[<[multiplier]>]>
            - execute as_server "money give <[pay_player]> <[final_payout]> -s"
            - narrate "<proc[colorgame_prefix_proc]> <&f>Congrats <&e><[pay_player]>! <&f>You won <&a>₱<[final_payout].format_number>!" targets:<server.match_player[<[pay_player]>]>
            - playsound <server.match_player[<[pay_player]>]> sound:entity.player.levelup volume:0.5 pitch:0.7

    - flag server color_game_bets:!
    - flag server total_payouts:!
    - stop

#-   _____           _             _
#-  |  __ \         | |           | |
#-  | |__) |___  ___| |_ __ _ _ __| |_
#-  |  _  // _ \/ __| __/ _` | '__| __|
#-  | | \ \  __/\__ \ || (_| | |  | |_
#-  |_|  \_\___||___/\__\__,_|_|   \__|

# - Checks if the game needs to confirm refresh.
# - Checks if the game refresh is in progress.
# - Checks if there are bets.
# - Refunds all player bets.
# - Resets color_game_bets flag.
# - Announces game reset.

colorgame_restart_task:
    debug: false
    type: task
    script:
    - run continue_play_task
    - run waitrefresh_task

    - if !<server.has_flag[color_game_bets]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>No bets to refund!"
        - stop

    - announce <&f>
    - announce "<proc[colorgame_prefix_proc]> <&f>Game restarted! Returning all bets."
    - announce <&f>
    - playsound <server.online_players> sound:entity.villager.no volume:1 pitch:1

    - flag server total_refunds:!
    - foreach <server.flag[color_game_bets]> as:entry:
        - define data <[entry].split[|]>
        - define player <[data].get[1]>
        - define bet_amount <[data].get[3]>
        - flag server total_refunds.<[player]>:+:<[bet_amount]>

    # - MARKED! ERROR
    - foreach <server.flag[total_refunds].keys> as:refund_player:
        - define total_refund <server.flag[total_refunds.<[refund_player]>]>
        - execute as_server "money give <[refund_player]> <[total_refund]> -s"
        - narrate "<proc[colorgame_prefix_proc]> <&f>Your total bet of <&a>₱<[total_refund].format_number> <&f>has been refunded!" targets:<server.match_player[<[refund_player]>]>

    - flag server color_game_bets:!
    - flag server total_refunds:!

continue_play_task:
    debug: false
    type: task
    script:
    - if <server.has_flag[color_game_refresh_confirm]>:
        - flag server color_game_refresh_confirm:!
        - narrate "<proc[colorgame_prefix_proc]> <&f>Game refresh cancelled."

waitrefresh_task:
    debug: false
    type: task
    script:
    - if <server.has_flag[color_game_refreshing]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>Please wait until the game is refreshed!"
        - stop

colorgame_listbets_task:
    debug: false
    type: task
    script:
    - if !<server.has_flag[color_game_bets]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>No bets have been placed yet!"
        - stop

    - narrate "<&e>===== Current Color Game Bets ====="
    - foreach <server.flag[color_game_bets]> as:bet:
        - define data <[bet].split[|]>
        - define player <[data].get[1]>
        - define color <[data].get[2]>
        - define amount <[data].get[3]>
        - narrate "<&e>- <[player]> <&7>| <proc[colorgame_colorformating_proc].context[<[color]>]><[color]> <&7>| <&a>₱<[amount].format_number>"

# randomc:
#     debug: false
#     type: command
#     name: randomc
#     description: null
#     usage: /randomc
#     script:
#     - define colors1 <list[RED|BLUE]>
#     - define colors2 <list[GREEN|YELLOW]>
#     - define colors3 <list[WHITE|PINK]>

#     - execute as_player "bet <[colors1].random> <util.random.decimal[1000].to[1000000].round_up>"
#     - execute as_player "bet <[colors2].random> <util.random.decimal[1000].to[1000000].round_up>"
#     - execute as_player "bet <[colors3].random> <util.random.decimal[1000].to[1000000].round_up>"

    # - if !<server.has_flag[color_game_open]>:
    #     - flag server color_game_open expire:30s
    # - define expiration_time <server.flag_expiration[color_game_open]>
    # - define current_time <util.time_now>
    # - define time_left <[expiration_time].duration_since[<[current_time]>]>
    # - define seconds_left <[time_left].in_seconds.round_down>
    # - narrate "<proc[colorgame_prefix_proc]> <&f>Betting closes in <&e><[seconds_left]> seconds!"

    # - foreach <server.flag[total_payouts].keys> as:pay_player:
    #     - define total_winnings <server.flag[total_payouts].get[<[pay_player]>]>
    #     - narrate "<&6>[DEBUG] <&e><[pay_player]> <&f>→ <&a>₱<[total_winnings].format_number>"
    # - if <server.has_flag[color_game_open]>:
    #     - narrate "<&8>[<&gradient[from=#7C4751;to=#7C4751]>SYSTEM<&8>] <&a>+"
    # - else:
    #     - narrate "<&8>[<&gradient[from=#7C4751;to=#7C4751]>SYSTEM<&8>] <&c>-"

    # - flag server total_payouts.<player>:+:5000
    # - flag server total_payouts.<player>:+:7000
    # - flag server total_payouts.<player>:+:5000
    # - flag server total_payouts.AE_Adiel:+:2000
    # - ~wait 5s
    # - foreach <server.flag[total_payouts].keys> as:pay_player:
    #     - define total_amount <server.flag[total_payouts.<[pay_player]>]>
    #     - narrate "<proc[colorgame_prefix_proc]> <&f>Congrats <&e><[pay_player]>! <&f>You won <&a>₱<[total_amount].format_number>!" targets:<player[<[pay_player]>]>

#-   ____       _
#-  |  _ \     | |
#-  | |_) | ___| |_
#-  |  _ < / _ \ __|
#-  | |_) |  __/ |_
#-  |____/ \___|\__|

# - Checks if betting is open (color_game_open).
# - Validates bet:
# - Checks valid color.
# - Checks valid amount (min 1k, max 50m).
# - Ensures player has enough money.
# - Stores bet using color_game_bets flag.
# - Notifies OPs about the bet.

bet_command:
    debug: false
    type: command
    name: bet
    description: Place a bet in the Color Game.
    usage: /bet [color] [amount]
    tab completions:
        1: GREEN|RED|BLUE|PINK|WHITE|YELLOW
    script:
    - define args <context.args>

    - if !<server.has_flag[color_game_open]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>Betting is currently closed!"
        - stop

    - define colors <list[RED|BLUE|GREEN|YELLOW|WHITE|PINK]>
    - define color <[args].get[1].to_uppercase>

    - if !<[colors].contains[<[color]>]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>Invalid color! Choose from: <&7><&lb><&c>RED, <&9>BLUE, <&2>GREEN, <&e>YELLOW, <&f>WHITE, <&d>PINK.<&7><&rb>"
        - stop

    - define raw_amount <[args].get[2].to_lowercase>
    - define multiplier 1

    - if !<[raw_amount].contains_text[k]> && !<[raw_amount].contains_text[m]> && !<[raw_amount].is_decimal>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>Please enter a valid bet amount! Example: <&e>1.5k, 1.5m, 1500"
        - stop

    - if <[raw_amount].contains_text[k]>:
        - define raw_amount <[raw_amount].replace_text[k].with[]>
        - define multiplier 1000

    - if <[raw_amount].contains_text[m]>:
        - define raw_amount <[raw_amount].replace_text[m].with[]>
        - define multiplier 1000000

    - if !<[raw_amount].is_integer>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>Please enter a valid bet amount!"
        - stop

    - define amount <[raw_amount].mul[<[multiplier]>].round>
    - if <[amount]> < 1000 || <[amount]> > 50000000:
        - narrate "<proc[colorgame_prefix_proc]> <&c>Your bet must be between <&e>₱1,000 <&c>and <&e>₱50,000,000!"
        - stop

    - define balance <placeholder[cmi_user_balance]>
    - if <[balance]> < <[amount]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>You do not have enough money! Your balance: <&e>₱<[balance].format_number>"
        - stop

    - if <server.has_flag[color_game_bets]>:
        - define player_bets <server.flag[color_game_bets].filter[starts_with[<player.name>|<[color]>]]>
        - if <[player_bets].size> > 0:
            - narrate "<proc[colorgame_prefix_proc]> <&c>You have already placed a bet on <proc[colorgame_colorformating_proc].context[<[color]>]><[color]>!"
            - stop

    - execute as_server "money take <player.name> <[amount]> -s"
    - flag server color_game_bets:->:<player.name>|<[color]>|<[amount]>
    - narrate "<proc[colorgame_prefix_proc]> <&f>You bet <&a>₱<[amount].format_number> <&f>on <proc[colorgame_colorformating_proc].context[<[color]>]><[color]>!"
    - if !<player.has_permission[op]>:
        - narrate "<&gradient[from=#FBEB08;to=#31C187]>[Color Game] <&e><player.name> <&f>has bet <&a>₱<[amount].format_number> <&f>on <proc[colorgame_colorformating_proc].context[<[color]>]><[color]>!" targets:<server.online_players.filter[has_permission[op]]>
    - else:
        - narrate "<&gradient[from=#FBEB08;to=#31C187]>[Color Game] <&e><player.name> <&f>has bet <&a>₱<[amount].format_number> <&f>on <proc[colorgame_colorformating_proc].context[<[color]>]><[color]>!" targets:<server.online_players.filter[has_permission[op]].exclude[<player>]>

colorgame_prefix_proc:
    debug: false
    type: procedure
    script:
    - define prefix <&8>[<&gradient[from=#FF4D00;to=#FF4D00]>CG<&8>]
    - determine <[prefix]>

colorgame_colorformating_proc:
    debug: false
    type: procedure
    definitions: colors
    script:
    - choose <[colors]>:
        - case RED:
            - define color_code <&c>
        - case BLUE:
            - define color_code <&9>
        - case GREEN:
            - define color_code <&2>
        - case YELLOW:
            - define color_code <&e>
        - case WHITE:
            - define color_code <&f>
        - case PINK:
            - define color_code <&d>
        - default:
            - define color_code <&f>
    - determine <[color_code]>

#-    _____ _        _
#-   / ____| |      | |
#-  | (___ | |_ __ _| |_ _   _ ___
#-   \___ \| __/ _` | __| | | / __|
#-   ____) | || (_| | |_| |_| \__ \
#-  |_____/ \__\__,_|\__|\__,_|___/

# - Checks if the game is active.
# - If active, displays remaining time until betting closes.
# - Lists all active bettors and their bets.

colorgame_status_task:
    debug: false
    type: task
    script:
    # check if `color_game_open` flag is active/not expired
    - if <server.has_flag[color_game_open]>:
        - narrate "<proc[colorgame_prefix_proc]> <&f>The Color Game is <&a>OPEN<&f>!"
        - if <server.flag_expiration[color_game_open].exists>:
            - define expiration_time <server.flag_expiration[color_game_open]>
            - define current_time <util.time_now>
            - define time_left <[expiration_time].duration_since[<[current_time]>]>
            - define seconds_left <[time_left].in_seconds.round_down>
            - narrate "<proc[colorgame_prefix_proc]> <&f>Betting closes in <&e><[seconds_left]> <&f>seconds!"
        - else:
            - narrate "<proc[colorgame_prefix_proc]> <&f>Betting is open indefinitely."
            - narrate "<proc[colorgame_prefix_proc]> <&f>Use <&e>/colorgame close <&f>to close it."
    - else:
        - narrate "<proc[colorgame_prefix_proc]> <&f>The game is currently <&c>CLOSED."

    - if <server.has_flag[color_game_bets]>:
        - narrate "<&6><&l>Active Bettors:"
        - foreach <server.flag[color_game_bets]> as:entry:
            - define data <[entry].split[|]>
            - define player <[data].get[1]>
            - define bet_color <[data].get[2]>
            - define bet_amount <[data].get[3]>
            - narrate "<&7>- <&e><[player]> <&f>bet <&a>₱<[bet_amount].format_number> <&f>on <proc[colorgame_colorformating_proc].context[<[bet_color]>]><[bet_color]>"
    - else:
        - narrate "<proc[colorgame_prefix_proc]> <&c>No active bettors."
    - stop

#-   _____       __               _
#-  |  __ \     / _|             | |
#-  | |__) |___| |_ _ __ ___  ___| |__
#-  |  _  // _ \  _| '__/ _ \/ __| '_ \
#-  | | \ \  __/ | | | |  __/\__ \ | | |
#-  |_|  \_\___|_| |_|  \___||___/_| |_|

# - Checks if a refresh is already in progress.
# - If bets exist, warns banker to use /colorgame restart.
# - Confirms refresh request (must be repeated within 10s).
# - Stops current game (color_game_open off).
# - Clears color_game_bets.
# - Announces successful refresh.

colorgame_refresh_task:
    debug: false
    type: task
    script:
    - if <server.has_flag[color_game_refreshing]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>The game is already refreshing! Please wait."
        - stop

    - if <server.has_flag[color_game_bets]>:
        - narrate "<proc[colorgame_prefix_proc]> <&c>There are active bets! You must refund all bets before refreshing the game."
        - narrate "<proc[colorgame_prefix_proc]> <&f>Use <&e>/colorgame restart<&f> to refund all bets."
        - narrate "<&6><&l>Active Bettors:"
        - foreach <server.flag[color_game_bets]> as:entry:
            - define data <[entry].split[|]>
            - define player <[data].get[1]>
            - define bet_color <[data].get[2]>
            - define bet_amount <[data].get[3]>
            - narrate "<&7>- <&e><[player]> <&f>bet <&a>₱<[bet_amount].format_number> <&f>on <proc[colorgame_colorformating_proc].context[<[bet_color]>]><[bet_color]>"
        - stop

    - if !<server.has_flag[color_game_refresh_confirm]>:
        - flag server color_game_refresh_confirm expire:10s
        - narrate "<proc[colorgame_prefix_proc]> <&f>Are you sure you want to refresh the game?"
        - narrate "<proc[colorgame_prefix_proc]> <&f>Use <&e>/colorgame refresh <&f>again within 10 seconds to confirm."
        - wait 10s
        - flag server color_game_refresh_confirm:!
        - stop

    - flag server color_game_refreshing
    - narrate "<proc[colorgame_prefix_proc]> <&f>Refreshing color game in <&b>5 <&f>seconds..."
    - wait 5s
    - flag server color_game_open:!
    - flag server color_game_bets:!
    - flag server color_game_refresh_confirm:!
    - flag server color_game_refreshing:!
    - narrate "<proc[colorgame_prefix_proc]> <&f>Game has been refreshed!"
    - stop
