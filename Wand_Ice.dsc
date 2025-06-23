# You must have Denizen plugin and Depenizen plugin loaded on your server
# Drop this file in your Denizen\Scripts folder
# Tested on 1.19.4 and 1.20.1
# Author: Chaps79 www.obiworldmc.com
# Additional Credit: This script is an adaptation of Aya's Lightning Blade
# Permission nodes:
  # dscript.wand.ice.use
  # dscript.wand.ice.get
  # dscript.wand.delayexempt


ice_wand_config:
   # Don't mess with type.
  type: data
  debug: false
  # Use "&ns" plus the hexidecimal code
  ice_color: &ns5555FF
  # How far will the ice bolt travel
  range: 80
  # Entities within this radius of the bolt impact will receive damage and effects
  radius: 3
  # How long must players wait before using the wand again. Give permission dscript.wand.delayexempt
  # to override this delay.
  delay: 2s
  # Determines degree of ice bolt deviation. Default is 0.4. Set to 0 for straight line.
  zigzag: 0.4

wand_ice:
  type: item
  debug: false
  material: blaze_rod
  display name: <&9><bold><italic>Ice Wand
  lore:
  - Damage 2
  - Range 80
  - Freeze 15s
  recipes:
    1:
      type: shaped
      input:
        - material:echo_shard|material:powder_snow_bucket|material:air
        - material:powder_snow_bucket|material:blaze_rod|material:air
        - material:air|material:air|material:nether_star
  mechanisms:
    unbreakable: true
    enchantments: mending,1


ice_wand_handler:
  type: world
  debug: false
  events:
    after player right clicks block with:wand_ice:
    - if !<player.has_permission[dscript.wand.ice.use]>:
        - narrate "<&c>You do not have this magic, <player.name>."
        - stop
    - if <player.has_flag[ice_delay]>:
        - narrate "<&c>Magic is recharging. Wait <&5><player.flag_expiration[ice_delay].from_now.formatted>"
        - stop
    - else:
      - define config <script[ice_wand_config].data_key[]>
      - define maxDistance <[config.range]>
      - define target <player.target.within[<[maxDistance]>].location.above.if_null[<player.cursor_on_solid[<[maxDistance]>].if_null[null]>]>
      - if <[target]> == null:
        - stop
      - define loc <player.location.above.face[<[target]>]>
      - define distance <[loc].distance[<[target]>]>
      - define color <[config.ice_color].unescaped>
      - while <[distance]> > 1:
        - define nextSpike <util.random.decimal[0.5].to[2]>
        - define distance:-:<[nextSpike]>
        - define spikeStart <[loc].forward[<[nextSpike]>]>
        - playeffect effect:redstone offset:0,0,0 at:<[loc].points_between[<[spikeStart]>].distance[0.2]> special_data:1|<[color]> visibility:<[maxDistance]>
        - define spikeLength <util.random.decimal[1].to[<[config.zigzag]>].add[1].mul[2]>
        - define spike <[spikeStart].forward[<[spikeLength].div[2]>].random_offset[<[config.zigzag]>]>
        - define distance:-:<[spikeLength]>
        - define spikeEnd <[spikeStart].forward[<[spikeLength]>]>
        - playeffect effect:redstone offset:0,0,0 at:<[spikeStart].points_between[<[spike]>].distance[0.2]> special_data:1|<[color]> visibility:<[maxDistance]>
        - playeffect effect:redstone offset:0,0,0 at:<[spike].points_between[<[spikeEnd]>].distance[0.2]> special_data:1|<[color]> visibility:<[maxDistance]>
        - define loc <[spikeEnd]>
      - explode <[target]> power:<[config.radius]> source:<player>
      - if !<[target].griefprevention.has_claim>:
        - adjust <[target].find.living_entities.within[<[config.radius]>]> freeze_duration:30s
        - cast slow <[target].find.living_entities.within[<[config.radius]>]> duration:10s
        - modifyblock <player.cursor_on_solid.above> snow 70
      - if !<player.has_permission[dscript.wand.delayexempt]>:
        - flag player ice_delay expire:3s

ice_wand_command:
  type: command
  debug: false
  name: wand_ice
  description: Gives you a ice wand
  usage: /wand_ice
  permission: dscript.wand.ice.get
  script:
  - if !<player.has_permission[dscript.wand.ice.get]>:
    - narrate "<&c>You do not have this magic, <player.name>."
    - stop
  - else if <context.source_type> == PLAYER:
    - give wand_ice
