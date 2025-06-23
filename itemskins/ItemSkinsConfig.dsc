item_skins_config:
    type: data
    messages:
        cmd-syntax: <red>Error! Correct usage is /itemskin (player) (skin) (amount)
        cmd-player-not-found: <red>Player not found!
        cmd-skin-not-found: <red>Skin not found!
        only-survival: <red>You can only apply skins on survival mode!
        skin-not-applicable: <red>This skin is not applicable to this item!
        skin-applied: <green>Applied skin <gold><[skin_data].get[name]> <green>to item!
        no-skin-applied: <red>No skin applied to item!
        skin-removed: <green>Removed skin from item!
    skins:
        # custom model data for the skin
        red_skin:
            name: <&8><&l>Darkblade
            custom_model_data: 1138
            description: <gray>skin description
            applicable-items:
            - netherite_sword
            - iron_sword

# placeholder item for the skins
placeholder_skin_item:
    type: item
    material: paper
    mechanisms:
        custom_model_data: 1019
        hides: all
    enchantments:
    - damage_all: 1
    flags:
        is_skin_placeholder: true


skin_remover_item:
    type: item
    material: gold_nugget
    mechanisms:
        custom_model_dwata: 10001
        hides: all
    enchantments:
    - damage_all: 1
    flags:
        is_skin_remover: true
