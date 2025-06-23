PinataSummonCmd:
  type: command
  debug: false
  name: pinatasummon
  usage: /pinatasummon
  description: Summon a Pinata!
  script:
    - define player <player.name>
    - define coins <placeholder[coinsengine_balance_raw_MagbungkalCoins]>
    - if <[coins]> < 3000:
       - narrate "<reset><&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>You don't have enough coins! You needed 3,000 Coins"
       - stop
    - if <[coins]> >= 3000:
       - execute as_server "magbungkalcoins take <player.name> 3000"
       - announce "<&f><&l><player.name> <&f>Summon a pinata at spawn! (/pinatasummon)"
       - execute as_server "pinata spawn spawn"