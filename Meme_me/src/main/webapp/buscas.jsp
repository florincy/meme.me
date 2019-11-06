<%-- 
    Document   : buscas
    Created on : 22/10/2019, 12:47:23
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
        <title>buscar</title>
    </head>
    <body>
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
            byte[] fotoPerfil = user.getFoto();
            String perfilFoto = Base64.getEncoder().encodeToString(fotoPerfil);
            List lista = (List) session.getAttribute("buscas");
            System.out.println(lista);
        %>
        <%@include file="WEB-INF/jspf/menuPrincipal.jspf"%>
        <%@include file="WEB-INF/jspf/menuLateral.jspf"%>
        <div id="feed">
            <div id="busca">
                <ul style="list-style-type: none;" id="buscaUsuariosMeme">
                    <li>Usuários</li>
                        <%                            for (Iterator it = lista.iterator(); it.hasNext();) {
                                UsuarioMeme usuario = (UsuarioMeme) it.next();
                                String nick = usuario.getNick();
                                String cd = String.valueOf(usuario.getCdUsuarioMeme());
                                System.out.println(nick);
                                byte[] fotoPerfilBusca = usuario.getFoto();
                                String perfilFotoBusca = Base64.getEncoder().encodeToString(fotoPerfilBusca);
                                
                        %>
                    <li>
                        <a href="perfilBuscas.jsp?cd=<%=cd%>">
                        <div class="linha">
                            <img src="data:image/png;base64,<%=perfilFotoBusca%>" class="perfil">
                            <span class="nick">
                                <%=nick%>
                            </span>
                        </div>
                        </a>
                    <li>
                        <%                        }
                        %>
                </ul>
            </div>
        </div>
    </body>
</html>

