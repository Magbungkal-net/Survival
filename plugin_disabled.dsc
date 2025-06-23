plugin_command_disabler:
  type: world
  debug: false
  events:
    on command bukkit_priority:low priority:-10:
    - if <context.source_type> == player:
      - if <player.is_op.not>:
        #- if <context.command.contains_text[:]> || <script[command_list_data].data_key[disabled].contains[<context.command>]>:
        - if <script[command_list_data].data_key[disabled].contains[<context.command>]>:
          - narrate <proc[unknown_cmd]>
          - determine fulfilled

unknown_cmd:
  type: procedure
  debug: false
  script:
  - determine "<&8><&l>[<&gradient[from=#7C4751;to=#7C4751]><bold>Magbungkal<reset><&8><&l>] <&f>Plugins (6): <&a>MagbungkalLib<&f>,<&a> MagbungkalPrevention<&f>,<&a> MagbungkalCustomTextures,<&a> MagbungkalDiscord<&f>,<&a> MagbungkalAntiCheat<&f>,<&a> MagbungkalVoiceChat"

command_list_data:
  type: data
  disabled:
  - ?
  - pl
  - plugins
  - ver
  - version
  - about
  - icanhasbukkit