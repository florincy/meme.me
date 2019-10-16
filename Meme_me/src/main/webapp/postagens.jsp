<%-- 
    Document   : postagens
    Created on : 09/10/2019, 12:12:02
    Author     : aluno
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.iff.meme.entidades.Post"%>
<%@page import="br.edu.iff.meme.utilidades.HibernateUtil"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Base64"%>
<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="login_css.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
            byte[] fotoPerfil = user.getFoto();
            String perfilFoto = Base64.getEncoder().encodeToString(fotoPerfil);
        %>
        <nav class="navbar navbar-default" id="menu">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="index.jsp">Meme.Me</a>
                    <div id="barra-busca">
                        <input type="text" placeholder="Procurar" name="search" style="color: black;">
                        <button type="submit"><img src="imagens/lupa.png" class="icone"></button>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="ServletLogoutUsuarioMeme" class="w3-button w3-large" id="botao1">
                                Sair
                            </a>
                        </li>
                        <li>
                            <a href="publicar.jsp" class="w3-button w3-large" id="botao2">
                                Publicar   
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="vertical-menu">
            <img src="data:image/png;base64,<%=perfilFoto%>" class="perfil" style="position: relative;left: 50px;width:100px;height:100px;">
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
            <a href="postagens.jsp">
                Postagens
            </a>
        </div>
        <div id="postagens">
            <%
                Session session1 = HibernateUtil.getSession();
                String hql = "from Post where user_cd_user_meme='" + user.getCdUsuarioMeme() + "'";
                //Post postagem = (Post) session1.createQuery(hql).list();
                List<Post> lista = (List) session1.createQuery(hql).list();
                request.setAttribute("postagens", lista);
                System.out.println(lista);
                for (Iterator it = lista.iterator(); it.hasNext();) {

                    Post postagem = (Post) it.next();
                    String codigo = postagem.getCdPost().toString();
                    byte[] fotoPostagem = postagem.getFoto();
                    String postagemFoto = Base64.getEncoder().encodeToString(fotoPostagem);
                    UsuarioMeme usuario = new UsuarioMeme();
                    usuario = postagem.getUserCdUserMeme();
            %>

            <div class="postagem">
                <img src="data:image/png;base64,<%=perfilFoto%>" class="perfil">
                <span>
                    <%=usuario.getNick()%>
                </span>
                <img src="data:image/png;base64,<%=postagemFoto%>" class="padrao">
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
                            <img src="imagens/comentar.png" class="icone" >
                        </li>
                        <li>
                            <img src="imagens/denuncia.png" class="icone">
                        </li>
                        <li>
                            <span class="dataHora">
                                <%=postagem.getTsMoments()%>
                            </span>
                        </li>
                    </ul>
                </div>
                <span class="legenda">
                    <%=postagem.getDsPost()%>

                </span>
            </div>

            <%
                }
            %>
        </div>
    </body>
</html>
