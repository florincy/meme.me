<%-- 
    Document   : publicar
    Created on : 29/09/2019, 18:26:06
    Author     : guilhermePV
--%>

<%@page import="java.util.Base64"%>
<%@page import="javax.swing.JFileChooser"%>
<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%><!DOCTYPE html>
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
        <script src="https://code.jquery.com/jquery-1.11.2.js"></script>

    </script>
</head>
<body>
    <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
        byte[] foto = user.getFoto();
        String encodedImage = Base64.getEncoder().encodeToString(foto);
        %>
    <div id = "fundo1">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="index.jsp">Meme.Me</a>
                </div>
            </div>
        </nav>
        <%@include file="WEB-INF/jspf/menuLateral.jspf"%>
    </div>
</div>  
<section id="feed">
    <div id="centro">
        <center><h1 style="position: relative; left: -400px;">Publicação</h1></center> 
        <article>
            <p>
            <form method="post" action="SalvaPostagem" enctype="multipart/form-data">                   
                <center> <input  name="id" type="text" value="<%=user.getCdUsuarioMeme()%>" hidden/>  </center>   <br>
                <center>  <input style="position: relative; left: -400px" max-height: 50px" id="imagem" name="imagem" type="file" accept=".gif,.jpg,.jpeg,.png" > </center>  <br>
                <center>  <textarea placeholder="Comentar..." cols="30" rows="5" style="position: relative; left: -400px" name="descricao"></textarea>                                   </center> <br>    
                <!--   <input  type="text" id="date">                                                 -->
                <center>   <input style="position: relative; left: -400px"  type="submit" value="Postar"/>                                     </center>  <br>  
            </form>
            </p>
        </article>
    </div>
</section>
</body>
</html>
