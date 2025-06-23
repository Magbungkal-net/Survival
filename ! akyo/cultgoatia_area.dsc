cultgoatia_area:
    type: world
    debug: false
    events:
       on player places blood_god_head:
       - define area <region[bloodgod,world].area>
       - if <context.location> in <[area].blocks>:
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>A lord has started Ritual!!" targets:<player.location.find_entities[player].within[10]>
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>A lord has started Ritual!!" targets:<player.location.find_entities[player].within[10]>
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>A lord has started Ritual!!" targets:<player.location.find_entities[player].within[10]>
           - wait 1t
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Kneel!!!" targets:<player.location.find_entities[player].within[10]>
           - wait 1t
           - cast blindness duration:3s <player.location.find_entities[player].within[10]>
           - cast slow duration:3s <player.location.find_entities[player].within[10]>
           - playsound <player.location> sound:ENTITY_GHAST_WARN volume:1
           - playsound <player.location> sound:ENTITY_GHAST_WARN volume:1
           - inject smooth_tp
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Dori me" targets:<player.location.find_entities[player].within[10]>
           - wait 0.1s
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Interimo adapare dori me" targets:<player.location.find_entities[player].within[10]>
           - wait 0.1s
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Ameno, ameno, latire" targets:<player.location.find_entities[player].within[10]>
           - wait 0.1s
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Latire mo" targets:<player.location.find_entities[player].within[10]>
           - wait 0.1s
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Dori me" targets:<player.location.find_entities[player].within[10]>
           - wait 0.1s
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Ameno, oma nare imperavi ameno" targets:<player.location.find_entities[player].within[10]>
           - wait 0.1s
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Dimere, dimere, mantiro" targets:<player.location.find_entities[player].within[10]>
           - wait 0.1s
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Mantire mo" targets:<player.location.find_entities[player].within[10]>
           - wait 0.1s
           - title "title:<&4><&l>CultGoatia:" "subtitle:<&c>Ameno" targets:<player.location.find_entities[player].within[10]>
           - playsound <player.location> sound:ENTITY_GHAST_WARN volume:1
           - playsound <player.location> sound:ENTITY_GHAST_WARN volume:1
           - strike <player.location> no_damage
           - strike <player.location> no_damage
           - strike <player.location> no_damage
           - strike <player.location> no_damage
           - strike <player.location> no_damage
           - wait 1t
           - drop cultgoatia_tag

smooth_tp:
  type: task
  script:
    - spawn item_display <player.eye_location> save:e
    - define e <entry[e].spawned_entity>
    - define dur 50t
    - adjust <[e]> teleport_duration:<[dur]>
    - wait 3t
    - define gamemode <player.gamemode>
    - define orig_loc <player.location>
    - adjust <player.location.find_entities[player].within[10]> spectator_target:<[e]>
    - teleport <[e]> <[e].location.add[0,1,-5].with_yaw[0]>
    - wait <[dur]>
    - remove <[e]>
    - adjust <player.location.find_entities[player].within[10]> gamemode:survival
    - teleport <player.location.find_entities[player].within[10]> <[orig_loc]>

blood_god_head:
    type: item
    material: player_head
    mechanisms:
      skull_skin: eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDAzYWQ4NDZmMDdlNzEyNGUxN2E0NDY3MjIyYjY4MTE1YWMyMWZlNGVjMDNmNWMwNmI3MjVhOWE1NDRlOWQifX19
      hides: all
    display name: <&4><&l>Blood God Head
    lore:
    - <&4>Place this on Ritual area

cultgoatia_tag:
    type: item
    material: name_tag
    display name: <&gradient[from=#3C1A1A;to=#FF0000]><&l> ✟ CULTGOATIA ✟
    lore:
    - <&4>Right click this for your TAG!

cultgoatia_tag_handler:
    type: world
    debug: false
    events:
      after player right clicks block with:cultgoatia_tag:
      - take item:cultgoatia_tag
      - execute as_server "lp user <player.name> permission set deluxetags.tag.cultgoatia"
      - playsound <player> sound:BLOCK_BELL_USE volume:1 pitch:1
