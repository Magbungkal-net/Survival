#-------------------------------------------------------
# Author: sieccc
# Description: Custom crate key shop GUI
# Version: 1.4
# Date Published: ?
# Last Updated: 02-22-2025
# Update:
# () v1.0?
# - Initial release
# (02-22-2025) v1.1
# - Code cleanup
# (02-23-2025) v1.2
# - Improved code readability
# - Remove confirmation gui instead use the buy_cratekey_gui and use inventory set to display the item
# - Added inventory_close_handler to handle the closing of the GUI
# - Added flag player crate_purchase_key, crate_purchase_value, crate_purchase_displayname to store the selected item
# (02-24-2025) v1.3
# - Renamed confirm button to cratekey_confirm_button
# - Renamed cancel button to cratekey_cancel_button
# (02-28-2025) v1.4
# - Added new task (proceed_buy_crates) for buy function (simplified codes)
# - Added new procedure (cs_prefix) for message prefix
# Known Issues: none
#-------------------------------------------------------

# Can be improve by using a list data
crate_key_data:
  type: data
  ixora_crate_key: 2500000
  alyssum_crate_key: 2500000
  cherry_blossom_crate_key: 2500000
  spirit_blossom_crate_key: 2500000
  ruby: 5000000

cs_prefix:
    debug: false
    type: procedure
    script:
    - define prefix <&8>[<&gradient[from=#7C4751;to=#7C4751]>SYSTEM<&8>]
    - determine <[prefix]>

buy_cratekey_command:
  debug: false
  type: command
  description: Opens the Crate Key Shop GUI
  usage: /cratekeys
  name: cratekeys
  aliases:
  - buykeys
  - buycratekeys
  - keyshop
  # permission: experimental.script.shopcratekeys
  script:
  - inventory open d:buy_cratekey_gui

proceed_buy_crates:
  debug: false
  type: task
  definitions: key|value|displayname
  script:
  - define balance <placeholder[cmi_user_balance]>
  - if <[balance]> >= <[value]>:
    - flag player crate_purchase_key:<[key]>
    - flag player crate_purchase_value:<[value]>
    - flag player crate_purchase_displayname:<[displayname]>
  - else:
    - narrate "<proc[cs_prefix]> <&c>You do not have enough balance! Your current balance is: <&a><[balance]>"

buy_cratekey_gui:
  debug: false
  type: inventory
  inventory: chest
  title: <&6>Buy Crate Keys
  gui: true
  definitions:
    ?: <item[cratekey_fill]>
    1: <item[ixora_cratekey]>
    2: <item[alyssum_cratekey]>
    3: <item[ruby_crateshop]>
    4: <item[cherry_blossom_cratekey]>
    5: <item[spirit_blossom_cratekey]>
  slots:
    - [?] [?] [?] [?] [?] [?] [?] [?] [?]
    - [?] [?] [1] [2] [3] [4] [5] [?] [?]
    - [?] [?] [?] [?] [?] [?] [?] [?] [?]

cratekey_fill:
  type: item
  material: gray_stained_glass_pane
  display name: <&7>
  mechanisms:
    hides: ALL

ixora_cratekey:
  type: item
  material: tripwire_hook
  display name: <&gradient[from=#FFDEDE;to=#FF6496]>❇ Ixora Key ❇
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[ixora_crate_key].format_number>
  - <&f>Open at <&l>/warp crates
  mechanisms:
    hides: ALL
ixora_display:
  type: item
  material: tripwire_hook
  display name: <&gradient[from=#FFDEDE;to=#FF6496]>❇ Ixora Key ❇
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[ixora_crate_key].format_number>
  - <&f>Open at <&l>/warp crates
  mechanisms:
    hides: ALL

alyssum_cratekey:
  type: item
  material: tripwire_hook
  display name: <&gradient[from=#ECFFDE;to=#AAC9C4]>❈ Alyssum Blossom Key ❈
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[alyssum_crate_key].format_number>
  - <&f>Open at <&l>/warp crates
  mechanisms:
    hides: ALL
alyssum_display:
  type: item
  material: tripwire_hook
  display name: <&gradient[from=#ECFFDE;to=#AAC9C4]>❈ Alyssum Blossom Key ❈
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[alyssum_crate_key].format_number>
  - <&f>Open at <&l>/warp crates
  mechanisms:
    hides: ALL

ruby_crateshop:
  type: item
  material: paper
  display name: <&gradient[from=#AB3E00;to=#FF8F43]>Ruby
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[ruby].format_number>
  - <&f>Change this item at <&o>/warp hallofcrates
  mechanisms:
    custom_model_data: 999913
ruby_display:
  type: item
  material: paper
  display name: <&gradient[from=#AB3E00;to=#FF8F43]>Ruby
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[ruby].format_number>
  - <&f>Change this item at <&o>/warp hallofcrates
  mechanisms:
    custom_model_data: 999913

cherry_blossom_cratekey:
  type: item
  material: tripwire_hook
  display name: <&gradient[from=#FDDEFF;to=#FF64A3]>❇ Cherry Blossom Key ❇
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[cherry_blossom_crate_key].format_number>
  - <&f>Open at <&l>/warp crates
  mechanisms:
    hides: ALL
cherry_blossom_display:
  type: item
  material: tripwire_hook
  display name: <&gradient[from=#FDDEFF;to=#FF64A3]>❇ Cherry Blossom Key ❇
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[cherry_blossom_crate_key].format_number>
  - <&f>Open at <&l>/warp crates
  mechanisms:
    hides: ALL

spirit_blossom_cratekey:
  type: item
  material: tripwire_hook
  display name: <&gradient[from=#EFDEFF;to=#8564FF]>❇ Spirit Blossom Key ❇
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[spirit_blossom_crate_key].format_number>
  - <&f>Open at <&l>/warp crates
  mechanisms:
    hides: ALL
spirit_blossom_display:
  type: item
  material: tripwire_hook
  display name: <&gradient[from=#EFDEFF;to=#8564FF]>❇ Spirit Blossom Key ❇
  lore:
  - <&f>Price: <&a>₱<script[crate_key_data].data_key[spirit_blossom_crate_key].format_number>
  - <&f>Open at <&l>/warp crates
  mechanisms:
    hides: ALL

buy_cratekeys_handler:
  debug: false
  type: world
  events:
    on player drags in buy_cratekey_gui:
    - determine cancelled
    on player clicks cratekey_fill in buy_cratekey_gui:
    - determine cancelled
    on player clicks ixora_cratekey|alyssum_cratekey|cherry_blossom_cratekey|spirit_blossom_cratekey|cratekey_confirm_button|cratekey_cancel_button in buy_cratekey_gui:
    - define purchasable _false
    - if <context.item> == <item[ixora_cratekey]>:
      - run proceed_buy_crates def:ixora|<script[crate_key_data].data_key[ixora_crate_key]>|<&gradient[from=#FFDEDE;to=#FF6496]>❇<&nbsp>Ixora<&nbsp>Key<&nbsp>❇
      - inventory set o:<item[ixora_cratekey]> d:<context.inventory> slot:14
    - else if <context.item> == <item[alyssum_cratekey]>:
      - run proceed_buy_crates def:alyssum_blossom|<script[crate_key_data].data_key[alyssum_crate_key]>|<&gradient[from=#ECFFDE;to=#AAC9C4]>❈<&nbsp>Alyssum<&nbsp>Blossom<&nbsp>Key<&nbsp>❈
      - inventory set o:<item[alyssum_cratekey]> d:<context.inventory> slot:14
    - else if <context.item> == <item[cherry_blossom_cratekey]>:
      - run proceed_buy_crates def:cherry_blossom|<script[crate_key_data].data_key[cherry_blossom_crate_key]>|<&gradient[from=#FDDEFF;to=#FF64A3]>❇<&nbsp>Cherry<&nbsp>Blossom<&nbsp>Key<&nbsp>❇
      - inventory set o:<item[cherry_blossom_cratekey]> d:<context.inventory> slot:14
    - else if <context.item> == <item[spirit_blossom_cratekey]>:
      - run proceed_buy_crates def:spirit_blossom|<script[crate_key_data].data_key[spirit_blossom_crate_key]>|<&gradient[from=#EFDEFF;to=#8564FF]>❇<&nbsp>Spirit<&nbsp>Blossom<&nbsp>Key<&nbsp>❇
      - inventory set o:<item[spirit_blossom_cratekey]> d:<context.inventory> slot:14
    # Disabled for now
    # - else if <context.item> == <item[ruby_crateshop]>:
      # - if <[balance]> >= <script[crate_key_data].data_key[ruby]>:
      #   - flag player crate_purchase_key:ruby
      #   - flag player crate_purchase_value:<script[crate_key_data].data_key[ruby]>
      #   - flag player crate_purchase_displayname:<&gradient[from=#AB3E00;to=#FF8F43]>Ruby
      #   - inventory set o:<item[ruby_display]> d:<context.inventory> slot:14
      # - else:
      #   - narrate "<&8>[<&gradient[from=#7C4751;to=#7C4751]>SYSTEM<&8>] <&c>You do not have enough balance! Your current balance is: <&a><[balance]>"
      # - run proceed_buy_crates def:ruby|<script[crate_key_data].data_key[ruby]>

    - if <player.flag[crate_purchase_key].exists>:
      - inventory set o:<item[cratekey_confirm_button]> d:<context.inventory> slot:12
      - inventory set o:<item[cratekey_fill]> d:<context.inventory> slot:13
      - inventory set o:<item[cratekey_fill]> d:<context.inventory> slot:15
      - inventory set o:<item[cratekey_cancel_button]> d:<context.inventory> slot:16

    - if <context.item> == <item[cratekey_confirm_button]>:
      - define key <player.flag[crate_purchase_key]>
      - define value <player.flag[crate_purchase_value]>
      - define displayname <player.flag[crate_purchase_displayname]>
      - execute as_server "money take <player.name> <[value]>"
      - execute as_server "crate key give <player.name> <[key]> 1"
      - narrate "<proc[cs_prefix]> <&a>Successfully purchased <[displayname]>!"

      - flag player crate_purchase_key:!
      - flag player crate_purchase_value:!
      - flag player crate_purchase_displayname:!
      - inventory close

    - if <context.item> == <item[cratekey_cancel_button]>:
      - narrate "<proc[cs_prefix]> <&c>Purchase canceled as you exited the confirmation screen."
      - flag player crate_purchase_key:!
      - flag player crate_purchase_value:!
      - flag player crate_purchase_displayname:!
      - inventory close

inventory_close_handler:
  type: world
  debug: false
  events:
    on player closes buy_cratekey_gui:
    - if <player.flag[crate_purchase_key].exists>:
      - flag player crate_purchase_key:!
      - flag player crate_purchase_value:!
      - flag player crate_purchase_displayname:!
      - narrate "<proc[cs_prefix]> <&c>Purchase canceled as you exited the confirmation screen."

cratekey_confirm_button:
  type: item
  material: lime_concrete
  display name: <&a>Confirm Purchase
  mechanisms:
    hides: ALL

cratekey_cancel_button:
  type: item
  material: red_concrete
  display name: <&c>Cancel Purchase
  mechanisms:
    hides: ALL
