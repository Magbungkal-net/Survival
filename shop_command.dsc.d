shopcmd:
  type: command
  debug: false
  name: shop
  usage: /shop
  description: Teleport to shop
  aliases:
  - shopgui
  - guishop
  script:
  - narrate "<&gradient[from=#7C4751;to=#7C4751]>[SYSTEM] <&f>Teleporting on shop..."
  - wait 3s
  - execute as_player "warp shop"