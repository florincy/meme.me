<%-- 
    Document   : publicar
    Created on : 29/09/2019, 18:26:06
    Author     : florincy
--%>

<%@page import="javax.swing.JFileChooser"%>
<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <style type="text/css">
            #selectid{
                width:150;
                font-size:11px;
            }
        </style>
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
        <script>
           // var absolutePath = $("imagem").attr("src");
        </script>
    </head>
    <body>
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");%>
        <div id = "fundo1">
            <nav class="navbar navbar-default" id="menu">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                        <a class="navbar-brand" href="index.html">Meme.Me</a>       
                    </div>
            </nav>
        </div>  
        <div id="feed">
            <!--enctype="multipart/form-data"-->
            <form method="post" action="SalvaPostagem" enctype="multipart/form-data">
                <input name="id" type="text" value="<%=user.getCdUsuarioMeme()%>" hidden/>
                <input id="imagem" name="imagem" type="file" accept=".gif,.jpg,.jpeg,.png" >
                <textarea name="descricao"></textarea>
                <input  type="submit" value="Postar"/>           
            </form>
        </div>

    </body>
</html>