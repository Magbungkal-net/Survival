MagbungkalCodes:
    type: data
    codes:
    - 35e6a5b4-0f3a-4444-9a14-68eac6bdd68e
    - MAGBUNGKALS5
    messages:
        success:
            title: ✔️ Successfully redeemed!
            color: orange
        invalid:
            title: ❌ Invalid - Not exisiting
            color: maroon
        already-redeem:
            title: ❌ Invalid - Already redeemed
            color: maroon
        usage:
            title: ❌ Invalid - You do not specify your IGN
            description: "`!code [code] [playerName]`"
            color: maroon

MagbungkalCodesHandler:
    type: world
    debug: false
    events:
        after discord message received:
        - define message <context.new_message>
        - define text <[message].text>
        - define user <[message].author>
        - define group <context.group>

        - define command !code

        - if <[text].starts_with[<[command]>]>:

            - stop if:!<discord_channel[magbungkal,1126475444837949500,1142368712461135963]>
            # MAGBUNGKALS5
            - if <[text].split.size> != 3:
                - define embed <script[magbungkalcodes].data_key[messages].get[usage]>
                - define reply <discord_embed.with_map[<[embed]>]>
                - ~discordmessage id:magbungkal reply:<[message]> <[reply]>
                - determine cancelled

            - if <[text].split.get[2]> == MAGBUNGKALS5:

                - if <[user].has_flag[MAGBUNGKALS5MAGBUNGKALS5]>:
                    - define embed <script[magbungkalcodes].data_key[messages].get[already-redeem]>
                    - define reply <discord_embed.with_map[<[embed]>]>
                    - ~discordmessage id:magbungkal reply:<[message]> <[reply]>
                    - determine cancelled

                - define ign <[text].split.get[3]>

                - execute as_server "lp user <server.match_offline_player[<[ign]>].name> permission set deluxetags.tag.s5player"
                - wait 1t
                - execute as_server "a <&f><&l><server.match_offline_player[<[ign]>].name> <&f> Claimed S5 Player! TAG <&gradient[from=#7C4751;to=#7C4751]>(/magbungkals5)"

                - flag <[user]> MAGBUNGKALS5MAGBUNGKALS5

                - define embed <script[magbungkalcodes].data_key[messages].get[success]>
                - define reply <discord_embed.with_map[<[embed]>]>
                - ~discordmessage id:magbungkal reply:<[message]> <[reply]>

            # check code if is not existing in data --> MagbungkalCodes
            - define code <[text].split.get[2].if_null[null]>
            - define MagbungkalCodes <script[magbungkalcodes].data_key[codes]>

            - if !<[code].is_in[<[MagbungkalCodes]>]>:
                - define embed <script[magbungkalcodes].data_key[messages].get[invalid]>
                - define reply <discord_embed.with_map[<[embed]>]>
                - ~discordmessage id:magbungkal reply:<[message]> <[reply]>
                - stop
