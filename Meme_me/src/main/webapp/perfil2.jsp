<%-- 
    Document   : perfil
    Created on : 20/06/2019, 00:58:14
    Author     : florincy
--%>

<jsp:directive.page import="java.util.*" />
<%@page import="org.hibernate.Transaction"%>
<%@page import="br.edu.iff.meme.entidades.Post"%>
<%@page import="br.edu.iff.meme.utilidades.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css_tabela.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script>
            function muda() {
                var imagem = document.getElementById('fotoPerfil');
                var imagem2 = document.getElementById('fotoBio');
                var imagem3 = document.getElementById('fotoPerfil3');
                var imagem4 = document.getElementById('fotoPerfil4');
                var caminho = document.getElementById('caminho').innerHTML.trim();
                var pasta = "imagens/";
                var junto = pasta + caminho;
                imagem.src = junto;
                imagem2.src = junto;
                imagem3.src = junto;
                imagem4.src = junto;
            }
        </script>
    </head>
    <body onload="muda()">
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
            Session session1 = HibernateUtil.getSession();
            Transaction tr = session1.beginTransaction();
            String hql = "from Post where user_cd_user_meme='" + user.getCdUsuarioMeme() + "'";
            //Post postagem = (Post) session1.createQuery(hql).list();
            List<Post> lista = (List) session1.createQuery(hql).list();
            request.setAttribute("postagens", lista);
            System.out.println(lista);
            tr.commit();
        %>
        <div id = "fundo1">



            <!--
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
            -->
            <div id="tabela">
                <display:table name="postagens">
                    <br>
                    <div id="test">
                    <display:column property="dsPost" title="Descrição"/>
                    </div>
                    <display:column property="tsMoments" title="Tempo"/>
                    <display:caption>Postagens</display:caption>
                </display:table>
            </div>
        </div>              
    </body>
</html>
