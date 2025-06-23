itemlore_command:
  type: command
  name: melore
  description: Modify the lore of the item you're holding.
  usage: /melore [line number] [new lore] | /itemlore remove [line number] | /itemlore removeall
  permission: itemlore.use
  script:
  - if <context.args.size> == 0:
    - narrate "Usage: /itemlore [line number] [new lore] | /itemlore remove [line number] | /itemlore removeall"
  - else:
    - define mode <context.args.get[1].to_lowercase>
    # - if <player.item_in_hand.material.name> == "AIR":
    #   - narrate "You are not holding any item."
    # - else if <def[mode]> == "removeall":
    #   - if <context.args.size> == 1:
    #     - inventory adjust slot:<player.item_in_hand> lore:
    #     - narrate "All item lore removed."
    #   - else:
    #     - narrate "Usage: /itemlore removeall"
    - if <[mode]> == remove:
      - if <context.args.size> == 2:
        - define line <context.args.get[2]>
        - if <player.item_in_hand.lore.size> > <[line]>:
          - inventory adjust slot:<player.item_in_hand> lore:<player.item_in_hand.lore.remove[<[line]>]>
          - narrate "Item lore line <context.args.get[2]> removed."
        - else:
          - narrate "Invalid line number."
      - else:
        - narrate "Usage: /itemlore remove [line number]"
    - else:
      - define line <context.args.get[1]>
      - if <context.args.size> > 2:
        - define new_lore <context.args.get[2].to[<context.args.size>].escaped>
        - if <player.item_in_hand.lore.size> > <[line]>:
        #   - inventory adjust slot:<player.item_in_hand> lore:<player.item_in_hand.lore.set.at[<[line]>]>
          - narrate "Item lore line <context.args.get[1]> set to '<[new_lore]>'."
        - else:
          - narrate "Invalid line number."
      - else:
        - narrate "Usage: /itemlore [line number] [new lore]"
