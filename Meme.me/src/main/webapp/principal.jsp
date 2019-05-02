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
                        <button type="submit"><img src="imagens/lupa.png" class="icone"></button>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <button onclick="window.location.replace('index.html')" class="w3-button w3-large" id="botao1" >
                                Sair
                            </button>
                        </li>
                        <li>
                            <button onclick="window.location.replace('publicar.html')"class="w3-button w3-large" id="botao2">
                                Publicar   
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>  
    <div class="vertical-menu">
        <img src="imagens/foto-perfil.jpg" class="perfil" style="position: relative;left: 50px;width:100px;height:100px;">
        <br>
        <span style="position: relative;left: 17px;">
            <%=session.getAttribute("nome")%>
        </span>
        <a href="principal.jsp">Feed</a>
        <a href="perfil.html">Perfil</a>
    </div>
    <div id="feed">
        <div class="postagem" id="postagem2">
            <img src="imagens/foto-perfil.jpg" class="perfil">
            Simone Florincy
            <br>
            <img src="imagens/meme1.jpeg" class="padrao">
            <br>
            <div class="opcoes">
                <ul>
                    <li>
                        <img src="imagens/curtir.png" class="icone">
                    </li>
                    <li>
                        <img src="imagens/compartilhar.png" class="icone">
                    </li>
                    <li>
                        <img src="imagens/comentar.png" class="icone">
                    </li>
                    <li>
                        <img src="imagens/denuncia.png" class="icone" onclick="window.location.replace('denunciar.html')">
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
            <img src="imagens/foto-perfil.jpg" class="perfil">
            Simone Florincy
            <br>
            <img src="imagens/meme2.png" class="padrao">
            <br>
            <div class="opcoes">
                <ul>
                    <li>
                        <img src="imagens/curtir.png" class="icone">
                    </li>
                    <li>
                        <img src="imagens/compartilhar.png" class="icone">
                    </li>
                    <li>
                        <img src="imagens/comentar.png" class="icone">
                    </li>
                    <li>
                        <img src="imagens/denuncia.png" class="icone" onclick="window.location.replace('denunciar.html')">
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