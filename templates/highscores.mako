<%
   import scload, query, crawl_utils, html

   c = attributes['cursor']

   games_git = query.get_top_games(c, "data/cko-logfile-git")
   games_0_25 = query.get_top_games(c, "data/cko-logfile-0.25")#, "0.25-a0")
   games_0_24 = query.get_top_games(c, "data/cko-logfile-0.24")#, "0.24-a0")
   games_0_23 = query.get_top_games(c, "data/cko-logfile-0.23")#, "0.23-a0")
   games_0_22 = query.get_top_games(c, "data/cko-logfile-0.22")#, "0.22-a0") # include trunk games targeting this version?
   games_0_21 = query.get_top_games(c, "data/cko-logfile-0.21")
   games_0_18 = query.get_top_games(c, "data/cko-logfile-0.18")
   games_bcrawl = query.get_top_games(c, "data/cko-logfile-bcrawl")
   games_hellcrawl = query.get_top_games(c, "data/cko-logfile-hellcrawl")
   games_bcadrencrawl = query.get_top_games(c, "data/cko-logfile-bcadrencrawl")
   games_gooncrawl = query.get_top_games(c, "data/cko-logfile-gooncrawl")
   games_stoatsoup = query.get_top_games(c, "data/cko-logfile-stoatsoup")
   games_bloatcrawl2 = query.get_top_games(c, "data/cko-logfile-bloatcrawl2")
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
          "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>High Scores on ${crawl_utils.THIS_SERVER}</title>
    <link rel="stylesheet" type="text/css" href="score.css">
    <style>
      td:nth-child(6) { white-space: normal; }
    </style>
    <script>
      function openGame(evt, gameName) {
        // Declare all variables
        var i, tabcontent, tablinks;
      
        // Get all elements with class="tabcontent" and hide them
        tabcontent = document.getElementsByClassName("game_table");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }
      
        // Get all elements with class="tablinks" and remove the class "active"
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
      
        // Show the current tab, and add an "active" class to the button that opened the tab
        document.getElementById(gameName).style.display = "block";
        evt.currentTarget.className += " active";
      }
    </script>
  </head>

  <body class="page_back">
    <div class="page">
      <%include file="toplink.mako"/>
      <div class="page_content">
        <h2>High Scores on ${crawl_utils.THIS_SERVER}</h2>
        <div class="content">
          <div class="tab">
            <button class="tablinks" onclick="openGame(event, 'games_git')" id="defaultOpen">trunk</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_25')">0.25</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_24')">0.24</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_23')">0.23</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_22')">0.22</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_21')">0.21</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_18')">0.18</button>
            <button class="tablinks" onclick="openGame(event, 'games_hellcrawl')">hellcrawl</button>
            <button class="tablinks" onclick="openGame(event, 'games_bcrawl')">bcrawl</button>
            <button class="tablinks" onclick="openGame(event, 'games_bcadrencrawl')">BcadrenCrawl</button>
            <button class="tablinks" onclick="openGame(event, 'games_gooncrawl')">Gooncrawl</button>
            <button class="tablinks" onclick="openGame(event, 'games_stoatsoup')">StoatSoup</button>
            <button class="tablinks" onclick="openGame(event, 'games_bloatcrawl2')">Bloatcrawl 2</button>
          </div>

          <div class="game_table" id="games_git">
            ${html.full_games_table(games_git, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_0_25">
            ${html.full_games_table(games_0_25, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_0_24">
            ${html.full_games_table(games_0_24, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_0_23">
            ${html.full_games_table(games_0_23, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_0_22">
            ${html.full_games_table(games_0_22, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_0_21">
            ${html.full_games_table(games_0_21, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_0_18">
            ${html.full_games_table(games_0_18, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_bcrawl">
            ${html.full_games_table(games_bcrawl, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_hellcrawl">
            ${html.full_games_table(games_hellcrawl, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_bcadrencrawl">
            ${html.full_games_table(games_bcadrencrawl, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_gooncrawl">
            ${html.full_games_table(games_gooncrawl, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_stoatsoup">
            ${html.full_games_table(games_stoatsoup, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
          <div class="game_table" id="games_bloatcrawl2">
            ${html.full_games_table(games_bloatcrawl2, columns=html.STOCK_COLUMNS, count=True, win=False)}
          </div>
        </div>
      </div> <!-- content -->
    </div> <!-- page -->

    ${html.update_time()}
<script>
  document.getElementById("defaultOpen").click();
</script>
  </body>
</html>
