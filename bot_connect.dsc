magbungkal_bot_connect:
  type: task
  debug: false
  script:
  - ~discordconnect id:magbungkal token:<secret[token]>

magbungkal_bot_main_events:
  type: world
  debug: false
  events:
    after server start:
    - run magbungkal_bot_connect