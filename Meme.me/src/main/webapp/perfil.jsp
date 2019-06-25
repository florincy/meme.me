<%-- 
    Document   : perfil
    Created on : 20/06/2019, 00:58:14
    Author     : florincy
--%>

<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
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
    <body>
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");%>
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
                    <div class="collapse navbar-collapse"id="myNavbar">
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
                <%=user.getNick()%>
            </span>
            <a href="principal.jsp">
                Feed
            </a>
            <a href="perfil.jsp">
                Perfil
            </a>
        </div>
        <div id="feed">
            <div id="perfilbloco">
                <span id="nome-usuario">
                    <%=user.getNick()%>
                </span>
                <br>
                <img src="imagens/foto-perfil.jpg" class="fotoperfil">
                <br>
                <span id="bio-usuario">
                    <%=user.getBio()%>
                </span>
                <table id="infMeme">
                    <tr>
                        <td class="inf">
                            <b>
                                500
                            </b>
                        </td>
                        <td class="inf">
                            <b>
                                200
                            </b>
                        </td>
                        <td class="inf">
                            <b>
                                12
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="inf">
                            Seguidores
                        </td>
                        <td class="inf">
                            Seguindo
                        </td>
                        <td class="inf">
                            Postagens
                        </td>
                    </tr>
                </table>
                <table id="galeria">
                    <tr>
                        <td><img src="imagens/meme-new.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novooo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-newww.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novo.jpg" class="fotos-galeria"></td>
                    </tr>
                    <tr>
                        <td><img src="imagens/meme-new.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-newww.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-neww.jpg" class="fotos-galeria"></td>
                    </tr>
                    <tr>
                        <td><img src="imagens/meme-novoo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novooo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-new.jpg" class="fotos-galeria"></td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
