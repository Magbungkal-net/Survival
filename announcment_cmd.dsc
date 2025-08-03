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

# TODO: FIX THE ERRORS:
# TODO: Error Info: Cannot process list-entry '[player].flag[tips_toggle_action_bar]' as type 'PlayerTag' (does not match expected type).
# TODO: Error Info: Cannot process list-entry '[player].flag[tips_toggle_action_bar]' as type 'PlayerTag' (does not match expected type).

# Action Bar auto Announcement
auto_announce:
    type: world
    debug: false
    events:
        on system time minutely:
        - playsound <server.online_players> sound:UI_BUTTON_CLICK pitch:1 volume:0.5
        - random:
          - actionbar "<&gradient[from=#7C4751;to=#7C4751]>TIPS: <&f>If you enjoy our server, consider to <&gradient[from=#7C4751;to=#7C4751]>/vote <&f>and obtain 1 Vote Key, ₱100, 3 Coins!" targets:<server.online_players>
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

tips_chat_announce:
  type: world
  debug: false
  events:
    on system time minutely:
    - playsound <server.online_players> sound:UI_BUTTON_CLICK pitch:1 volume:0.5
    - random:
       - run pyrofishing
       - run pyromining
       - run whatissurvival
       - run discordupdatesannouncements
       - run scrollquest
       - run leaderboardsleaderboards
       - run playerreport
       - run bugreport
       - run needhelpcreateaticket
       - run auctionhouse
       - run chestshop
       - run submiplayerguides
       - run stayupdatedadiscord
       - run beacontentcreator
       - run rulesareondiscord
       - run linkyouraccount

PyroFishing:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>PyroFishing"
  - define "list:->:   <&f><&o>Catch rare fish, earn money & XP!"
  - define "list:->:   <&f><&o>Level up your fishing skill for perks! (/fish)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

PyroMining:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>PyroMining"
  - define "list:->:   <&f><&o>Mine special ores and relics underground!"
  - define "list:->:   <&f><&o>Upgrade your tools, earn rewards! (/mine)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

WhatisSurvival:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>What is Survival?"
  - define "list:->:   <&f><&o>Classic survival gameplay + custom features!"
  - define "list:->:   <&f><&o>Build, explore, trade & thrive!"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

DiscordUpdatesAnnouncements:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Discord (Updates & Announcements)"
  - define "list:->:   <&f><&o>Stay informed with events & server news!"
  - define "list:->:   <&f><&o>(/discord)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

ScrollQuest:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Scroll Quest"
  - define "list:->:   <&f><&o>Complete quests, earn money and coins! (/scrolls)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

LeaderboardsLeaderboards:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Leaderboards"
  - define "list:->:   <&f><&o>Track top players in-game & on Discord!"
  - define "list:->:   <&f><&o>(/warp leaderboard) or check #leaderboards"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

PlayerReport:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Player Report"
  - define "list:->:   <&f><&o>See something wrong? Report it!"
  - define "list:->:   <&f><&o>Use (/playerreport)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

BugReport:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Bug Report"
  - define "list:->:   <&f><&o>Found a bug? Let us know!"
  - define "list:->:   <&f><&o>Use (/bugreport) or create a ticket on Discord"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

NeedHelpCreateaTicket:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Need Help? Create a Ticket"
  - define "list:->:   <&f><&o>Stuck or confused? We got you!"
  - define "list:->:   <&f><&o>Open one in #ticket"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

AuctionHouse:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Auction House"
  - define "list:->:   <&f><&o>Buy & sell items with players! (/ah)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

ChestShop:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Chest Shop"
  - define "list:->:   <&f><&o>Create your own shop & earn profits! (/qs help)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

SubmiPlayerGuides:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Submit Player Guides"
  - define "list:->:   <&f><&o>Help others & show your knowledge!"
  - define "list:->:   <&f><&o>Post tutorials in #player-guides (/discord)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

StayUpdatedaDiscord:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Stay Updated at Discord"
  - define "list:->:   <&f><&o>Server news, updates & patch notes!"
  - define "list:->:   <&f><&o>Join now (/discord)"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

BeaContentCreator:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Be a Content Creator!"
  - define "list:->:   <&f><&o>Record, stream, or promote!"
  - define "list:->:   <&f><&o>Apply on Discord to be featured!"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

RulesareonDiscord:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Rules are on Discord"
  - define "list:->:   <&f><&o>Must read every rule in #rules!"
  - define "list:->:   <&f><&o>Respect = Fun for everyone!"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>

LinkYourAccount:
  type: task
  debug: false
  script:
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - define "list:->:"
  - define "list:->:   <&gradient[from=#7C4751;to=#7C4751]><bold>Link Your Account"
  - define "list:->:   <&f><&o>Sync Minecraft to Discord for rewards!"
  - define "list:->:   <&f><&o>Follow #how-to-link to get started!"
  - define "list:->:"
  - define list:->:<&8><&m><element[<&sp>].repeat[80]><&r>
  - announce <[list].separated_by[<&nl>]>
