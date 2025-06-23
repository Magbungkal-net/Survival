join_leave_message:
  type: world
  debug: false
  events:
    on player join:
    - define hidden_op <list[sieccc|ellyieee|YATA_Ein]>
    - if <[hidden_op].contains[<player.name>]>:
      - determine cancelled
    - else:
      - announce "<&a>+ <&7><player.name>"
      - determine none passively
      # - define first_tier <list[_cheezeonchipz11|Eysuu|_MishaDrawz|xGlen|Reeiiiii|IRONman|Lilfritz|39sakuraa|_KittenBiskit|Salmon|Kyyylaaaaa|Flux_G|Gela1405|MDmaner|TrshVier|Joneel]>
      # - define second_tier <list[_callmetiane|ChyaBr3ad|TheyCallMeBish|Deiaty]>
      # - define third_tier <list[ilymariz|_DimaPig|Chapopey]>
      # - define rank <placeholder[luckperms_primary_group_name].to_uppercase>
      # - if <[first_tier].contains[<player.name>]>:
      #   - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
      #   - determine cancelled
      # - if <[second_tier].contains[<player.name>]>:
      #   - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>JOINED THE SERVER<n>"
      #   - determine cancelled
      # - if <[third_tier].contains[<player.name>]>:
      #   - announce "<&gradient[from=#c36891;to=#c36891]><&l><n>A BENEFACTOR++ <&8>[<&gradient[from=#c36891;to=#c36891]><player.name><&8>] <&gradient[from=#c36891;to=#c36891]><&l>JOINED THE SERVER<n>"
      #   - determine cancelled
      # - if <[rank]> == OWNER && !<[hidden_op].contains[<player.name>]>:
      #   - announce "<&6><&l><n>OWNER <&8>[<&6><player.name><&8>] <&6><&l>HAS JOINED THE SERVER<n>"
      #   - determine cancelled
      # - if <[rank]> == DEV && !<[hidden_op].contains[<player.name>]>:
      #   - announce "<&5><&l><n>SYSTEM ADMIN <&8>[<&5><player.name><&8>] <&5>HAS JOINED THE SERVER<n>"
      #   - determine cancelled
      # - if <[rank]> == HEAD-ADMIN && !<[hidden_op].contains[<player.name>]>:
      #     - announce "<&e><&l><n>HEAD ADMIN <&8>[<&e><player.name><&8>] <&e><&l>HAS JOINED THE SERVER<n>"
      #     - determine cancelled
      # - if <[rank]> == ADMIN && !<[hidden_op].contains[<player.name>]>:
      #   - announce "<&c><&l><n>ADMIN <&8>[<&c><player.name><&8>] <&c><&l>HAS JOINED THE SERVER<n>"
      #   - determine cancelled
    # - define rank <placeholder[luckperms_primary_group_name].to_uppercase>
    # - if <player.name> == 39sakuraa:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == TheyCallMeBish:
    #     - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>JOINED THE SERVER<n>"
    # - if <player.name> == ChyaBr3ad:
    #     - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Chapopey:
    #     - announce "<&gradient[from=#c36891;to=#c36891]><&l><n>A BENEFACTOR++ <&8>[<&gradient[from=#c36891;to=#c36891]><player.name><&8>] <&gradient[from=#c36891;to=#c36891]><&l>JOINED THE SERVER<n>"   
    # - if <player.name> == _KittenBiskit:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == IRONman:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Reeiiiii:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == _MishaDrawz:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == _cheezeonchipz11:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == _DimaPig:
    #     - announce "<&gradient[from=#c36891;to=#c36891]><&l><n>A BENEFACTOR++ <&8>[<&gradient[from=#c36891;to=#c36891]><player.name><&8>] <&gradient[from=#c36891;to=#c36891]><&l>JOINED THE SERVER<n>"
    # - if <player.name> == ilymariz:
    #     - announce "<&gradient[from=#c36891;to=#c36891]><&l><n>A BENEFACTOR++ <&8>[<&gradient[from=#c36891;to=#c36891]><player.name><&8>] <&gradient[from=#c36891;to=#c36891]><&l>JOINED THE SERVER<n>"        
    # - if <player.name> == Eysuu:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == xGlen:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == _callmetiane:
    #     - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Lilfritz:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Kyyylaaaaa:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Flux_G:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Deiaty:
    #     - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Salmon:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == MDmaner:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Gela1405:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == TrshVier:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    # - if <player.name> == Joneel:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>JOINED THE SERVER<n>"
    on player quit:
    # - announce "<&c>- <&7><player.name>"
    # - determine none passively
    - define hidden_op <list[sieccc|ellyieee|YATA_Ein]>
    - if <[hidden_op].contains[<player.name>]>:
      - determine cancelled
    - else:
      - announce "<&c>- <&7><player.name>"
      - determine none passively
      # - define first_tier <list[_cheezeonchipz11|Eysuu|_MishaDrawz|xGlen|Reeiiiii|IRONman|Lilfritz|39sakuraa|_KittenBiskit|Salmon|Kyyylaaaaa|Flux_G|Gela1405|MDmaner|TrshVier|Joneel]>
      # - define second_tier <list[_callmetiane|ChyaBr3ad|TheyCallMeBish|Deiaty]>
      # - define third_tier <list[ilymariz|_DimaPig|Chapopey]>
      # - define rank <placeholder[luckperms_primary_group_name].to_uppercase>
      # - if <[first_tier].contains[<player.name>]>:
      #   - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>HAS LEFT THE SERVER<n>"
      #   - determine cancelled
      # - if <[second_tier].contains[<player.name>]>:
      #   - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>HAS LEFT THE SERVER<n>"
      #   - determine cancelled
      # - if <[third_tier].contains[<player.name>]>:
      #   - announce "<&gradient[from=#c36891;to=#c36891]><&l><n>A BENEFACTOR++ <&8>[<&gradient[from=#c36891;to=#c36891]><player.name><&8>] <&gradient[from=#c36891;to=#c36891]><&l>HAS LEFT THE SERVER<n>"
      #   - determine cancelled
      # - if <[rank]> == OWNER && !<[hidden_op].contains[<player.name>]>:
      #   - announce "<&6><&l><n>OWNER <&8>[<&6><player.name><&8>] <&6><&l>HAS LEFT THE SERVER<n>"
      #   - determine cancelled
      # - if <[rank]> == DEV && !<[hidden_op].contains[<player.name>]>:
      #   - announce "<&5><&l><n>SYSTEM ADMIN <&8>[<&5><player.name><&8>] <&5>HAS LEFT THE SERVER<n>"
      #   - determine cancelled
      # - if <[rank]> == HEAD-ADMIN && !<[hidden_op].contains[<player.name>]>:
      #     - announce "<&e><&l><n>HEAD ADMIN <&8>[<&e><player.name><&8>] <&e><&l>HAS LEFT THE SERVER<n>"
      #     - determine cancelled
      # - if <[rank]> == ADMIN && !<[hidden_op].contains[<player.name>]>:
      #   - announce "<&c><&l><n>ADMIN <&8>[<&c><player.name><&8>] <&c><&l>HAS LEFT THE SERVER<n>"
      #   - determine cancelled
    # - define rank <placeholder[luckperms_primary_group_name].to_uppercase>
    # # - if <[rank]> == DEV:
    # #     - announce "<&5><&l><n>SYSTEM ADMIN HAS LEFT<n><&7><player.name><n>"
    # #     - define rank DEV
    # - if <[rank]> == HEAD-ADMIN:
    #     - announce "<&e><&l><n>HEAD-ADMIN <&8>[<&e><player.name><&8>] <&e><&l>HAS LEFT THE SERVER<n>"
    #     - define rank HEAD-ADMIN
    # - if <[rank]> == ADMIN:
    #     - announce "<&c><&l><n>ADMIN <&8>[<&c><player.name><&8>] <&c><&l>HAS LEFT THE SERVER<n>"
    #     - define rank ADMIN
    # - if <[rank]> == OWNER:
    #     - announce "<&6><&l><n>OWNER <&8>[<&6><player.name><&8>] <&6><&l>HAS LEFT THE SERVER<n>"
    #     - define rank OWNER
    # - if <player.name> == 39sakuraa:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Lilfritz:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == TheyCallMeBish:
    #     - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>LEFT THE SERVER<n>"
    # - if <player.name> == ChyaBr3ad:
    #     - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Chapopey:
    #     - announce "<&gradient[from=#c36891;to=#c36891]><&l><n>A BENEFACTOR++ <&8>[<&gradient[from=#c36891;to=#c36891]><player.name><&8>] <&gradient[from=#c36891;to=#c36891]><&l>LEFT THE SERVER<n>"     
    # - if <player.name> == ilymariz:
    #     - announce "<&gradient[from=#c36891;to=#c36891]><&l><n>A BENEFACTOR++ <&8>[<&gradient[from=#c36891;to=#c36891]><player.name><&8>] <&gradient[from=#c36891;to=#c36891]><&l>LEFT THE SERVER<n>"           
    # - if <player.name> == IRONman:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == _MishaDrawz:
    #     - announce "<&b><&l><n>A BENEFACTOR++ <&8>[<&b><player.name><&8>] <&b><&l>LEFT THE SERVER<n>"
    # - if <player.name> == _DimaPig:
    #     - announce "<&gradient[from=#c36891;to=#c36891]><&l><n>A BENEFACTOR++ <&8>[<&gradient[from=#c36891;to=#c36891]><player.name><&8>] <&gradient[from=#c36891;to=#c36891]><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Eysuu:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Reeiiiii:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == _callmetiane:
    #     - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>LEFT THE SERVER<n>"
    # - if <player.name> == _cheezeonchipz11:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == _KittenBiskit:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Flux_G:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Kyyylaaaaa:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Deiaty:
    #     - announce "<&c><&l><n>A BENEFACTOR+ <&8>[<&c><player.name><&8>] <&c><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Salmon:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == MDmaner:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Gela1405:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == TrshVier:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"
    # - if <player.name> == Joneel:
    #     - announce "<&e><&l><n>A BENEFACTOR <&8>[<&e><player.name><&8>] <&e><&l>LEFT THE SERVER<n>"