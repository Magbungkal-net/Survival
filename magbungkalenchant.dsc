enchantmentcmd:
  type: command
  debug: false
  name: denchant
  usage: /denchant
  permission: denizen.magbungkalenchant
  script:
     - execute as_player "eenchant sharpness 10"
     - execute as_player "eenchant looting 4"
     - execute as_player "eenchant smite 10"
     - execute as_player "eenchant fireaspect 10"     
     - execute as_player "eenchant baneofarthropods 9" 
     - execute as_player "eenchant sweepingedge 10"     
     - execute as_player "eenchant unbreaking 10"
     - wait 1s
     - narrate "<&6><&l>SYSTEM <&8>» <&f>Enchant granted"
    
d_itemlorecmd:
  type: command
  debug: false
  name: dlore
  usage: /dlore
  permission: denizen.magbungkallore
  script:
     - execute as_player "ilore add &8↪ &8&l======================= &8↩"
     - execute as_player "ilore add &f&l⇨ &7OWNED by &8﹝﹥&f&n_callmetiane&8﹤﹞"
     - execute as_player "ilore add &f&l⇨ &7One of &#A2A2A2&o2&#A9A9A9&o1 &#AFAFAF&oS&#B6B6B6&ou&#BDBDBD&op&#C3C3C3&or&#CACACA&oe&#D1D1D1&om&#D7D7D7&oe &#DEDEDE&oS&#E4E4E4&ow&#EBEBEB&oo&#F2F2F2&or&#F8F8F8&od&#FFFFFF&os."
     - execute as_player "ilore add &8↪ &8&l======================= &8↩"     
     - wait 1s
     - narrate "<&6><&l>SYSTEM <&8>» <&f>Lore granted"    