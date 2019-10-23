<%-- 
    Document   : principal
    Created on : 05/12/2018, 12:53:33
    Author     : aluno
--%>

<%@page import="java.util.Base64"%>
<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
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
    <body onload="muda()">
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
            byte[] foto = user.getFoto();
            String encodedImage = Base64.getEncoder().encodeToString(foto);
        %>
        <%@include file="WEB-INF/jspf/menuPrincipal.jspf"%>
        <%@include file="WEB-INF/jspf/menuLateral.jspf"%>
        <div id="feed">
            <div class="postagem" id="postagem2">
                <img src="data:image/png;base64,<%=encodedImage%>" class="perfil">
                <%=user.getNick()%>
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
                <img src="data:image/png;base64,<%=encodedImage%>" class="perfil">
                <%=user.getNick()%>
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