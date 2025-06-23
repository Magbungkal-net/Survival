# Credits for Dotxzxc Leaderboards Script
# https://github.com/dotxzxc/Denizen-Enthusiast/blob/main/discord/leaderboard/LeaderboardsMonthly.dsc
#
# /ex flag server leaderboard_monthly:!
# /ex run LEADERBOARD_MONTHLY_TASK
#

leaderboards_monthly_data:
    type: data
    rewards:
        1:
        - money give PLAYER 1000000
        - magbungkalcoins give PLAYER 1500
        2:
        - money give PLAYER 500000
        - magbungkalcoins give PLAYER 800
        3:
        - money give PLAYER 150000
        - magbungkalcoins give PLAYER 250
    board:
    - statistic_time_played
    - vault_eco_balance
    - statistic_fish_caught
    - statistic_mob_kills
    - statistic_mine_block
    - kixschatgames_wins
    - betterteams_position_score_1
    - coinsengine_balance_raw_MagbungkalCoins
    - superbvote_votes
    - mcmmo_power_level

leaderboards_monthly_rewards_handler:
    type: world
    debug: false
    events:
        after system time minutely:
        - define day <util.time_now.day>
        - define days_in_month <util.time_now.days_in_month.sub[1]>
        - define hour <util.time_now.hour>
        - define minute <util.time_now.minute>
        - if <[day]> == <[days_in_month]> && <[hour]> == 23 && <[minute]> == 55:
            - define data <script[leaderboards_monthly_data]>
            - define rewardstop1 <[data].data_key[rewards].get[1]>
            - define rewardstop2 <[data].data_key[rewards].get[2]>
            - define rewardstop3 <[data].data_key[rewards].get[3]>

            - foreach <[data].data_key[board]>:
                - define top1 <placeholder[ajlb_lb_<[value]>_1_monthly_name]>
                - foreach <[rewardstop1]> as:reward:
                    - wait 1t
                    - define command <[reward].replace_text[PLAYER].with[<[top1]>]>
                    - execute as_server <[command]>
                    - announce to_console "[Monthly Leaderboard] <[top1]> <&co> <[command]>"

                - define top2 <placeholder[ajlb_lb_<[value]>_2_monthly_name]>
                - foreach <[rewardstop2]> as:reward:
                    - wait 1t
                    - define command <[reward].replace_text[PLAYER].with[<[top2]>]>
                    - execute as_server <[command]>
                    - announce to_console "[Monthly Leaderboard] <[top2]> <&co> <[command]>"

                - define top3 <placeholder[ajlb_lb_<[value]>_3_monthly_name]>
                - foreach <[rewardstop3]> as:reward:
                    - wait 1t
                    - define command <[reward].replace_text[PLAYER].with[<[top3]>]>
                    - execute as_server <[command]>
                    - announce to_console "[Monthly Leaderboard] <[top3]> <&co> <[command]>"

            - flag server leaderboard_monthly:!
            - wait 10m system
            - inject leaderboard_monthly_task

        after system time minutely every:3:
        - inject leaderboard_monthly_task

leaderboard_monthly_task:
  type: task
  debug: false
  script:
    - define channel 1212849029667627028

    - definemap embed_map:
        title: 🏆 Survival Monthly Leaderboards
        color: orange
    - define embed <discord_embed.with_map[<[embed_map]>]>
    # Rewards
    - definemap rewards:
        rewards:
        -   🥇 **Top 1**
        - > ₱1,000,000
        - > 1500 Coins
        - <&nl>
    - define message <[rewards].get[rewards].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[Rewards].value[<[message]>]>

    - definemap rewards:
        rewards:
        -   🥈 **Top 2**
        - > ₱500,000
        - > 800 Coins
        - <&nl>
    - define message <[rewards].get[rewards].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[].value[<[message]>]>

    - definemap rewards:
        rewards:
        -   🥉 **Top 3**
        - > $150,000
        - > 250 Coins
        - <&nl>
    - define message <[rewards].get[rewards].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[].value[<[message]>]>

    # Top Playtime
    - definemap format:
        format:
        - <placeholder[ajlb_lb_statistic_time_played_1_monthly_name]> | <placeholder[ajlb_lb_statistic_time_played_1_monthly_value]>
        - <placeholder[ajlb_lb_statistic_time_played_2_monthly_name]> | <placeholder[ajlb_lb_statistic_time_played_2_monthly_value]>
        - <placeholder[ajlb_lb_statistic_time_played_3_monthly_name]> | <placeholder[ajlb_lb_statistic_time_played_3_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[⌛ Top Playtime].value[```<[message].replace_text[|].with[»]>```]>

    # Top Survivor
    - definemap format:
        format:
        - <placeholder[ajlb_lb_vault_eco_balance_1_monthly_name]> | <placeholder[ajlb_lb_vault_eco_balance_1_monthly_value]>
        - <placeholder[ajlb_lb_vault_eco_balance_2_monthly_name]> | <placeholder[ajlb_lb_vault_eco_balance_1_monthly_value]>
        - <placeholder[ajlb_lb_vault_eco_balance_3_monthly_name]> | <placeholder[ajlb_lb_vault_eco_balance_1_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[💸 Top Balance].value[```<[message].replace_text[|].with[»]>```]>

    # Top Jumper
    - definemap format:
        format:
        - <placeholder[ajlb_lb_statistic_fish_caught_1_monthly_name]> | <placeholder[ajlb_lb_statistic_fish_caught_1_monthly_value]>
        - <placeholder[ajlb_lb_statistic_fish_caught_2_monthly_name]> | <placeholder[ajlb_lb_statistic_fish_caught_2_monthly_value]>
        - <placeholder[ajlb_lb_statistic_fish_caught_3_monthly_name]> | <placeholder[ajlb_lb_statistic_fish_caught_3_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[🐟 Top Fish Caught].value[```<[message].replace_text[|].with[»]>```]>

    # Top Mob Killers
    - definemap format:
        format:
        - <placeholder[ajlb_lb_statistic_mob_kills_1_monthly_name]> | <placeholder[ajlb_lb_statistic_mob_kills_1_monthly_value]>
        - <placeholder[ajlb_lb_statistic_mob_kills_2_monthly_name]> | <placeholder[ajlb_lb_statistic_mob_kills_2_monthly_value]>
        - <placeholder[ajlb_lb_statistic_mob_kills_3_monthly_name]> | <placeholder[ajlb_lb_statistic_mob_kills_3_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[👹 Top Mob Kills].value[```<[message].replace_text[|].with[»]>```]>

    # Top Block Miners
    - definemap format:
        format:
        - <placeholder[ajlb_lb_statistic_mine_block_1_monthly_name]> | <placeholder[ajlb_lb_statistic_mine_block_1_monthly_value]>
        - <placeholder[ajlb_lb_statistic_mine_block_2_monthly_name]> | <placeholder[ajlb_lb_statistic_mine_block_2_monthly_value]>
        - <placeholder[ajlb_lb_statistic_mine_block_3_monthly_name]> | <placeholder[ajlb_lb_statistic_mine_block_3_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[🧱 Top Miners].value[```<[message].replace_text[|].with[»]>```]>

    # Top Deaths
    - definemap format:
        format:
        - <placeholder[ajlb_lb_kixschatgames_wins_1_monthly_name]> | <placeholder[ajlb_lb_kixschatgames_wins_1_monthly_value]>
        - <placeholder[ajlb_lb_kixschatgames_wins_2_monthly_name]> | <placeholder[ajlb_lb_kixschatgames_wins_2_monthly_value]>
        - <placeholder[ajlb_lb_kixschatgames_wins_3_monthly_name]> | <placeholder[ajlb_lb_kixschatgames_wins_3_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[🪄 Top Chat Games].value[```<[message].replace_text[|].with[»]>```]>

    # # Top Team Levels
    # - definemap format:
    #     format:
    #     - <placeholder[ajlb_lb_betterteams_position_score_1_1_monthly_name]> | <placeholder[ajlb_lb_betterteams_position_score_1_1_monthly_value]>
    #     - <placeholder[ajlb_lb_betterteams_position_score_1_2_monthly_name]> | <placeholder[ajlb_lb_betterteams_position_score_1_2_monthly_value]>
    #     - <placeholder[ajlb_lb_betterteams_position_score_1_2_monthly_name]> | <placeholder[ajlb_lb_betterteams_position_score_1_3_monthly_value]>
    # - define message <[format].get[format].separated_by[<&nl>]>
    # - define embed <[embed].add_inline_field[🛡️ Top Team Levels].value[```<[message].replace_text[|].with[»]>```]>

    # Top Coins Holder
    - definemap format:
        format:
        - <placeholder[ajlb_lb_coinsengine_balance_raw_MagbungkalCoins_1_monthly_name]> | <placeholder[ajlb_lb_coinsengine_balance_raw_MagbungkalCoins_1_monthly_value]>
        - <placeholder[ajlb_lb_coinsengine_balance_raw_MagbungkalCoins_2_monthly_name]> | <placeholder[ajlb_lb_coinsengine_balance_raw_MagbungkalCoins_2_monthly_value]>
        - <placeholder[ajlb_lb_coinsengine_balance_raw_MagbungkalCoins_3_monthly_name]> | <placeholder[ajlb_lb_coinsengine_balance_raw_MagbungkalCoins_3_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[🪙 Top Coins Holder].value[```<[message].replace_text[|].with[»]>```]>

    # Top Voters
    - definemap format:
        format:
        - <placeholder[ajlb_lb_superbvote_votes_1_monthly_name]> | <placeholder[ajlb_lb_superbvote_votes_1_monthly_value]>
        - <placeholder[ajlb_lb_superbvote_votes_2_monthly_name]> | <placeholder[ajlb_lb_superbvote_votes_2_monthly_value]>
        - <placeholder[ajlb_lb_superbvote_votes_3_monthly_name]> | <placeholder[ajlb_lb_superbvote_votes_3_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[📮 Top Voters].value[```<[message].replace_text[|].with[»]>```]>

    # Top mcMMO Power
    - definemap format:
        format:
        - <placeholder[ajlb_lb_mcmmo_power_level_1_monthly_name]> | <placeholder[ajlb_lb_mcmmo_power_level_1_monthly_value]>
        - <placeholder[ajlb_lb_mcmmo_power_level_2_monthly_name]> | <placeholder[ajlb_lb_mcmmo_power_level_2_monthly_value]>
        - <placeholder[ajlb_lb_mcmmo_power_level_3_monthly_name]> | <placeholder[ajlb_lb_mcmmo_power_level_3_monthly_value]>
    - define message <[format].get[format].separated_by[<&nl>]>
    - define embed <[embed].add_inline_field[⚔️ Top mcMMO Power].value[```<[message].replace_text[|].with[»]>```]>

    - if <server.has_flag[leaderboard_monthly].not>:
        - ~discordmessage id:magbungkal channel:1315011027536056320 "<[embed]>" save:sent
        - flag server leaderboard_monthly.message_id:<entry[sent].message.id>
        - stop

    - if <server.has_flag[leaderboard_monthly.message_id]>:
        - define message_id <server.flag[leaderboard_monthly.message_id]>
        - ~discordmessage id:magbungkal edit:<[message_id]> channel:1315011027536056320 "<[embed]>"