rankup_config:
    type: data
    rank-placeholder: <placeholder[luckperms_current_group_on_track_rankupsystem]>
    next-rank-placeholder: <placeholder[luckperms_next_group_on_track_rankupsystem]>
    global-commands:
    - ex discordmessage id:magbungkal channel:1182512909654438068 "embed:<discord_embed[author_name=<player.name> has rankup! (from <placeholder[luckperms_current_group_on_track_rankupsystem]> to <placeholder[luckperms_next_group_on_track_rankupsystem]>);author_icon_url=https://mc-heads.net/avatar/<player.name>]>"
    - lp user <player.name> promote rankupsystem
    - ex announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><&l><player.name> <&r><&f>has rankup! (from <placeholder[luckperms_current_group_on_track_rankupsystem]> to <placeholder[luckperms_next_group_on_track_rankupsystem]>)"
    ranks:
        default:
            requirements:
            - Money: <player.money.if_null[0]> / 25
            - Votes: <placeholder[superbvote_votes]> / 1

            commands:
            - money take <player.name> 25

        coal:
            requirements:
            - Money: <player.money.if_null[0]> / 500
            - Votes: <placeholder[superbvote_votes]> / 5

            commands:
            - money take <player.name> 500

        Copper I:
            requirements:
            - Money: <player.money.if_null[0]> / 1000
            - Votes: <placeholder[superbvote_votes]> / 10
            - Stone Age Advancement: <player.has_advancement[story/mine_stone].if_null[false]>

            commands:
            - money take <player.name> 1000

        Copper II:
            requirements:
            - Money: <player.money.if_null[0]> / 2000
            - Votes: <placeholder[superbvote_votes]> / 20
            - Acquire Hardware: <player.has_advancement[story/upgrade_tools].if_null[false]>

            commands:
            - money take <player.name> 2000

        Copper III:
            requirements:
            - Money: <player.money.if_null[0]> / 3000
            - Votes: <placeholder[superbvote_votes]> / 30
            - Not Today, Thank You: <player.has_advancement[story/deflect_arrow].if_null[false]>

            commands:
            - money take <player.name> 3000

        Copper IV:
            requirements:
            - Money: <player.money.if_null[0]> / 4000
            - Votes: <placeholder[superbvote_votes]> / 40
            - Adventure Time!: <player.has_advancement[adventure/adventuring_time].if_null[false]>

            commands:
            - money take <player.name> 4000

        Copper V:
            requirements:
            - Money: <player.money.if_null[0]> / 5000
            - Votes: <placeholder[superbvote_votes]> / 50
            - Sweet Dreams: <player.has_advancement[story/sleep_in_bed].if_null[false]>
            - Ol' Betsy: <player.has_advancement[adventure/shoot_arrow].if_null[false]>

            commands:
            - money take <player.name> 5000

        Iron I:
            requirements:
            - Money: <player.money.if_null[0]> / 8000
            - Votes: <placeholder[superbvote_votes]> / 70
            - Suit Up: <player.has_advancement[story/armor].if_null[false]>

            commands:
            - money take <player.name> 8000

        Iron II:
            requirements:
            - Money: <player.money.if_null[0]> / 12000
            - Votes: <placeholder[superbvote_votes]> / 80
            - Isn't It Iron Pick: <player.has_advancement[story/iron_tools].if_null[false]>

            commands:
            - money take <player.name> 12000

        Iron III:
            requirements:
            - Money: <player.money.if_null[0]> / 16000
            - Votes: <placeholder[superbvote_votes]> / 90
            - Monster Hunter: <player.has_advancement[adventure/kill_a_mob].if_null[false]>

            commands:
            - money take <player.name> 16000

        Iron IV:
            requirements:
            - Money: <player.money.if_null[0]> / 20000
            - Votes: <placeholder[superbvote_votes]> / 100
            - Take Aim: <player.has_advancement[adventure/shoot_arrow].if_null[false]>

            commands:
            - money take <player.name> 20000

        Iron V:
            requirements:
            - Money: <player.money.if_null[0]> / 25000
            - Votes: <placeholder[superbvote_votes]> / 110
            - Cover Me With Diamonds: <player.has_advancement[story/shiny_gear].if_null[false]>

            commands:
            - money take <player.name> 25000

        Gold I:
            requirements:
            - Money: <player.money.if_null[0]> / 30000
            - Votes: <placeholder[superbvote_votes]> / 120
            - Zombie Doctor: <player.has_advancement[husbandry/cure_zombie_villager].if_null[false]>

            commands:
            - money take <player.name> 30000

        Gold II:
            requirements:
            - Money: <player.money.if_null[0]> / 40000
            - Votes: <placeholder[superbvote_votes]> / 130
            - What a Deal!: <player.has_advancement[story/trade].if_null[false]>

            commands:
            - money take <player.name> 40000

        Gold III:
            requirements:
            - Money: <player.money.if_null[0]> / 50000
            - Votes: <placeholder[superbvote_votes]> / 140
            - The Parrots and the Bats: <player.has_advancement[husbandry/breed_all_animals].if_null[false]>

            commands:
            - money take <player.name> 50000

        Gold IV:
            requirements:
            - Money: <player.money.if_null[0]> / 60000
            - Votes: <placeholder[superbvote_votes]> / 150
            - Two by Two: <player.has_advancement[husbandry/tame_an_animal].if_null[false]>

            commands:
            - money take <player.name> 60000

        Gold V:
            requirements:
            - Money: <player.money.if_null[0]> / 70000
            - Votes: <placeholder[superbvote_votes]> / 160
            - Total Beelocation: <player.has_advancement[husbandry/safely_harvest_honey].if_null[false]>

            commands:
            - money take <player.name> 70000

        Lapis I:
            requirements:
            - Money: <player.money.if_null[0]> / 80000
            - Votes: <placeholder[superbvote_votes]> / 170
            - Sticky Situation: <player.has_advancement[adventure/walk_on_powder_snow_with_leather_boots].if_null[false]>

            commands:
            - money take <player.name> 80000

        Lapis II:
            requirements:
            - Money: <player.money.if_null[0]> / 100000
            - Votes: <placeholder[superbvote_votes]> / 180
            - Sound of Music: <player.has_advancement[adventure/play_jukebox_in_meadows].if_null[false]>

            commands:
            - money take <player.name> 100000

        Lapis III:
            requirements:
            - Money: <player.money.if_null[0]> / 150000
            - Votes: <placeholder[superbvote_votes]> / 200
            - Serious Dedication: <player.has_advancement[husbandry/obtain_netherite_hoe].if_null[false]>

            commands:
            - money take <player.name> 150000

        Lapis IV:
            requirements:
            - Money: <player.money.if_null[0]> / 200000
            - Votes: <placeholder[superbvote_votes]> / 220
            - Subspace Bubble: <player.has_advancement[end/enter_end_gateway].if_null[false]>

            commands:
            - money take <player.name> 200000

        Lapis V:
            requirements:
            - Money: <player.money.if_null[0]> / 300000
            - Votes: <placeholder[superbvote_votes]> / 240
            - Uneasy Alliance: <player.has_advancement[nether/uneasy_alliance].if_null[false]>

            commands:
            - money take <player.name> 300000

        Amethyst I:
            requirements:
            - Money: <player.money.if_null[0]> / 400000
            - Votes: <placeholder[superbvote_votes]> / 260
            
            commands:
            - money take <player.name> 400000

        Amethyst II:
            requirements:
            - Money: <player.money.if_null[0]> / 500000
            - Votes: <placeholder[superbvote_votes]> / 280
            - Star Trader: <player.has_advancement[adventure/trade_at_world_height].if_null[false]>

            commands:
            - money take <player.name> 500000

        Amethyst III:
            requirements:
            - Money: <player.money.if_null[0]> / 600000
            - Votes: <placeholder[superbvote_votes]> / 300
            - Hot Tourist Destinations: <player.has_advancement[nether/explore_nether].if_null[false]>

            commands:
            - money take <player.name> 600000

        Amethyst IV:
            requirements:
            - Money: <player.money.if_null[0]> / 700000
            - Votes: <placeholder[superbvote_votes]> / 320
            - Feels Like Home: <player.has_advancement[nether/ride_strider].if_null[false]>

            commands:
            - money take <player.name> 700000

        Amethyst V:
            requirements:
            - Money: <player.money.if_null[0]> / 800000
            - Votes: <placeholder[superbvote_votes]> / 340
            - Cover Me in Debris: <player.has_advancement[nether/netherite_armor].if_null[false]>

            commands:
            - money take <player.name> 800000

        Diamond I:
            requirements:
            - Money: <player.money.if_null[0]> / 900000
            - Votes: <placeholder[superbvote_votes]> / 360
            - Hero of the Village: <player.has_advancement[adventure/hero_of_the_village].if_null[false]>

            commands:
            - money take <player.name> 900000

        Diamond II:
            requirements:
            - Money: <player.money.if_null[0]> / 1000000
            - Votes: <placeholder[superbvote_votes]> / 380
            - The End?: <player.has_advancement[end/enter_end].if_null[false]>

            commands:
            - money take <player.name> 1000000

        Diamond III:
            requirements:
            - Money: <player.money.if_null[0]> / 1500000
            - Votes: <placeholder[superbvote_votes]> / 400
            - Free the End: <player.has_advancement[end/kill_dragon].if_null[false]>

            commands:
            - money take <player.name> 1500000

        Diamond IV:
            requirements:
            - Money: <player.money.if_null[0]> / 2000000
            - Votes: <placeholder[superbvote_votes]> / 425
            - The Next Generation: <player.has_advancement[end/dragon_egg].if_null[false]>

            commands:
            - money take <player.name> 2000000

        Diamond V:
            requirements:
            - Money: <player.money.if_null[0]> / 2500000
            - Votes: <placeholder[superbvote_votes]> / 450
            - Remote Getaway: <player.has_advancement[end/enter_end_gateway].if_null[false]>

            commands:
            - money take <player.name> 2500000

        Netherite I:
            requirements:
            - Money: <player.money.if_null[0]> / 3000000
            - Votes: <placeholder[superbvote_votes]> / 475
            - Withering Heights: <player.has_advancement[nether/summon_wither].if_null[false]>

            commands:
            - money take <player.name> 3000000

        Netherite II:
            requirements:
            - Money: <player.money.if_null[0]> / 4000000
            - Votes: <placeholder[superbvote_votes]> / 500
            - Beaconator: <player.has_advancement[nether/create_beacon].if_null[false]>

            commands:
            - money take <player.name> 4000000

        Netherite III:
            requirements:
            - Money: <player.money.if_null[0]> / 6000000
            - Votes: <placeholder[superbvote_votes]> / 525
            - How Did We Get Here?: <player.has_advancement[adventure/all_effects].if_null[false]>

            commands:
            - money take <player.name> 6000000

        Netherite IV:
            requirements:
            - Money: <player.money.if_null[0]> / 8000000
            - Votes: <placeholder[superbvote_votes]> / 550
            - Grammatically Correct: <player.has_advancement[husbandry/fishy_business].if_null[false]>
            
            commands:
            - money take <player.name> 8000000
