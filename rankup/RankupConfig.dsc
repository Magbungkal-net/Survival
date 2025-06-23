rankup_data:
  type: data
  ranks:
    default:
      name: Default
      icon: coal
      requirements:
        money: 1

    coal:
      name: Coal
      icon: coal
      requirements:
        votecount: 1
        money: 25
        mob_kill:
          Chicken: 1
          Sheep: 1
          Cow: 1
        mine_block:
          stone: 10
        advancements:
          story/root: Make a crafting table

    copperi:
      name: Copper I
      icon: copper_ingot
      requirements:
        votecount: 5
        money: 100
        walk: 3
        breed: 5
        advancements:
          adventure/sleep_in_bed: Sleep in a bed
          story/mine_stone: Mine a stone

    copperii:
      name: Copper II
      icon: copper_ingot
      requirements:
        votecount: 10
        money: 500
        catch_fish: 5
        advancements:
          story/iron_tools: Make an iron pickaxe
          story/upgrade_tools: Getting an Upgrade
          adventure/kill_a_mob: Monster Hunter

    copperiii:
      name: Copper III
      icon: copper_ingot
      requirements:
        votecount: 20
        money: 2000
        mine_block:
          stone: 100
          iron_ore: 35
          netherrack: 150
        catch_fish: 30
        advancements:
          adventure/shoot_arrow: Shoot something with an arrow
          story/smelt_iron: Acquire Hardware
          story/iron_tools: Isn't It Iron Pick
          story/obtain_armor: Suit Up

    copperiv:
      name: Copper IV
      icon: copper_ingot
      requirements:
        votecount: 30
        money: 3000
        mob_kill:
          Cow: 30
          Sheep: 30
          Pig: 30
        walk: 30
        advancements:
          husbandry/fishy_business: Catch a fish
          adventure/shoot_arrow: Take Aim
          story/deflect_arrow: Not Today, Thank you

    copperv:
      name: Copper V
      icon: skeleton_skull
      heart: 22
      requirements:
        votecount: 40
        money: 5000
        mob_kill:
          Zombie: 30
          Skeleton: 30
          Spider: 30
        mine_block:
          stone: 200
          gold_ore: 50
          netherrack: 200
        catch_fish: 50
        advancements:
          husbandry/froglights: Have all Froglights in your inventory
          husbandry/breed_an_animal: Best Friends Forever
          husbandry/fishy_business: Fishy Business

    ironi:
      name: Iron I
      icon: iron_ingot
      requirements:
        votecount: 50
        money: 7500
        mob_kill:
          Enderman: 30
          Creeper: 50
          Phantom: 10
        advancements:
          story/mine_diamond: Acquire Diamonds
          story/shiny_gear: Cover Me with Diamonds
          story/enchant_item: Enchanter

    ironii:
      name: Iron II
      icon: iron_ingot
      requirements:
        votecount: 60
        money: 8000
        mob_kill:
          Zombie: 150
          Skeleton: 150
          Spider: 150
        mine_block:
          stone: 950
          diamond_ore: 15
          basalt: 500
          nether_quartz_ore: 125
        advancements:
          husbandry/wax_off: Use an axe to revert a waxed copper block
          adventure/ol_betsy: Ol' Betsy
          adventure/voluntary_exile: Voluntary Exile

    ironiii:
      name: Iron III
      icon: axolotl_bucket
      requirements:
        votecount: 70
        money: 9000
        mob_kill:
          Enderman: 65
        mine_block:
          stone: 1500
        walk: 100
        advancements:
          adventure/whos_the_pillager_now: Who's the Pillager Now?
          adventure/hero_of_the_village: Hero of the Village
          adventure/lighten_up: Lighten Up

    ironiv:
      name: Iron IV
      icon: iron_ingot
      requirements:
        votecount: 80
        money: 11000
        mob_kill:
          Ender_Dragon: 1
        mine_block:
          stone: 500
          emerald_ore: 15
          basalt: 500
          nether_gold_ore: 100
          crying_obsidian: 350
          gilded_blackstone: 350
          end_stone_bricks: 750
        advancements:
          adventure/trade: What a Deal!
          adventure/lightning_rod_with_villager_no_fire: Surge Protector

    ironv:
      name: Iron V
      icon: iron_ingot
      heart: 24
      requirements:
        votecount: 90
        money: 12500
        mob_kill:
          Zombified_Piglin: 50
          Piglin: 50
        mine_block:
          obsidian: 150
          crying_obsidian: 100
        advancements:
          story/lava_bucket: Hot Stuff
          story/form_obsidian: Ice Bucket Challenge
          story/enter_the_nether: We Need to Go Deeper

    goldi:
      name: Gold I
      icon: gold_ingot
      requirements:
        votecount: 100
        money: 40000
        mob_kill:
          Zombified_Piglin: 200
          Piglin: 250
        mine_block:
          netherrack: 1000
          crimson_nylium: 150
          warped_nylium: 150
          soul_sand: 500
          basalt: 200
        advancements:
          nether/explore_nether: Hot Tourist Destinations
          nether/fast_travel: Subspace Bubble

    goldii:
      name: Gold II
      icon: gold_ingot
      requirements:
        votecount: 120
        money: 50000
        mob_kill:
          Zombified_Piglin: 500
          Piglin: 700
        mine_block:
          nether_bricks: 300
          netherrack: 1500
        advancements:
          nether/find_fortress: A terrible Fortress
          nether/obtain_blaze_rod: Into Fire
          nether/get_wither_skull: Spooky Scary Skeleton

    goldiii:
      name: Gold III
      icon: gold_ingot
      requirements:
        votecount: 160
        money: 60000
        mob_kill:
          Strider: 300
          Breeze: 10
        mine_block:
          nether_bricks: 700
          netherrack: 3000
        advancements:
          # nether/brew_potion: Local Brewery --> Cannot do in Bedrock Edition/GeyserMC
          nether/ride_strider: This Boat Has Legs
          adventure/revaulting: Revaulting

    goldiv:
      name: Gold IV
      icon: gold_ingot
      requirements:
        votecount: 180
        money: 60000
        mob_kill:
          Piglin_Brute: 150
        mine_block:
          blackstone: 500
          gilded_blackstone: 250
        advancements:
          nether/distract_piglin: Oh Shiny
          nether/find_bastion: Those Were the Days
          nether/loot_bastion: War Pigs

    goldv:
      name: Gold V
      icon: gold_ingot
      heart: 26
      requirements:
        votecount: 200
        money: 70000
        mob_kill:
          Piglin_Brute: 150
        mine_block:
          blackstone: 500
          gilded_blackstone: 250
        advancements:
          nether/distract_piglin: Oh Shiny
          nether/find_bastion: Those Were the Days
          nether/loot_bastion: War Pigs

    lapisi:
      name: Lapis I
      icon: lapis_lazuli
      requirements:
        votecount: 210
        money: 100000
        mob_kill:
          Goat: 50
          Bogged: 40
        mine_block:
          grass_block: 1000
          dirt: 3000
          stone: 5000
        advancements:
          adventure/walk_on_powder_snow_with_leather_boots: Light as a Rabbit
          adventure/play_jukebox_in_meadows: Sound of Music
          husbandry/ride_a_boat_with_a_goat: Whatever Floats Your Goat!

    lapisii:
      name: Lapis II
      icon: lapis_lazuli
      requirements:
        votecount: 220
        money: 120000
        mob_kill:
          Glow_Squid: 50
          Parrot: 50
          Breeze: 10
        # mine_block:
        #   grass_block: 1000
        #   dirt: 3000
        #   stone: 5000
        advancements:
          husbandry/make_a_sign_glow: Glow and Behold!
          story/cure_zombie_villager: Zombie Doctor
          adventure/spyglass_at_parrot: Is it a Bird?

    lapisiii:
      name: Lapis III
      icon: lapis_lazuli
      requirements:
        votecount: 230
        money: 140000
        mob_kill:
          Tadpole: 50
          Bee: 100
        mine_block:
          grass_block: 1500
          dirt: 5000
          stone: 10000
        advancements:
          husbandry/tadpole_in_a_bucket: Bukkit Bukkit
          husbandry/silk_touch_nest: Total Beelocation
          husbandry/remove_wolf_armor: Shear Brilliance

    lapisiv:
      name: Lapis IV
      icon: lapis_lazuli
      requirements:
        votecount: 240
        money: 160000
        mob_kill:
          Bee: 150
        # mine_block:
        #   grass_block: 1500
        #   dirt: 5000
        #   stone: 10000
        advancements:
          husbandry/safely_harvest_honey: Bee Our Guest
          husbandry/wax_on: Wax On
          husbandry/wax_off: Wax Off

    lapisv:
      name: Lapis V
      icon: lapis_lazuli
      heart: 28
      requirements:
        votecount: 250
        money: 180000
        mob_kill:
          Wither: 5
          Wither_Skeleton: 10
        mine_block:
          soul_sand: 1000
          ancient_debris: 100
          netherrack: 10000
        advancements:
          nether/netherite_armor: Cover Me in Debris
          nether/summon_wither: Withering Heights
          adventure/brush_armadillo: Isn't it Scute

    amethysti:
      name: Amethyst I
      icon: amethyst_shard
      requirements:
        votecount: 260
        money: 200000
        mob_kill:
          Wither: 10
          Wither_Skeleton: 25
          Ghast: 10
        mine_block:
          crimson_nylium: 500
          warped_nylium: 500
        advancements:
          nether/return_to_sender: Return to Sender
          adventure/spyglass_at_ghast: Is It a Balloon?
          adventure/overoverkill: Over-Overkill

    amethystii:
      name: Amethyst II
      icon: amethyst_shard
      requirements:
        votecount: 270
        money: 400000
        mob_kill:
          Ender_Dragon: 5
          Enderman: 100
        mine_block:
          End_Stone: 1000
          Obsidian: 500
        advancements:
          story/follow_ender_eye: End Spy
          story/enter_the_end: The End?
          adventure/crafters_crafting_crafters: Crafters Crafting Crafters

    amethystiii:
      name: Amethyst III
      icon: amethyst_shard
      requirements:
        votecount: 280
        money: 600000
        mob_kill:
          Enderman: 250
        mine_block:
          End_Stone: 1000
          Obsidian: 500
        catch_fish: 50
        advancements:
          end/kill_dragon: Free the End
          end/dragon_egg: The Next Generation
          end/dragon_breath: You Need a Mint
          adventure/spyglass_at_dragon: Is It a Plane?

    amethystiv:
      name: Amethyst IV
      icon: amethyst_shard
      requirements:
        votecount: 280
        money: 800000
        mob_kill:
          Shulker: 100
          Breeze: 30
        mine_block:
          Purpur_Block: 500
        catch_fish: 65
        advancements:
          end/enter_end_gateway: Remote Gateway
          end/find_end_city: The City at the End of the Game
          adventure/who_needs_rockets: Who Needs Rockets?

    amethystv:
      name: Amethyst V
      icon: amethyst_shard
      heart: 30
      requirements:
        votecount: 300
        money: 1000000
        mob_kill:
          Ender_Dragon: 10
          Enderman: 300
          Shulker: 150
        mine_block:
          Purpur_Block: 1000
        advancements:
          end/elytra: Sky's the Limit
          end/levitate: Great View From Up Here
          nether/create_beacon: Bring Home the Beacon
          nether/create_full_beacon: Beaconator

    diamondi:
      name: Diamond I
      icon: diamond
      requirements:
        votecount: 310
        money: 1200000
        mob_kill:
          Warden: 5
        mine_block:
          sculk: 100
          Sculk_Catalyst: 50
          Sculk_Shrieker: 5
          Sculk_Sensor: 15
        advancements:
          adventure/avoid_vibration: Sneak 100
          adventure/throw_trident: A throwaway Joke
          adventure/kill_mob_near_sculk_catalyst: It Spreads
          adventure/totem_of_undying: Postmortal

    diamondii:
      name: Diamond II
      icon: diamond
      requirements:
        votecount: 320
        money: 1400000
        mob_kill:
          Phantom: 100
          Guardian: 75
          Elder_Guardian: 5
        mine_block:
          Terracotta: 1000
          Sand: 5000
          Red_Sand: 2500
        advancements:
          adventure/two_birds_one_arrow: Two Birds, One Arrow
          nether/all_potions: A Furious Cocktail
          adventure/under_lock_and_key: Under Lock and Key

    diamondiii:
      name: Diamond III
      icon: diamond
      requirements:
        votecount: 340
        money: 1600000
        mob_kill:
          Villager: 50
          Iron_Golem: 20
          bogged: 70
        mine_block:
          Snow_Block: 500
          Spruce_Log: 1000
        advancements:
          adventure/very_very_frightening: Very Very Frightening
          adventure/trade_at_world_height: Star Trader
          husbandry/obtain_netherite_hoe: Serious Dedication

    diamondiv:
      name: Diamond IV
      icon: diamond
      heart: 32
      requirements:
        votecount: 360
        money: 1800000
        mob_kill:
          Strider: 300
          Shulker: 500
          Frog: 100
        mine_block:
          Crying_Obsidian: 1000
          Purpur_Block: 1500
        advancements:
          nether/ride_strider_in_overworld_lava: Feels Like Home
          husbandry/allay_deliver_item_to_player: You've Got a Friend in Me
          husbandry/whole_pack: The Whole Pack

    diamondv:
      name: Diamond V
      icon: diamond
      heart: 36
      requirements:
        votecount: 380
        money: 2000000
        mob_kill:
          Skeleton: 10000
          Zombie: 10000
          Creeper: 5000
        mine_block:
          Stone: 20000
        advancements:
          adventure/sniper_duel: Sniper Duel
          adventure/bullseye: Bullseye
          adventure/honey_block_slide: Sticky Situtation

    netheritei:
      name: Netherite I
      icon: netherite_ingot
      heart: 37
      requirements:
        votecount: 400
        money: 4000000
        mob_kill:
          Cod: 500
          Frog: 250
        mine_block:
          Nether_Quartz_Ore: 1000
          Nether_Gold_Ore: 1000
          Deepslate_Diamond_Ore: 500
          Ancient_Debris: 1000
        advancements:
          husbandry/complete_catalogue: A complete Catalogue
          nether/use_lodestone: Country Lode, Take Me Home
          husbandry/froglights: With Our Powers Combined!
          adventure/minecraft_trials_edition: Minecraft Trials Edition

    netheriteii:
      name: Netherite II
      icon: netherite_ingot
      heart: 38
      requirements:
        votecount: 450
        money: 6000000
        mob_kill:
          Warden: 20
          Ender_Dragon: 50
          Wither: 30
        mine_block:
          Nether_Quartz_Ore: 1000
          Nether_Gold_Ore: 1000
          Deepslate_Diamond_Ore: 500
          Ancient_Debris: 1000
        advancements:
          husbandry/kill_axolotl_target: The Healing Power of Friendship
          husbandry/axolotl_in_a_bucket: The Cutest Predator
          husbandry/balanced_diet: A Balanced Diet
          adventure/blowback: Blow Back

    netheriteiii:
      name: Netherite III
      icon: netherite_ingot
      heart: 39
      requirements:
        votecount: 500
        money: 6000000
        mob_kill:
          Warden: 20
          Ender_Dragon: 50
          Wither: 30
        mine_block:
          Nether_Quartz_Ore: 1000
          Nether_Gold_Ore: 1000
          Deepslate_Diamond_Ore: 500
          Ancient_Debris: 1000
        advancements:
          adventure/arbalistic: Arbalistic
          husbandry/bred_all_animals: Two by Two
          end/respawn_dragon: The End... Again...

    netheriteiv:
      name: Netherite IV
      icon: netherite_ingot
      heart: 40
      requirements:
        votecount: 550
        money: 8000000
        mob_kill:
          Warden: 100
          Ender_Dragon: 500
          Wither: 200
        # mine_block:
        #   Nether_Quartz_Ore: 1000
        #   Nether_Gold_Ore: 1000
        #   Deepslate_Diamond_Ore: 500
        #   Ancient_Debris: 1000
        advancements:
          adventure/kill_all_mobs: Monster Hunter
          adventure/adventuring_time: Adventuring Time
          husbandry/leash_all_frog_variants: When the Squad Hops into Town
          nether/uneasy_alliance: Uneasy Alliance
          nether/all_effects: How Did We Get Here?

    # netheritev:
    #   name: Netherite V
    #   icon: netherite_ingot
    #   requirements:
    #     votecount: 550
    #     money: 100000000
    #     mob_kill:
    #       Warden: 100
    #       Ender_Dragon: 500
    #       Wither: 200
    #     # mine_block:
    #     #   Nether_Quartz_Ore: 1000
    #     #   Nether_Gold_Ore: 1000
    #     #   Deepslate_Diamond_Ore: 500
    #     #   Ancient_Debris: 1000
    #     advancements:
    #       nether/all_effects: How Did We Get Here?