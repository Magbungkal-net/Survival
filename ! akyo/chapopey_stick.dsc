chapopey_stick_data:
  type: data
  debug: false
  # For the sake of the color, Denizen escpaing is used, so &ns is # - see https://meta.denizenscript.com/Docs/Search/escaping%20system
  lightning_color: &ns830000
  maximum_distance: 20
  explosion:
    power: 10
    extra_damage: 5

chapopey_stick:
  type: item
  debug: false
  material: stone_axe
  display name: <&gradient[from=#8A4444;to=#BF5454]><&l>Hammer of Durin
  lore:
     - <&gradient[from=#BF5454;to=#BF5454]> Power X
     - <&gradient[from=#BF5454;to=#BF5454]> Extra Damage V
     - <gray>⇨  <gold>» <white>Owned by Chapopey. <gold>«

chapopey_stick_handler:
  type: world
  debug: false
  events:
    after player right clicks block with:chapopey_stick:
    - ratelimit <player> 5t
    - define config <script[chapopey_stick_data].data_key[]>
    - define maxDistance <[config.maximum_distance]>
    - define target <player.target.within[<[maxDistance]>].location.above.if_null[<player.cursor_on_solid[<[maxDistance]>].if_null[null]>]>
    - if <[target]> == null:
      - stop
    - define loc <player.location.above.face[<[target]>]>
    - define distance <[loc].distance[<[target]>]>
    - define color <[config.lightning_color].unescaped>
    - while <[distance]> > 1:
      - define nextSpike <util.random.decimal[0.5].to[2]>
      - define distance:-:<[nextSpike]>
      - define spikeStart <[loc].forward[<[nextSpike]>]>
      - playeffect effect:redstone offset:0,0,0 at:<[loc].points_between[<[spikeStart]>].distance[0.2]> special_data:1|<[color]> visibility:<[maxDistance]>
      - define spikeLength <util.random.decimal[1].to[4]>
      - define spike <[spikeStart].forward[<[spikeLength].div[2]>].random_offset[2]>
      - define distance:-:<[spikeLength]>
      - define spikeEnd <[spikeStart].forward[<[spikeLength]>]>
      - playeffect effect:redstone offset:0,0,0 at:<[spikeStart].points_between[<[spike]>].distance[0.2]> special_data:1|<[color]> visibility:<[maxDistance]>
      - playeffect effect:redstone offset:0,0,0 at:<[spike].points_between[<[spikeEnd]>].distance[0.2]> special_data:1|<[color]> visibility:<[maxDistance]>
      - define loc <[spikeEnd]>
    - define explosion <[config.explosion]>
    - explode <[target]> power:<[explosion.power]> fire source:<player>
    - hurt <[explosion.extra_damage]> <[target].find.living_entities.within[<[explosion.power].mul[2]>]> source:<player>

chapopey_stick_command:
  type: command
  debug: false
  name: chapopeystick
  description: Gives you a lightning stick
  usage: /chapopeystick
  permission: denizen.admin
  script:
  - if <context.source_type> == PLAYER:
    - give chapopey_stick