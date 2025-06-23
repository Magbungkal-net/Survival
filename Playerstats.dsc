create_playerstats:
  type: task
  script:
    - definemap options:
        1:
          type: string
          name: username
          description: Minecraft username
          required: true
    - ~discordcommand id:magbungkal create name:player "description:View a player's in game statistics" "group:1126475444837949500" options:<[options]>

playerstats:
    type: world
    debug: false
    events:
        on discord slash command name:player:
        - ~discordinteraction defer interaction:<context.interaction>
        - define username <server.match_offline_player[<context.options.get[username].if_null[<empty>]>].if_null[null]>
        - if <[username]> == null:
            - define error "<discord_embed.with_map[description=That name is invalid, or that player has never joined!;color=#FF0000]>"
            - ~discordinteraction reply interaction:<context.interaction> <[error]>
            - stop
        - else:
            - define embed "<discord_embed.with_map[author_icon_url=https://crafatar.com/avatars/<[username].uuid>;author_name=<[username].name>'s Statistics;description=**Mob Kills**: <[username].statistic[mob_kills]> <&nl>**Player Kills**: <[username].statistic[player_kills]> <&nl>**Deaths**: <[username].statistic[deaths]> <&nl>**Animals bred**: <[username].statistic[animals_bred]> <&nl>**Villager trades**: <[username].statistic[TRADED_WITH_VILLAGER]> <&nl>**Fish caught**: <[username].statistic[fish_caught]> <&nl>**Balance**: <[username].formatted_money><&nl>**Last seen**: <[username].last_played_time.format_discord>;color=#00FF00]>"
            - ~discordinteraction reply interaction:<context.interaction> <[embed]>
            - stop
