seasonfivenCmd:
  type: command
  debug: false
  name: magbungkals5
  usage: /magbungkals5
  description: claim the tag
  script:
    - define player <player.name>
	- if <player.has_flag[magbungkals5]>:
	   - narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Already redeemed!"
	   - stop
	- execute as_server "lp user <[player]> permission set deluxetags.tag.s5player"
	- wait 1t
	- narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Successfully claimed the TAG"
	- execute as_server "a <&f><&l><[player]> <&f> Claimed S5 Player! TAG <&gradient[from=#7C4751;to=#7C4751]>(/magbungkals5)"
	- flag player magbungkals5