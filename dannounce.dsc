dAnnounce:
  type: command
  debug: false
  name: dannounce
  usage: /dannounce
  # permission: denizen.admin
  description: Latest discord announcements
  script:
    - playsound <player.location> sound:ENTITY_ENDER_DRAGON_FLAP volume:0.5
    - define text <list[<&0><n><n>Hello <&l><player.name>,<n><n><n><&0>Please check the latest announcements on discord.]>
    - adjust <player> show_book:written_book[book_pages=<[text]>;book_title=nan;book_author=nan]
