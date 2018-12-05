<%-- 
    Document   : principal
    Created on : 05/12/2018, 12:53:33
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
  <head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>Meme.Me</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="login_css.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <style type="text/css">

    html{
      background-color: #f8f8f8;
    }
    #fundo1{
      background-color: #28bfa0;
    }
    .vertical-menu {
    width: 250px;
    position: fixed;
    top: 80px;
    color: #7b7b7b;
    }
    .vertical-menu a {
      background-color: #28bfa0;
      color: black;
      display: block;
      padding: 13px;
      text-decoration: none;
      color: #f5f6f7;
    }
    .vertical-menu a:hover {
      background-color: #ccc;
      color: #000;
    }
    .vertical-menu a.active {
      background-color: #28bfa0;
      color: white;
    }
    .perfil{
      border-radius: 50%;
      width: 50px;
      height: 50px;
    }
    #feed{
      background-color: #3f3f3f;
      position: absolute;
      left: 200px;
      width: 1500px;
      height:  2100px;
      top: 80px;

    }
    .padrao{
      width: 600px;
      height: 600px;
      position: relative;
      top: 20px;

    }
    .dataHora{
      position: relative;
      left: 130px;
      font-size: 15px;

    }
    .legenda{
      position: relative;
      top: 10px;
    }
    .icone{
      height: 30px;
      width: 30px;
    }
    .opcoes ul li {
      display: inline;
      padding: 6px;
    }
    .opcoes{
      position: relative;
      right: 30px;
      top: 20px;
    }
    .postagem{
      position: relative;
      left: 280px;
      background-color: #f8f8f8;
      width: 603px;
      border-top: solid  20px #3f3f3f;
      color: #7b7b7b;
      padding: 2px;
    }
    #menu{
      z-index: 3;
      position: fixed;
      width: 1500px;
    }
    #barra-busca{
      position: absolute;
      left: 800px;
    }
  </style>
  <body>
    <div id="fundo1">
      <nav class="navbar navbar-default" id="menu">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="index.html">Meme.Me</a>
            <div id="barra-busca">
              <input type="text" placeholder="Procurar" name="search" style="color: black;">
              <button type="submit"><img src="lupa.png" class="icone"></button>
            </div>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
              <li>
                <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-large" id="botao1">
                  Sair
                </button>
              </li>
              <li>
                  <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-large" id="botao2">
                    <a href="publicar.html">
                      Publicar
                    </a>
                  </button>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>  
    <div class="vertical-menu">
      <img src="foto-perfil.jpg" class="perfil" style="position: relative;left: 50px;width:100px;height:100px;">
      <br>
      <span style="position: relative;left: 17px;">
        <%=session.getAttribute("nome")%>
      </span>
      <a href="principal.html">Feed</a>
      <a href="perfil.html">Perfil</a>
    </div>
    <div id="feed">
      <div class="postagem" id="postagem2">
        <img src="foto-perfil.jpg" class="perfil">
        Simone Florincy
        <br>
        <img src="meme1.jpeg" class="padrao">
        <br>
        <div class="opcoes">
          <ul>
            <li>
              <img src="curtir.png" class="icone">
            </li>
            <li>
              <img src="compartilhar.png" class="icone">
            </li>
            <li>
              <img src="comentar.png" class="icone">
            </li>
            <li>
              <img src="denuncia.png" class="icone">
            </li>
            <li>
              <span class="dataHora">
                19:45 13/11/2018
              </span>
            </li>
          </ul>
        </div>
        <span class="legenda">
          Só li verdades! 
        </span>
      </div>

      <div class="postagem">
        <img src="foto-perfil.jpg" class="perfil">
        Simone Florincy
        <br>
        <img src="meme2.png" class="padrao">
        <br>
        <div class="opcoes">
          <ul>
            <li>
              <img src="curtir.png" class="icone">
            </li>
            <li>
              <img src="compartilhar.png" class="icone">
            </li>
            <li>
              <img src="comentar.png" class="icone">
            </li>
            <li>
              <img src="denuncia.png" class="icone">
            </li>
            <li>
              <span class="dataHora">
                21:26 13/11/2018
              </span>
            </li>
          </ul>
        </div>
        <span class="legenda">
          The zoeira never ends!
        </span>
        <br>
      </div>
     </div>
  </body>
</html>