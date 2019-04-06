<%
   import scload, query, crawl_utils, html

   c = attributes['cursor']
   player = attributes['player']
  
   games_git = query.get_player_games(c, player, "data/cko-logfile-git")
   games_0_23 = query.get_player_games(c, player, "data/cko-logfile-0.23")#, '0.23-a0')
   games_0_22 = query.get_player_games(c, player, "data/cko-logfile-0.22")#, '0.22-a0')
   games_0_21 = query.get_player_games(c, player, "data/cko-logfile-0.21")
   games_0_18 = query.get_player_games(c, player, "data/cko-logfile-0.18")
   games_bcrawl = query.get_player_games(c, player, "data/cko-logfile-bcrawl")
   games_hellcrawl = query.get_player_games(c, player, "data/cko-logfile-hellcrawl")
   games_bcadrencrawl = query.get_player_games(c, player, "data/cko-logfile-bcadrencrawl")
   games_gooncrawl = query.get_player_games(c, player, "data/cko-logfile-gooncrawl")
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
          "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>${crawl_utils.THIS_SERVER} Morgue: ${player}</title>
    <link rel="stylesheet" type="text/css" href="../score.css">
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
        <h2>${crawl_utils.THIS_SERVER} Morgue: ${player}</h2>
        <p>This page displays a history of all games played by ${player} on ${crawl_utils.THIS_SERVER_LONG}.<br>Click on the score to view the character file.</p>

        <div class="content">
          <div class="tab">
            <button class="tablinks" onclick="openGame(event, 'games_git')" id="defaultOpen">trunk</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_23')">0.23</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_22')">0.22</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_21')">0.21</button>
            <button class="tablinks" onclick="openGame(event, 'games_0_18')">0.18</button>
            <button class="tablinks" onclick="openGame(event, 'games_hellcrawl')">hellcrawl</button>
            <button class="tablinks" onclick="openGame(event, 'games_bcrawl')">bcrawl</button>
            <button class="tablinks" onclick="openGame(event, 'games_bcadrencrawl')">BcadrenCrawl</button>
            <button class="tablinks" onclick="openGame(event, 'games_gooncrawl')">Gooncrawl</button>
          </div>

          <div class="game_table" id="games_git">
            ${html.full_games_table(games_git, count=False, win=False)}
          </div>
          <div class="game_table" id="games_0_23">
            ${html.full_games_table(games_0_23, count=False, win=False)}
          </div>
          <div class="game_table" id="games_0_22">
            ${html.full_games_table(games_0_22, count=False, win=False)}
          </div>
          <div class="game_table" id="games_0_21">
            ${html.full_games_table(games_0_21, count=False, win=False)}
          </div>
          <div class="game_table" id="games_0_18">
            ${html.full_games_table(games_0_18, count=False, win=False)}
          </div>
          <div class="game_table" id="games_hellcrawl">
            ${html.full_games_table(games_hellcrawl, count=False, win=False)}
          </div>
          <div class="game_table" id="games_bcrawl">
            ${html.full_games_table(games_bcrawl, count=False, win=False)}
          </div>
          <div class="game_table" id="games_bcadrencrawl">
            ${html.full_games_table(games_bcadrencrawl, count=False, win=False)}
          </div>
          <div class="game_table" id="games_gooncrawl">
            ${html.full_games_table(games_gooncrawl, count=False, win=False)}
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
