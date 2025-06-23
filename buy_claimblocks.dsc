#-------------------------------------------------------
# Author: sieccc
# Contributor: akiakyo
# Description: Buy claim blocks
# Version: 1.2
# Date Published: ?
# Last Updated: 02-23-2025
# Update:
# (06-22-2025) v1.2
# - Code cleanup
# (02-24-2025) v1.2
# - Use data map key instead of single data key
# - Use data script containers value for custom item display name and lore
# Known Issues: none
#-------------------------------------------------------
claim_blocks_data:
  type: data
  first_claimblock:
    cost: 500
    claimblocks: 500
  second_claimblock:
    cost: 2500
    claimblocks: 2500
  third_claimblock:
    cost: 5000
    claimblocks: 5000

buy_claimblocks_command:
  debug: false
  type: command
  description: Open GUI for buy claim blocks
  name: buyclaimblocks
  usage: /buyclaimblocks
  # permission: experimental.script.shopclaimblocks
  aliases:
    - bclaimblocks
    - bcb
  script:
  - inventory open d:buy_claimblocks_gui

buy_claimblocks_gui:
  debug: false
  type: inventory
  inventory: chest
  title: <&6>Buy claimblocks
  gui: true
  definitions:
    ?: <item[claimblocks_fill]>
    1: <item[first_claimblock_item]>
    2: <item[second_claimblock_item]>
    3: <item[third_claimblock_item]>
  slots:
    - [?] [?] [?] [?] [?] [?] [?] [?] [?]
    - [?] [?] [1] [?] [2] [?] [3] [?] [?]
    - [?] [?] [?] [?] [?] [?] [?] [?] [?]

claimblocks_fill:
  type: item
  material: gray_stained_glass_pane
  display name: <&7>
  mechanisms:
    hides: ALL

first_claimblock_item:
  type: item
  material: grass_block
  display name: <&2>Cost <&e>₱<script[claim_blocks_data].data_key[first_claimblock].get[cost].format_number>
  lore:
  - <&f>You'll receive <&b><script[claim_blocks_data].data_key[first_claimblock].get[claimblocks].format_number> <&f>claimblocks
  mechanisms:
    hides: ALL
first_claimblock_item_display:
  type: item
  material: grass_block
  display name: <&2>Cost <&e>₱<script[claim_blocks_data].data_key[first_claimblock].get[cost].format_number>
  lore:
  - <&f>You'll receive <&b><script[claim_blocks_data].data_key[first_claimblock].get[claimblocks].format_number> <&f>claimblocks
  mechanisms:
    hides: ALL

second_claimblock_item:
  type: item
  material: grass_block
  display name: <&2>Cost <&e>₱<script[claim_blocks_data].data_key[second_claimblock].get[cost].format_number>
  lore:
  - <&f>You'll receive <&b><script[claim_blocks_data].data_key[second_claimblock].get[claimblocks].format_number> <&f>claimblocks
  mechanisms:
    hides: ALL
second_claimblock_item_display:
  type: item
  material: grass_block
  display name: <&2>Cost <&e>₱<script[claim_blocks_data].data_key[second_claimblock].get[cost].format_number>
  lore:
  - <&f>You'll receive <&b><script[claim_blocks_data].data_key[second_claimblock].get[claimblocks].format_number> <&f>claimblocks
  mechanisms:
    hides: ALL

third_claimblock_item:
  type: item
  material: grass_block
  display name: <&2>Cost <&e>₱<script[claim_blocks_data].data_key[third_claimblock].get[cost].format_number>
  lore:
  - <&f>You'll receive <&b><script[claim_blocks_data].data_key[third_claimblock].get[claimblocks].format_number> <&f>claimblocks
  mechanisms:
    hides: ALL
third_claimblock_item_display:
  type: item
  material: grass_block
  display name: <&2>Cost <&e>₱<script[claim_blocks_data].data_key[third_claimblock].get[cost].format_number>
  lore:
  - <&f>You'll receive <&b><script[claim_blocks_data].data_key[third_claimblock].get[claimblocks].format_number> <&f>claimblocks
  mechanisms:
    hides: ALL

buy_claimblocks_handler:
  debug: false
  type: world
  events:
    on player drags in buy_claimblocks_gui:
    - determine cancelled
    on player clicks claimblocks_fill in buy_claimblocks_gui:
    - determine cancelled
    on player clicks first_claimblock_item|second_claimblock_item|third_claimblock_item|claimblocks_confirm_button|claimblocks_cancel_button in buy_claimblocks_gui:
    - define purchaseable _false
    - define balance <placeholder[cmi_user_balance]>
    - if <context.item> == <item[first_claimblock_item]>:
      - if <[balance]> >= 500:
        - flag player claimblock_purchase_key:first_claimblock
        - flag player claimblock_purchase_value:<script[claim_blocks_data].data_key[first_claimblock].get[cost]>
        - inventory set o:<item[first_claimblock_item_display]> d:<context.inventory> slot:14
      - else:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You do not have enough balance! Your current balance is: ₱<[balance].format_number>"
    - else if <context.item> == <item[second_claimblock_item]>:
      - if <[balance]> >= 2500:
        - flag player claimblock_purchase_key:second_claimblock
        - flag player claimblock_purchase_value:<script[claim_blocks_data].data_key[second_claimblock].get[cost]>
        - inventory set o:<item[second_claimblock_item_display]> d:<context.inventory> slot:14
      - else:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You do not have enough balance! Your current balance is: ₱<[balance].format_number>"
    - else if <context.item> == <item[third_claimblock_item]>:
      - if <[balance]> >= 5000:
        - flag player claimblock_purchase_key:third_claimblock
        - flag player claimblock_purchase_value:<script[claim_blocks_data].data_key[third_claimblock].get[cost]>
        - inventory set o:<item[third_claimblock_item_display]> d:<context.inventory> slot:14
      - else:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You do not have enough balance! Your current balance is: ₱<[balance].format_number>"

    - if <player.flag[claimblock_purchase_key].exists>:
      - inventory set o:<item[claimblocks_confirm_button]> d:<context.inventory> slot:12
      - inventory set o:<item[claimblocks_fill]> d:<context.inventory> slot:13
      - inventory set o:<item[claimblocks_fill]> d:<context.inventory> slot:15
      - inventory set o:<item[claimblocks_cancel_button]> d:<context.inventory> slot:16

    - if <context.item> == <item[claimblocks_confirm_button]>:
      - define claimblock_amount <script[claim_blocks_data].data_key[<player.flag[claimblock_purchase_key]>].get[claimblocks]>
      - define value <player.flag[claimblock_purchase_value]>
      - execute as_server "money take <player.name> <[value]>"
      - execute as_server "acb <player.name> <[claimblock_amount]>"
      - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Successfully purchased <[claimblock_amount]> <&f>claim blocks. New total claimblocks <&b><placeholder[griefprevention_remainingclaims]>"

      - flag player claimblock_purchase_key:!
      - flag player claimblock_purchase_value:!
      - inventory close

    - if <context.item> == <item[claimblocks_cancel_button]>:
      - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Purchase canceled as you exited the confirmation screen."
      - flag player claimblock_purchase_key:!
      - flag player claimblock_purchase_value:!
      - inventory close

claimblocks_confirm_button:
  type: item
  material: lime_concrete
  display name: <&a>Confirm Purchase
  mechanisms:
    hides: ALL

claimblocks_cancel_button:
  type: item
  material: red_concrete
  display name: <&f>Cancel Purchase
  mechanisms:
    hides: ALL