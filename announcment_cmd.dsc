announcement_cmd:
  type: command
  debug: false
  name: announcement
  description: Announcement
  usage: /announcement
  permission: denizen.announcement
  aliases:
  - a
  - announce
  - broadcast
  - b
  - bcast
  script:
     - announce <empty>
     - announce "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f><context.raw_args>"
     - announce <empty>
     # Discord announce
     - discordmessage id:magbungkal channel:1182512909654438068 <context.raw_args>

# Action Bar auto Announcement
auto_announce:
    type: world
    debug: false
    events:
        on system time minutely:
        - playsound <server.online_players> sound:UI_BUTTON_CLICK pitch:1 volume:0.5
        - random:
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>If you enjoy our server, consider to <&gradient[from=#7C4751;to=#7C4751]>/vote <&f>and obtain 1 Vote Key and 3 Coins!" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Need help? Create at ticket on <&9><&l>/discord" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>To be aware of our latest announcements and updates, Join <&9><&l>/discord" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Earn money in different ways <&gradient[from=#7C4751;to=#7C4751]>/economy" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Ascend to a next rank using <&gradient[from=#7C4751;to=#7C4751]>/rankup" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>See ranks perks using <&gradient[from=#7C4751;to=#7C4751]>/ranks" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Upgrade your weapons, tools, and armors using <&gradient[from=#7C4751;to=#7C4751]>/ce" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Did you know you can earn money and coins by answering Chat Games?" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Become a Top Voter for an amazing rewards!" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Download Voice Chat on our <&9><&l>/discord" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Earn money, coins or get a Random Spawner using <&gradient[from=#7C4751;to=#7C4751]>/scrolls" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Claim your land using Golden Shovel! Stick to investigate a clam" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>If your resource pack didn't load, please type <&gradient[from=#7C4751;to=#7C4751]>/magbungkalrp" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Have encountered a bad player? <&gradient[from=#7C4751;to=#7C4751]>/playerreport" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Have encountered a bug? Or any game or economy breaking? <&gradient[from=#7C4751;to=#7C4751]>/bugreport" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Do you want more cosmetics? Check <&8><&l>/blackmarket" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Sell and purchase items, blocks, etc. on <&gradient[from=#7C4751;to=#7C4751]>/shop" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Is fishing is too boring for you? Check <&gradient[from=#7C4751;to=#7C4751]>/fish" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Is mining is too boring for you? Check <&gradient[from=#7C4751;to=#7C4751]>/mine" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Link your discord account to our server for exclusive rewards! <&9><&l>/discord" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Claim your daily rewards now <&gradient[from=#7C4751;to=#7C4751]>/daily" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Earn money by applying on Jobs <&gradient[from=#7C4751;to=#7C4751]>/jobs browse" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Do you want more perks? <&gradient[from=#7C4751;to=#7C4751]>/store" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Do you want more exclusive items? <&gradient[from=#7C4751;to=#7C4751]>/warp crates" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Boost our discord server for special booster's rewards <&9><&l>/discord" targets:<server.online_players>
           - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>Buy claim blocks <&gradient[from=#7C4751;to=#7C4751]>/buyclaimblocks" targets:<server.online_players>
