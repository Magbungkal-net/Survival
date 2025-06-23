HourlyRewards:
    type: world
    debug: false
    events:
        on system time hourly:
        - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Thank you for playing! Here is your rewards for playing an hour" targets:<server.online_players>
        - wait 1t
        - execute as_server "money give -allonline 150"
        - execute as_server "magbungkalcoins giveall 10"