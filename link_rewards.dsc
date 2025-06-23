link_reward:
    type: command
    name: linkreward
    usage: /linkreward [player]
    description: Gets the UUID of a player.
    debug: false
    permission: denizen.admin
    permission message: <&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Hey! You don't have permission to use this command.
    tab completions:
      1: <server.online_players.parse[name]>
    script:
    - if <context.args.size> != 1:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Hey! Invalid command usage; proper usage is <&gradient[from=#7C4751;to=#7C4751]>/linkreward [player]"
        - stop
    - define target <server.match_offline_player[<context.args.get[1]>].if_null[null]>
    - if <[target]> == null:
        - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Hey! Invalid target specified; <bold><context.args.get[1]><&f> did not match any player!"
        - stop
    - execute as_server "magbungkalcoins give <context.args.get[1]> 500"
    - execute as_server "eco give <context.args.get[1]> 5000"
    - execute as_server "crate key give <context.args.get[1]> vote 15"
    - execute as_server "acb <context.args.get[1]> 1500"
    - narrate "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Successfully link reward given to <&gradient[from=#7C4751;to=#7C4751]><context.args.get[1]>"
    - definemap embed_map:
        # title:
        color: orange
        description: "```yml<n>Successfully link reward given to <&gradient[from=#7C4751;to=#7C4751]><context.args.get[1]>```"
        # footer: Magbungkal [Survival]
    - define embed <discord_embed.with_map[<[embed_map]>]>
    - ~discordmessage id:magbungkal channel:1226947421175545986 <[embed]>