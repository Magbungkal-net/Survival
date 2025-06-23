# UUID_Getter:
#     type: command
#     name: uuid
#     usage: /uuid [player]
#     description: Gets the UUID of a player.
#     permission: denizen.admin
#     permission message: <red>YOU DARE TRY TO WIELD THE POWERS OF THE GODS?
#     script:
#     - if <context.args.size> != 1:
#         - narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <white>Invalid command usage; proper usage is <white><bold>/uuid [player]"
#         - stop
#     - define target <server.match_offline_player[<context.args.get[1]>].if_null[null]>
#     - if <[target]> == null:
#         - narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <white>Invalid target specified; <bold><context.args.get[1]><red> did not match any player"
#         - stop
#     - narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] &f<context.args.get[1]>'s UUID is <server.match_offline_player[<context.args.get[1]>].uuid>"