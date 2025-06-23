akiakyo_advancement:
  type: world
  debug: false
  events:
     on player dies:
     - define rank <placeholder[luckperms_primary_group_name].to_uppercase>
     - define player <player.name>
     - if <[player]> == akyyaky:
       - announce <empty>
       - announce "  <&6><&l>The god has been defeated by <&6><context.damager.name>"
       - announce "  <&6><&l>The god has been defeated by <&6><context.damager.name>"
       - announce "  <&6><&l>The god has been defeated by <&6><context.damager.name>"
       - announce <empty>
       - execute as_server "lp user <context.damager.name> permission set deluxetags.tag.godslayer"
     - define rank <placeholder[luckperms_primary_group_name].to_uppercase>
     - define player <player.name>
     - if <[player]> == akyyaky:
       - announce "<&6><&l><player.name> <&6>dare to wield the power of god."