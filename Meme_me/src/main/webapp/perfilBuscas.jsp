<%-- 
    Document   : perfilBuscas
    Created on : 29/10/2019, 12:55:12
    Author     : aluno
--%>
<%@page import="org.hibernate.Query"%>
<jsp:directive.page import="java.util.*" />
<%@page import="org.hibernate.Transaction"%>
<%@page import="br.edu.iff.meme.entidades.Post"%>
<%@page import="br.edu.iff.meme.utilidades.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
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
        <%
            UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
            UsuarioMeme usuario = (UsuarioMeme) session.getAttribute("buscado");
            byte[] fotoPerfilBusca = usuario.getFoto();
            String perfilFotoBusca = Base64.getEncoder().encodeToString(fotoPerfilBusca);
            Session session2 = HibernateUtil.getSession();
            String hql = "select count(*) from Post where user_cd_user_meme='" + usuario.getCdUsuarioMeme() + "'";
            Query query = session2.createQuery(hql);
            List listResult = query.list();
            Number postagens = (Number) listResult.get(0);
        %>
        <%@include file="WEB-INF/jspf/menuPrincipal.jspf"%>
        <%@include file="WEB-INF/jspf/menuLateral.jspf"%>
        <div id="feed">
            <div id="perfilbloco">
                <span id="nome-usuario">
                    <%=usuario.getNick()%>
                </span>
                <br>
                <img src="data:image/png;base64,<%=perfilFotoBusca%>" class="fotoperfil">
                <br>
                <span id="bio-usuario">
                    <%=usuario.getBio()%>
                </span>
                <br>
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
                                <%=postagens%>   
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
                <form action="ServletSeguirUsuarioMeme" method="post">
                    <input type="hidden" value="<%=usuario.getCdUsuarioMeme()%>" name="seguido">
                    <input type="hidden" value="<%=user.getCdUsuarioMeme()%>" name="seguidor">
                    <button type="submit" class="w3-button w3-large" style="position: relative; left: 83px;background-color: #28bfa0;color: #f5f6f7;" >
                        Seguir
                    </button>
                </form>
            </div>              
        </div>
    </body>
</html>
