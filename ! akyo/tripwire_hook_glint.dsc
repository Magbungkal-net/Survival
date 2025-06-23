tripwirte_hook_glint:
    type: item
    debug: false
    material: tripwire_hook
    display name: <red><bold>NAME OF AN ITEM
    enchantments:
    - unbreaking:1
    mechanisms:
        hides: ENCHANTS

tripwirte_hook_glint_command:
    type: command
    debug: false
    name: tripwritehook
    permission: denizen.admin
    description: Text
    usage: /tripwirehook
    script:
    - give tripwirte_hook_glint quantity:1