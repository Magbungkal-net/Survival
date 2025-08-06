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
        - Have a stone pickaxe in the inventory: <player.has_advancement[story/mine_stone].if_null[false]>
        - Have a crafting table in the inventory: <player.has_advancement[story/root].if_null[false]>
      commands:
        - money take <player.name> 500

    Copper I:
      requirements:
        - Money: <player.money.if_null[0]> / 10000
        - Votes: <placeholder[superbvote_votes]> / 10
        - Have an iron ingot in the inventory: <player.has_advancement[story/upgrade_tools].if_null[false]>
        - Have any type of iron armor in the inventory: <player.has_advancement[story/obtain_armor].if_null[false]>
      commands:
        - money take <player.name> 10000

    Copper II:
      requirements:
        - Money: <player.money.if_null[0]> / 1500
        - Votes: <placeholder[superbvote_votes]> / 20
        - Lie down in a bed: <player.has_advancement[story/sleep_in_bed].if_null[false]>
        - Block any projectile with a shield: <player.has_advancement[story/deflect_arrow].if_null[false]>
      commands:
        - money take <player.name> 1500

    Copper III:
      requirements:
        - Money: <player.money.if_null[0]> / 20000
        - Votes: <placeholder[superbvote_votes]> / 30
        - Shoot a Crossbow: <player.has_advancement[adventure/ol_betsy].if_null[false]>
        - Shoot something with an Arrow: <player.has_advancement[adventure/shoot_arrow].if_null[false]>
      commands:
        - money take <player.name> 20000

    Copper IV:
      requirements:
        - Money: <player.money.if_null[0]> / 2500
        - Votes: <placeholder[superbvote_votes]> / 40
        - Kill any hostile monster: <player.has_advancement[adventure/kill_a_mob].if_null[false]>
        - Successfully trade with a Villager: <player.has_advancement[adventure/trade].if_null[false]>
      commands:
        - money take <player.name> 2500

    Copper V:
      requirements:
        - Money: <player.money.if_null[0]> / 30000
        - Votes: <placeholder[superbvote_votes]> / 50
        - Obtain a block of Obsidian: <player.has_advancement[story/form_obsidian].if_null[false]>
        - Jump into a Honey Block to break your fall: <player.has_advancement[adventure/honey_block_slide].if_null[false]>
        - Fill a Bucket with lava: <player.has_advancement[story/lava_bucket].if_null[false]>
        - Enchant an item at an Enchanting Table: <player.has_advancement[story/enchant_item].if_null[false]>
      commands:
        - money take <player.name> 30000

    Iron I:
      requirements:
        - Money: <player.money.if_null[0]> / 40000
        - Votes: <placeholder[superbvote_votes]> / 60
        - Plant a seed and watch it grow: <player.has_advancement[husbandry/plant_seed].if_null[false]>
        - Eat everything that is edible, even if it is not good for you: <player.has_advancement[husbandry/balanced_diet].if_null[false]>
      commands:
        - money take <player.name> 40000

    Iron II:
      requirements:
        - Money: <player.money.if_null[0]> / 50000
        - Votes: <placeholder[superbvote_votes]> / 70
        - Catch a fish: <player.has_advancement[husbandry/fishy_business].if_null[false]>
      commands:
        - money take <player.name> 50000

    Iron III:
      requirements:
        - Money: <player.money.if_null[0]> / 60000
        - Votes: <placeholder[superbvote_votes]> / 80
        - Catch a Fish... without a Fishing Rod!: <player.has_advancement[husbandry/tactical_fishing].if_null[false]>
        - Move a Bee Nest, with 3 Bees inside, using Silk Touch: <player.has_advancement[husbandry/silk_touch_nest].if_null[false]>
      commands:
        - money take <player.name> 60000

    Iron IV:
      requirements:
        - Money: <player.money.if_null[0]> / 70000
        - Votes: <placeholder[superbvote_votes]> / 90
        - Use a Campfire to collect Honey from a Beehive using a Glass Bottle without aggravating the Bees: <player.has_advancement[husbandry/safely_harvest_honey].if_null[false]>
        - Apply Honeycomb to a Copper block!: <player.has_advancement[husbandry/wax_on].if_null[false]>
      commands:
        - money take <player.name> 70000

    Iron V:
      requirements:
        - Money: <player.money.if_null[0]> / 80000
        - Votes: <placeholder[superbvote_votes]> / 100
        - Catch an Axolotl in a Bucket: <player.has_advancement[husbandry/axolotl_in_a_bucket].if_null[false]>
        - Team up with an axolotl and win a fight: <player.has_advancement[husbandry/kill_axolotl_target].if_null[false]>
      commands:
        - money take <player.name> 80000

    Gold I:
      requirements:
        - Money: <player.money.if_null[0]> / 100000
        - Votes: <placeholder[superbvote_votes]> / 110
        - Enter the Nether dimension: <player.has_advancement[nether/root].if_null[false]>
        - Destroy a Ghast with a fireball: <player.has_advancement[nether/return_to_sender].if_null[false]>
      commands:
        - money take <player.name> 100000

    Gold II:
      requirements:
        - Money: <player.money.if_null[0]> / 120000
        - Votes: <placeholder[superbvote_votes]> / 120
        - Distract Piglins with gold: <player.has_advancement[nether/distract_piglin].if_null[false]>
        - Enter a Bastion Remnant: <player.has_advancement[nether/find_bastion].if_null[false]>
      commands:
        - money take <player.name> 120000

    Gold III:
      requirements:
        - Money: <player.money.if_null[0]> / 140000
        - Votes: <placeholder[superbvote_votes]> / 130
        - Loot a Chest in a Bastion Remnant: <player.has_advancement[nether/loot_bastion].if_null[false]>
        - Obtain Crying Obsidian: <player.has_advancement[nether/obtain_crying_obsidian].if_null[false]>
      commands:
        - money take <player.name> 140000

    Gold IV:
      requirements:
        - Money: <player.money.if_null[0]> / 160000
        - Votes: <placeholder[superbvote_votes]> / 140
        - Ride a Strider with a Warped Fungus on a Stick: <player.has_advancement[nether/ride_strider].if_null[false]>
        - Charge a Respawn Anchor to the maximum: <player.has_advancement[nether/charge_respawn_anchor].if_null[false]>
      commands:
        - money take <player.name> 160000

    Gold V:
      requirements:
        - Money: <player.money.if_null[0]> / 180000
        - Votes: <placeholder[superbvote_votes]> / 150
        - Obtain a Blaze Rod: <player.has_advancement[nether/obtain_blaze_rod].if_null[false]>
        - Obtain a Wither Skeleton's skull: <player.has_advancement[nether/get_wither_skull].if_null[false]>
      commands:
        - money take <player.name> 180000

    Lapis I:
      requirements:
        - Money: <player.money.if_null[0]> / 200000
        - Votes: <placeholder[superbvote_votes]> / 160
        - Follow an Eye of Ender: <player.has_advancement[story/follow_ender_eye].if_null[false]>
        - Enter the End Portal: <player.has_advancement[story/enter_the_end].if_null[false]>
      commands:
        - money take <player.name> 200000

    Lapis II:
      requirements:
        - Money: <player.money.if_null[0]> / 220000
        - Votes: <placeholder[superbvote_votes]> / 170
        - Escape the End island: <player.has_advancement[end/enter_end_gateway].if_null[false]>
        - Free the End: <player.has_advancement[end/kill_dragon].if_null[false]>
      commands:
        - money take <player.name> 220000

    Lapis III:
      requirements:
        - Money: <player.money.if_null[0]> / 240000
        - Votes: <placeholder[superbvote_votes]> / 180
        - Craft a trimmed armor at a Smithing Table: <player.has_advancement[adventure/trim_with_any_armor_pattern].if_null[false]>
        - Respawn the Ender Dragon: <player.has_advancement[end/respawn_dragon].if_null[false]>
      commands:
        - money take <player.name> 240000

    Amethyst I:
      requirements:
        - Money: <player.money.if_null[0]> / 260000
        - Votes: <placeholder[superbvote_votes]> / 190
        - Trade with a Villager at the build height limit: <player.has_advancement[adventure/trade_at_world_height].if_null[false]>
        - Free fall from the top of the world (build limit) to the bottom of the world and survive: <player.has_advancement[adventure/fall_from_world_height].if_null[false]>
      commands:
        - money take <player.name> 260000

    Amethyst II:
      requirements:
        - Money: <player.money.if_null[0]> / 280000
        - Votes: <placeholder[superbvote_votes]> / 200
        - Make the Meadows come alive with the sound of music from a Jukebox: <player.has_advancement[adventure/play_jukebox_in_meadows].if_null[false]>
        - Look at a Ghast through a Spyglass: <player.has_advancement[adventure/spyglass_at_ghast].if_null[false]>
      commands:
        - money take <player.name> 280000

    Amethyst III:
      requirements:
        - Money: <player.money.if_null[0]> / 300000
        - Votes: <placeholder[superbvote_votes]> / 210
        - Protect a Villager from an undesired shock without starting a fire: <player.has_advancement[adventure/lightning_rod_with_villager_no_fire].if_null[false]>
        - Take a Strider for a loooong ride on a lava lake in the Overworld: <player.has_advancement[nether/ride_strider_in_overworld_lava].if_null[false]>
      commands:
        - money take <player.name> 300000

    Amethyst IV:
      requirements:
        - Money: <player.money.if_null[0]> / 310000
        - Votes: <placeholder[superbvote_votes]> / 215
        - Be near a Crafter when it crafts a Crafter: <player.has_advancement[adventure/crafters_crafting_crafters].if_null[false]>
        - Step foot in a Trial Chamber: <player.has_advancement[adventure/minecraft_trials_edition].if_null[false]>
      commands:
        - money take <player.name> 310000

    Amethyst V:
      requirements:
        - Money: <player.money.if_null[0]> / 325000
        - Votes: <placeholder[superbvote_votes]> / 218
        - Get Armadillo Scutes from an Armadillo using a Brush: <player.has_advancement[adventure/brush_armadillo].if_null[false]>
        - Scrape a Copper Bulb with an Axe to make it brighter: <player.has_advancement[adventure/lighten_up].if_null[false]>
      commands:
        - money take <player.name> 310000

    Diamond I:
      requirements:
        - Money: <player.money.if_null[0]> / 320000
        - Votes: <placeholder[superbvote_votes]> / 220
        - Kill a Skeleton from at least 50 meters away: <player.has_advancement[adventure/sniper_duel].if_null[false]>
        - Hit the bullseye of a Target block from at least 30 meters away: <player.has_advancement[adventure/bullseye].if_null[false]>
      commands:
        - money take <player.name> 320000

    Diamond II:
      requirements:
        - Money: <player.money.if_null[0]> / 340000
        - Votes: <placeholder[superbvote_votes]> / 230
        - Successfully defend a village from a raid: <player.has_advancement[adventure/hero_of_the_village].if_null[false]>
        - Use a Totem of Undying to cheat death: <player.has_advancement[adventure/totem_of_undying].if_null[false]>
      commands:
        - money take <player.name> 340000

    Diamond III:
      requirements:
        - Money: <player.money.if_null[0]> / 360000
        - Votes: <placeholder[superbvote_votes]> / 240
        - Summon the Wither: <player.has_advancement[nether/summon_wither].if_null[false]>
        - Bring a Beacon to full power: <player.has_advancement[nether/create_full_beacon].if_null[false]>
      commands:
        - money take <player.name> 360000

    Diamond IV:
      requirements:
        - Money: <player.money.if_null[0]> / 380000
        - Votes: <placeholder[superbvote_votes]> / 250
        - Rescue a Ghast from the Nether, bring it safely home to the Overworld... and then kill it: <player.has_advancement[nether/uneasy_alliance].if_null[false]>
        - Use the Nether to travel 7 km in the Overworld: <player.has_advancement[nether/fast_travel].if_null[false]>
      commands:
        - money take <player.name> 380000

    Diamond V:
      requirements:
        - Money: <player.money.if_null[0]> / 400000
        - Votes: <placeholder[superbvote_votes]> / 260
        - Levitate up 50 blocks from the attacks of a Shulker: <player.has_advancement[end/levitate].if_null[false]>
        - Have every potion effect applied at the same time: <player.has_advancement[nether/all_potions].if_null[false]>
      commands:
        - money take <player.name> 400000

    Netherite I:
      requirements:
        - Money: <player.money.if_null[0]> / 500000
        - Votes: <placeholder[superbvote_votes]> / 270
        - Walk on Powder Snow... without sinking in it: <player.has_advancement[adventure/walk_on_powder_snow_with_leather_boots].if_null[false]>
        - Kill five unique mobs with one crossbow shot: <player.has_advancement[adventure/arbalistic].if_null[false]>
      commands:
        - money take <player.name> 500000

    Netherite II:
      requirements:
        - Money: <player.money.if_null[0]> / 600000
        - Votes: <placeholder[superbvote_votes]> / 280
        - Have an Allay drop a Cake at a Note Block: <player.has_advancement[husbandry/allay_deliver_cake_to_note_block].if_null[false]>
        - Repair a damaged Wolf Armor using Armadillo Scutes: <player.has_advancement[husbandry/repair_wolf_armor].if_null[false]>
      commands:
        - money take <player.name> 600000

    Netherite III:
      requirements:
        - Money: <player.money.if_null[0]> / 700000
        - Votes: <placeholder[superbvote_votes]> / 290
        - Plant any Sniffer seed: <player.has_advancement[husbandry/plant_any_sniffer_seed].if_null[false]>
        - Make the text of any kind of sign glow: <player.has_advancement[adventure/make_glow_item_frame].if_null[false]>
        - Throw a Trident at something: Throwing away your only weapon is not a good idea.: <player.has_advancement[adventure/throw_trident].if_null[false]>
      commands:
        - money take <player.name> 700000

    Netherite IV:
      requirements:
        - Money: <player.money.if_null[0]> / 800000
        - Votes: <placeholder[superbvote_votes]> / 300
        - Have every effect applied at the same time: <player.has_advancement[adventure/how_did_we_get_here].if_null[false]>
        - Breed all the animals!: <player.has_advancement[husbandry/breed_all_animals].if_null[false]>
        - Use a Wind Charge to launch yourself upwards 8 blocks: <player.has_advancement[adventure/who_needs_rockets].if_null[false]>
        - Use a Trial Key on a Vault: <player.has_advancement[adventure/under_lock_and_key].if_null[false]>
        - Use an Ominous Trial Key on an Ominous Vault: <player.has_advancement[adventure/revaulting].if_null[false]>
        - Kill a Breeze with a deflected Breeze-shot Wind ChargeKill a Breeze with a deflected Breeze-shot Wind Charge: <player.has_advancement[adventure/blowback].if_null[false]>
        - Deal 50 hearts of damage in a single hit using the Mace: <player.has_advancement[adventure/overoverkill].if_null[false]>
      commands:
        - money take <player.name> 800000

