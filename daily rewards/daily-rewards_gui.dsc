DailyRewardsGUI:
    type: inventory
    inventory: CHEST
    title: <&6><&l>Hi <placeholder[player_name]>, <&6>Please claim your daily:)
    size: 27
    gui: true
    definitions:
       random_chest: <item[DailyRewardsRandomChest]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [random_chest] [] [] [] []
    - [] [] [] [] [] [] [] [] []

DailyRewardsGUIHandler:
  type: world
  debug: false
  events:
    on player drags in dailyrewardsgui:
    - determine cancelled
    on player clicks in dailyrewardsgui:
    - if <context.item> == air:
      - determine cancelled
    - define player <player>
    - if <context.item> == <item[dailyrewardsrandomchest]>:
      - define coins.reward.3d <script[dailyrewardsdata].parsed_key[coins].get[3d]>
      - define coins.reward.7d <script[dailyrewardsdata].parsed_key[coins].get[7d]>
      - define coins.reward.12d <script[dailyrewardsdata].parsed_key[coins].get[12d]>
      - define coins.reward.15d <script[dailyrewardsdata].parsed_key[coins].get[15d]>
      - define coins.reward.21d <script[dailyrewardsdata].parsed_key[coins].get[21d]>
      - define coins.reward.29d <script[dailyrewardsdata].parsed_key[coins].get[29d]>

      - define money.reward.3d <script[dailyrewardsdata].parsed_key[money].get[3d]>
      - define money.reward.7d <script[dailyrewardsdata].parsed_key[money].get[7d]>
      - define money.reward12d <script[dailyrewardsdata].parsed_key[money].get[12d]>
      - define money.reward.15d <script[dailyrewardsdata].parsed_key[money].get[15d]>
      - define money.reward.21d <script[dailyrewardsdata].parsed_key[money].get[21d]>
      - define money.reward.29d <script[dailyrewardsdata].parsed_key[money].get[29d]>


      - define playtime <placeholder[statistic_time_played:days]>

      - if <[playtime]> <= 3:
         - define 3d.rewards <list[<[coins.reward.3d]>|<[money.reward.3d]>].random>

         - execute as_server " <[3d.rewards]> "
         - inventory close
      
      - else if <[playtime]> <= 7:
         - define 7d.rewards <list[<[coins.reward.7d]>|<[money.reward.7d]>].random>

         - execute as_server " <[7d.rewards]> "
         - inventory close
      
      - else if <[playtime]> <= 12:
         - define 12d.rewards <list[<[coins.reward.12d]>|<[money.reward.12d]>].random>

         - execute as_server " <[12d.rewards]> "
         - inventory close

      - else if<[playtime]> <= 15:
         - define 15d.rewards <list[<[coins.reward.15d]>|<[money.reward.15d]>].random>

         - execute as_server " <[15d.rewards]> "
         - inventory close

      - else if <[playtime]> <= 21:
         - define 21d.rewards <list[<[coins.reward.21d]>|<[money.reward.21d]>].random>

         - execute as_server " <[21d.rewards]> "
         - inventory close

      - else if <[playtime]> <= 30:
         - define 30d.rewards <list[<[coins.reward.29d]>|<[money.reward.29d]>].random>

         - execute as_server " <[30d.rewards]> "
         - inventory close

      - else if <[playtime]> >= 30:
         - define 31d.rewards <list[<[coins.reward.29d]>|<[money.reward.29d]>].random>

         - execute as_server " <[31d.rewards]> "
         - inventory close

      - flag <[player]> daily_reward expire:24h