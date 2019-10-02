<%-- 
    Document   : publicar
    Created on : 29/09/2019, 18:26:06
    Author     : guilhermePV
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
        <script src="https://code.jquery.com/jquery-1.11.2.js"></script>
        <script type="text/javascript">
            function muda() {
                var imagem = document.getElementById('fotoPerfil');
                var caminho = document.getElementById('caminho').innerHTML.trim();
                var pasta = "imagens/";
                var junto = pasta + caminho;
                imagem.src = junto;
            }
        </script>
    </script>
</head>





<body onload="muda()">
    <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");%>
    <div id = "fundo1">
        <span id="caminho" hidden>
            <%=user.getDsPhoto()%>
        </span>
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
            </div>
        </nav>

        <div class="vertical-menu">

            <img src="imagens/foto-perfil.jpg" class="perfil" style="position: relative;left: 50px;width:100px;height:100px;" id="fotoPerfil">
            <br>
            <span style="position: relative;left: 17px;">
                <%=user.getNick()%>
            </span>
            <a href="principal.jsp">
                Feed
            </a>
            <a href="perfil.jsp">Perfil</a>

        </div>
    </div>
</div>  
<section id="feed">

    <center><h1 style="position: relative; left: -400px">Publicação</h1></center> 
    <article>

        <p >  <form method="post" action="SalvaPostagem" enctype="multipart/form-data">                   
            <center> <input  name="id" type="text" value="<%=user.getCdUsuarioMeme()%>" hidden/>  </center>   <br>
            <center>  <input   style="position: relative; left: -400px" max-height: 50px" id="imagem" name="imagem" type="file" accept=".gif,.jpg,.jpeg,.png" > </center>  <br>
            <center>  <textarea placeholder="Comentar..." cols="30" rows="5" style="position: relative; left: -400px" name="descricao"></textarea>                                   </center> <br>    
            <!--   <input  type="text" id="date">                                                 -->
            <center>   <input style="position: relative; left: -400px"  type="submit" value="Postar"/>                                     </center>  <br>  
        </form></p>
    </article>
</section>

</body>
</html>
