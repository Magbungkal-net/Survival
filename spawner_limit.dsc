spawner_limit:
  type: world
  debug: false
  events:
    on player places spawner:
    #- if <player.is_op.not>:
    #  - determine cancelled passively
    #  - narrate "<&c>Temporarily disabled placing spawner."
    - if <player.has_permission[mineablespawners.mine].not>:
      - determine cancelled passively
      - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&6>You needed to be MVP+ or Iron V above to mine and place spawners"
      - stop
    - define list <list>
    - foreach <player.location.chunk.tile_entities>:
        - if <[value].material.contains_all_text[spawner]>:
            - define list <[list].include[<[value]>]>
    - if <[list].size> > 1:
        - determine passively cancelled
        - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&6>You have reached the 1 limit of spawner each chunk."
    - else:
        - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&6>You can only place 1 spawners each chunk."
        - stop
    - if <[list].size> > 1:
        - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <&6>Hey! This is out of limit please report it to any staffs, <&l>or else you will be banned."
        - determine passively cancelled
        - define username <player.name>
        - define rank <placeholder[luckperms_primary_group_name]>
        - define uuid <player.uuid>
        - define time <util.time_now.to_zone[+8].format>
        - define player_location <player.location>
        - define tps <server.recent_tps.first.round_to_precision[0.05]>
        - define spawners <player.location.chunk.tile_entities.size>
        # Discord message to Magbungkal staff survival-logs
        # ping staff
        - define staff_ping <discord_role[magbungkal,1142516104518967397,1227180478310781089].mention>
        - ~discordmessage id:magbungkal channel:1226947421175545986 content:<[staff_ping]>
        - definemap embed_map:
            # author_name: <[rank]> <[username]>
            # author_icon_url: https://mc-heads.net/avatar/<player.name>
            title: Spawner out of limit alert!
            color: orange
            description: "```yml<n>Placed a 4 or more than spawner on the same chunk!<n>Spawners on chunk: <[spawners]><n>UUID:<[uuid]><n>Location: <[player_location]><n>Time: <[time]><n>TPS: <[tps]>```"
            footer: <[rank]> <[username]>
            footer_icon: https://mc-heads.net/avatar/<player.name>
        - define embed <discord_embed.with_map[<[embed_map]>]>
        - ~discordmessage id:magbungkal channel:1226947421175545986 <[embed]>

sl_prefix:
    debug: false
    type: procedure
    script:
    - define prefix <&8>[<&gradient[from=#FF4D00;to=#FF4D00]>SYSTEM<&8>]
    - determine <[prefix]>

# spawner_limit:
#   type: world
#   debug: false
#   events:
#     on player places spawner:
#     - if !<player.is_op>:
#         - if !<player.has_permission[mineablespawners.mine]>:
#             - narrate "<proc[sl_prefix]> <&6>You need to be MVP+ or Iron V above to place spawners."
#             - determine cancelled
#             - stop

#         - define placed_chunk <context.location.chunk>
#         - define chunk_x <[placed_chunk].x>
#         - define chunk_z <[placed_chunk].z>
#         - define chunk_world <[placed_chunk].world.name>

#         - define own_chunk <chunk[<[chunk_x]>,<[chunk_z]>,<[chunk_world]>]>

#         - define surrounding_chunks <list[<chunk[<[chunk_x].add[1]>,<[chunk_z]>,<[chunk_world]>]>|<chunk[<[chunk_x].add[-1]>,<[chunk_z]>,<[chunk_world]>]>|<chunk[<[chunk_x]>,<[chunk_z].add[1]>,<[chunk_world]>]>|<chunk[<[chunk_x]>,<[chunk_z].add[-1]>,<[chunk_world]>]>|<chunk[<[chunk_x].add[1]>,<[chunk_z].add[1]>,<[chunk_world]>]>|<chunk[<[chunk_x].add[-1]>,<[chunk_z].add[-1]>,<[chunk_world]>]>|<chunk[<[chunk_x].add[-1]>,<[chunk_z].add[1]>,<[chunk_world]>]>|<chunk[<[chunk_x].add[1]>,<[chunk_z].add[-1]>,<[chunk_world]>]>]>
#         - define spawners_in_own_chunk <[own_chunk].tile_entities.filter[material.contains[spawner]].size>
#         - if <[spawners_in_own_chunk]> > 2:
#             - narrate "<proc[sl_prefix]> <&c>This chunk already has a spawner! You can only place one spawner per chunk."
#             # - determine cancelled
#             # - stop

#         - else if <[spawners_in_own_chunk]> > 3:
#             - narrate "<proc[sl_prefix]> <&c>Pinging staff on discord"
#             - define staff_ping <discord_role[magbungkal,1142516104518967397,1227180478310781089].mention>
#             - ~discordmessage id:magbungkal channel:1226947421175545986 content:<[staff_ping]>
#             - definemap embed_map:
#                 # author_name: <[rank]> <[username]>
#                 # author_icon_url: https://mc-heads.net/avatar/<player.name>
#                 title: Spawner out of limit alert!
#                 color: orange
#                 description: "```yml<n>Placed a 4 or more than spawner on the same chunk!<n>Spawners on chunk: <[spawners]><n>UUID:<[uuid]><n>Location: <[player_location]><n>Time: <[time]><n>TPS: <[tps]>```"
#                 footer: <[rank]> <[username]>
#                 footer_icon: https://mc-heads.net/avatar/<player.name>
#             - define embed <discord_embed.with_map[<[embed_map]>]>
#             - ~discordmessage id:magbungkal channel:1226947421175545986 <[embed]>
#             - determine cancelled
#             - stop

#         - foreach <[surrounding_chunks]> as:chunk:
#             - define spawners_in_chunk <[chunk].tile_entities.filter[material.contains[spawner]].size>
#             - if <[spawners_in_chunk]> > 0:
#                 - narrate "<proc[sl_prefix]> <&c>You cannot place a spawner here! There must be a 1-chunk gap between spawners."
#                 - determine cancelled
#                 - stop

#         - narrate "<proc[sl_prefix]> <&a>You have successfully placed a spawner!"
#     - else:
#         - narrate "<proc[sl_prefix]> <&a>You are OP and bypassing the spawner limit!"
