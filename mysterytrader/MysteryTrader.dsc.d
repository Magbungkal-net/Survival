# » -------------------- «
# ┋
# ┋ M y s t e r y T r a d e r
# ┋
# ┋ @author akiakyo, jefphensmirtz
# ┋ @date 2024-04-13
# ┋
# » -------------------- «

# command to open the shop
mt_prefix:
    debug: false
    type: procedure
    script:
    - determine <&8>[<&gradient[from=#7C4751;to=#7C4751]>SYSTEM<&8>]

mystery_trader_gui_command:
    debug: false
    type: command
    name: mysterytrader
    usage: /mysterytrader
    description: Does something
    aliases:
    - mtrader
    - mysteryshop
    - mshop
    # permission: mysterytrader.open
    permission: denizen.admin
    permission message: <proc[mt_prefix]> <&f>Mystery Shop is currently on maintenance.
    script:
    # initialize ( for first script upload )
    - if <server.flag[mysterytrader.items_to_sell].if_null[null]> == null:
        - run mystery_trader_reset
    - if <server.flag[mysterytrader.reset_time].if_null[null]> == null:
        - run mystery_trader_reset_time
    - inventory open destination:mystery_trader_inventory
    - playsound <player.location> sound:ENTITY_PHANTOM_FLAP pitch:1 volume:1

mystery_trader_inventory:
    debug: false
    type: inventory
    title: Mystery Trader
    inventory: chest
    size: 54
    gui: true
    procedural items:
    - define inventory <list>
    - define items_list <server.flag[mysterytrader.items_to_sell]>
    - define items_data <script[mystery_trader_data].data_key[shop]>

    - foreach <[items_list]> as:item:
        - define item_data <[items_data].get[<[item]>]>
        - define item_obj <[item_data].get[item].as[item].if_null[null]>
        - if <[item_obj]> == null:
            - announce to_console "[Mystery Trader] Item <[item]> is invalid!"
            - foreach next

        - define lore <[item_obj].lore.if_null[<list>]>
        - define lore_size <[lore].size.if_null[1]>
        - define original_price <[item_data].get[base_price]>
        - define final_price <server.flag[mysterytrader.<[item]>]>
        - define discount_percent <[original_price].sub[<[final_price]>].div[<[original_price]>].mul[100].round>%
        - define currency <[item_data].get[currency]>

        - define currency_name Money
        - if <[currency]> == placeholder:
            - define currency_name <[item_data].get[currency-name]>

        - define discount_lore "<empty>|<gold>» <yellow><[discount_percent]> discount off <gold>«"
        - define price_lore "<empty>|<gray>Price: <green><[final_price].format_number>|<gray>Original Price: <&a><[original_price].format_number>"
        - define currency_lore "<[price_lore]>|<gray>Currency: <&gradient[from=#FFEEA2;to=#FFEEA2]><[currency_name]>|<empty>"
        - define lore <[lore].insert[<[discount_lore]>].at[<[lore_size].add[0]>]>
        - define lore <[lore].insert[<[currency_lore]>].at[<[lore_size].add[2]>]>

        - define item_obj <[item_obj].with[lore=<[lore]>]>
        - define item_obj <[item_obj].with_flag[mysterytrader.item:<[item]>]>
        - define inventory <[inventory].include[<[item_obj]>]>

    - determine <[inventory]>
    definitions:
        a: air
        ?: question_mark
    slots:
    - [a] [a] [a] [a] [a] [a] [a] [a] [a]
    - [a] [] [] [] [] [] [] [] [a]
    - [a] [] [] [] [] [] [] [] [a]
    - [a] [] [] [] [] [] [] [] [a]
    - [a] [] [] [] [] [] [] [] [a]
    - [a] [a] [a] [a] [?] [a] [a] [a] [a]

mystery_trader_events_handler:
    type: world
    debug: false
    events:
        on delta time minutely:
        - if !<server.has_flag[mysterytrader.reset_time]>:
            - run mystery_trader_reset_time

        - define reset_time <server.flag[mysterytrader.reset_time]>
        - define time_now <util.time_now>
        - if <[reset_time].is_before[<[time_now]>]>:
            - run mystery_trader_reset_time

        # handles the inventory clicks (buying items)
        after player clicks in mystery_trader_inventory:
        - define item <context.item>
        - if <[item].has_flag[mysterytrader.item]>:
            - define item_id <[item].flag[mysterytrader.item]>
            - define item_data <script[mystery_trader_data].parsed_key[shop].get[<[item_id]>]>

            - define final_price <server.flag[mysterytrader.<[item_id]>]>
            - define currency <[item_data].get[currency]>

            # define player money as currency
            # or as placeholder depending on the req
            - define currency_name Money
            - define player_currency <player.money>
            - if <[currency]> == placeholder:
                - define placeholder <[item_data].get[placeholder]>
                - define player_currency <placeholder[<[placeholder]>].if_null[null]>
                - define currency_name <[item_data].get[currency-name]>
                - if <[player_currency]> == null:
                    - announce to_console "[Mystery Trader] Placeholder value not found for <[placeholder]>!"
                    - inventory close
                    - stop

            - if <[player_currency]> < <[final_price]>:
                # - narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <white>You don't have enough <[currency_name]> to buy this item!"
                - inventory close
                - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
                - define text <list[<&0>Hey <player.name>!<n><n>You do not have enough <&c><&l><[currency_name]> <&r>to purchase this item.<n><n><&r>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store.].click_url[https://store.magbungkal.net]>]>
                - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
                - stop

            # sucessful purchase
            - if <[currency_name]> == money:
                - money take quantity:<[final_price]>
            - else:
                - execute as_server "magbungkalcoins take <player.name> <[final_price]>"

            - define commands <[item_data].get[command]>
            - foreach <[commands]> as:command:
                - execute as_server <[command].parsed>
            - narrate "<proc[mt_prefix]> <white>You have successfully bought the item!"
            - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1 volume:1
            - stop

mystery_trader_reset:
    type: task
    debug: false
    script:
    - define items_data <script[mystery_trader_data].data_key[shop]>
    - define items_count <script[mystery_trader_data].data_key[item-count]>
    - define selected_items <[items_data].keys.random[<[items_count]>]>
    - foreach <[selected_items]> as:item:
        - define item_data <[items_data].get[<[item]>]>
        - define base_price <[item_data].get[base_price]>
        - define discount_range <[item_data].get[discount_range].split[-]>
        - define min_discount <[discount_range].get[1]>
        - define max_discount <[discount_range].get[2]>
        - define discount_percent <util.random.decimal[<[min_discount]>].to[<[max_discount]>].round_to[1]>
        - define final_price <[base_price].mul[<element[1].sub[<[discount_percent].div[100]>]>].round>
        - flag server mysterytrader.<[item]>:<[final_price]>

    - flag server mysterytrader.items_to_sell:<[selected_items]>
    - announce to_console "[Mystery Trader] Shop has been reset with new discounts!"
    - announce "<proc[mt_prefix]> <&f>Mystery Shop has been reset! <&e>New discounts applied!"

mystery_trader_reset_time:
    type: task
    debug: false
    script:
    - define reset_time <script[mystery_trader_data].data_key[reset-time].as[duration]>
    - define time_now <util.time_now>
    - define new_time <[time_now].add[<[reset_time]>]>
    - flag server mysterytrader.reset_time:<[new_time]>
    - announce to_console "[Mystery Trader] Reset time has been set to <[new_time].format>!"
    # - definemap embed_map:
    #     # author_name: Mystery Trader
    #     # author_icon_url: https://i.imgur.com/g3cM2l7.png
    #     # title:
    #     color: orange
    #     description: "```yml<n>[Mystery Trader] Reset time has been set to <[new_time].format>!```"
    #     # footer: Magbungkal [Survival]
    # - define embed <discord_embed.with_map[<[embed_map]>]>
    # - discordmessage id:magbungkal channel:1226947421175545986 <[embed]>

player_reset_mystery_trader_command:
    debug: false
    type: command
    name: resetmysterytrader
    usage: /resetmysterytrader
    description: Reset mystery shop
    aliases:
    - resetmtrader
    - resetmysteryshop
    - resetmshop
    # permission: mysterytrader.open
    permission: denizen.admin
    script:
    - if <placeholder[coinsengine_balance_raw_MagbungkalCoins]> >= 2500:
        - narrate "<proc[mt_prefix]> <&f>Successfully paid <&e><element[2500].format_number> coins <&f>to reset Mystery Trader."
        - execute as_server "magbungkalcoins take <player.name> 2500"
        - announce "<proc[mt_prefix]> <&b><player.name> <&f>reset the Mystery Shop"
        - inject mystery_trader_reset
    - else:
        - narrate "<proc[mt_prefix]> <&f>You don't have enough coins to reset the Mystery Trader!"
        - playsound <player.location> sound:BLOCK_BELL_USE pitch:1 volume:1
        - define text <list[<&0>Hey <player.name>!<n><n>You do not have <&l><&c><element[2500].format_number> coins <&0>to reset the Mystery Trader!<n><n>Top up tokens on our webstore: <element[<&6><&l><&n>store.magbungkal.net].custom_color[emphasis].on_hover[<&f>Click to visit the store].click_url[https://store.magbungkal.net]>]>
        - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
