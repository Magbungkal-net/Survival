item_Cmd:
    type: command
    name: item
    description: get a material
    usage: /item [material] [quantity]
    tab completions:
        1: [material]
        2: [quantity]
    permission: command.item
    permission message: you dont have perms for this
    aliases:
    - give
    - i
    script:
	- if <context.args.size> == 1:
       - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <white>Invalid command usage; proper usage is <&l>/item [material] [quantity]"
       - stop
    - if <player.has_flag[cooldown]>:
        - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <white>You can only use this command once per 60 seconds. You must wait <player.flag_expiration[cooldown].from_now.formatted>."
        - stop
    - flag player cooldown expire:1m
    - narrate "<&8><&l>[<&6><&l>!<&8><&l>] <white>Successfully given <&l><context.args.get[1]> <&f>with quantity of <&l><context.args.get[2]>"
    - execute as_server "egive <player.name> <context.args.get[1]> <context.args.get[2]>"