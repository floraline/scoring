<%
   import scload, query, crawl_utils, html
   c = attributes['cursor']

   players_git = query.get_best_players(c, "data/cko-logfile-git")
   players_0_23 = query.get_best_players(c, "data/cko-logfile-0.23", "0.23-a0")
   players_0_22 = query.get_best_players(c, "data/cko-logfile-0.22", "0.22-a0")
   players_0_21 = query.get_best_players(c, "data/cko-logfile-0.21")
   players_0_18 = query.get_best_players(c, "data/cko-logfile-0.18")
   players_bcrawl = query.get_best_players(c, "data/cko-logfile-bcrawl")
   players_hellcrawl = query.get_best_players(c, "data/cko-logfile-hellcrawl")
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
          "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>CKO Players Ranked by Total Score</title>
    <link rel="stylesheet" type="text/css" href="score.css">
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
        <h2>CKO Players Ranked by Total Score</h2>

        <div class="content">
          <div class="tab">
            <button class="tablinks" onclick="openGame(event, 'players_git')" id="defaultOpen">trunk</button>
            <button class="tablinks" onclick="openGame(event, 'players_0_23')">0.23</button>
            <button class="tablinks" onclick="openGame(event, 'players_0_22')">0.22</button>
            <button class="tablinks" onclick="openGame(event, 'players_0_21')">0.21</button>
            <button class="tablinks" onclick="openGame(event, 'players_0_18')">0.18</button>
            <button class="tablinks" onclick="openGame(event, 'players_bcrawl')">bcrawl</button>
            <button class="tablinks" onclick="openGame(event, 'players_hellcrawl')">hellcrawl</button>
          </div>
          
          <div class="game_table" id="players_git">
            ${html.best_players_by_total_score(players_git)}
          </div>
          <div class="game_table" id="players_0_23">
            ${html.best_players_by_total_score(players_0_23)}
          </div>
          <div class="game_table" id="players_0_22">
            ${html.best_players_by_total_score(players_0_22)}
          </div>
          <div class="game_table" id="players_0_21">
            ${html.best_players_by_total_score(players_0_21)}
          </div>
          <div class="game_table" id="players_0_18">
            ${html.best_players_by_total_score(players_0_18)}
          </div>
          <div class="game_table" id="players_bcrawl">
            ${html.best_players_by_total_score(players_bcrawl)}
          </div>
          <div class="game_table" id="players_hellcrawl">
            ${html.best_players_by_total_score(players_hellcrawl)}
          </div>
        </div>
      </div>
    </div>

    ${html.update_time()}
<script>
  document.getElementById("defaultOpen").click();
</script>
  </body>
</html>
