tps_alert:
    type: world
    debug: false
    events:
        on player joins:
        - if <server.recent_tps.first.round_to_precision[0.05]> < 17:
           - define players <server.online_players.size>
           - define time <util.time_now.format_discord[R]>
           - define entities <World[World].living_entities.size>
           - define role <discord_role[magbungkal,1142516104518967397,1170242551526211644].mention>
           - define online_ops <server.online_ops.size>
           - define uptime <util.current_tick.div[20].div[60].div[60].round>
           - define performance <server.recent_tps.get[1].div[20].mul[100].round_to[1]>
           - define tps <server.recent_tps.first.round_to_precision[0.05]>
           - definemap embed_map:
                author_name: 🟡 Alert
                # author_icon_url: https://i.imgur.com/g3cM2l7.png
                # title:
                color: yellow
                description: "```yml<n>Can't keep up! Is the server overloaded? - Running <[tps]> tick per seconds behind.<n> » -------------------- « <n>TPS: <[tps]><n>Current Players: <[players]>/120<n>Performance: <[performance]>%<n>Uptime: <[uptime]> hours<n>Entities: <[entities]><n>OPs: <[online_ops]><n>  » -------------------- « ```<n>Reported at <[time]>"
                footer: TPS Report - Server [Magbungkal Survival]
                footer_icon: https://i.imgur.com/g3cM2l7.png
           - define embed <discord_embed.with_map[<[embed_map]>]>
           - ~discordmessage id:magbungkal channel:1221446999354642453 <[embed]>

        - else if <server.recent_tps.first.round_to_precision[0.05]> > 17:
           - define players <server.online_players.size>
           - define time <util.time_now.format_discord[R]>
           - define entities <World[World].living_entities.size>
           - define online_ops <server.online_ops.size>
           - define uptime <util.current_tick.div[20].div[60].div[60].round>
           - define performance <server.recent_tps.get[1].div[20].mul[100].round_to[1]>
           - define tps <server.recent_tps.first.round_to_precision[0.05]>
           - definemap embed_map:
                author_name: 🟢 Alert
                color: lime
                description: "```yml<n>Server is on good condition. - Running <[tps]> tick per seconds behind.<n> » -------------------- « <n>TPS: <[tps]><n>Current Players: <[players]>/120<n>Performance: <[performance]>%<n>Uptime: <[uptime]> hours<n>Entities: <[entities]><n>OPs: <[online_ops]><n> » -------------------- « ```<n>Reported at <[time]>"
                footer: TPS Report - Server [Magbungkal Survival]
                footer_icon: https://i.imgur.com/g3cM2l7.png
           - define embed <discord_embed.with_map[<[embed_map]>]>
           - ~discordmessage id:magbungkal channel:1221446999354642453 <[embed]>

        - if <server.recent_tps.first.round_to_precision[0.05]> < 12:
           - define staff_ping <discord_role[magbungkal,1142516104518967397,1222460676338090016].mention>
           - ~discordmessage id:magbungkal channel:1221446999354642453 content:<[staff_ping]>
           - define players <server.online_players.size>
           - define time <util.time_now.format_discord[R]>
           - define entities <World[World].living_entities.size>
           - define online_ops <server.online_ops.size>
           - define uptime <util.current_tick.div[20].div[60].div[60].round>
           - define performance <server.recent_tps.get[1].div[20].mul[100].round_to[1]>
           - define tps <server.recent_tps.first.round_to_precision[0.05]>
           - definemap embed_map:
                author_name: 🔴 Alert
                color: maroon
                description: "```yml<n>TPS Drop!, please check if someone causing a lag or making a lag machine. - Running <[tps]> tick per seconds behind.<n> » -------------------- « <n>TPS: <[tps]><n>Current Players: <[players]>/120<n>Performance: <[performance]>%<n>Uptime: <[uptime]> hours<n>Entities: <[entities]><n>OPs: <[online_ops]><n>  » -------------------- « ```<n>Reported at <[time]>"
                footer: TPS Report - Server [Magbungkal Survival]
                footer_icon: https://i.imgur.com/g3cM2l7.png
           - define embed <discord_embed.with_map[<[embed_map]>]>
           - ~discordmessage id:magbungkal channel:1221446999354642453 <[embed]>

