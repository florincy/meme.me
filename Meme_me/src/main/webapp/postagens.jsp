<%-- 
    Document   : postagens
    Created on : 09/10/2019, 12:12:02
    Author     : aluno
    Tag com % é scriptlet
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.iff.meme.entidades.*"%>
<%@page import="br.edu.iff.meme.servlets.*"%>
<%@page import="br.edu.iff.meme.utilidades.HibernateUtil"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Base64"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>



        <!-- começa aqui -->      
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>

        <script>
            function mostrar_abas(obj) {
                var str = obj.id.toString();
                var tipo = str.slice(0, 10);
                var idPost = str.slice(10);
<!-- alert('tipo: '+tipo+' / idpoat: ' + idPost) -->
                if ('mostra_aba' == tipo) {
                    document.getElementById('div_aba' + idPost).style.display = "block";
                }
            }
        </script>

        <!-- termina aqui --> 



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="login_css.css">
        <title>Postagens</title>
    </head>
    <body>
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
            byte[] fotoPerfil = user.getFoto();
            String perfilFoto = Base64.getEncoder().encodeToString(fotoPerfil);
            %>
        <%@include file="WEB-INF/jspf/menuPrincipal.jspf"%>
        <%@include file="WEB-INF/jspf/menuLateral.jspf"%>
        <div id="feed">
            <div class="centro">
                <%                Session session1 = HibernateUtil.getSession();
                    String hql = "from Post where user_cd_user_meme='" + user.getCdUsuarioMeme() + "'";
                    //  Post postagem = (Post) session1.createQuery(hql).list();
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
                        int idPost = postagem.getCdPost();
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

                            <form method="post" action="ServletCurtir">
                                <input type="hidden" value="<%=postagem.getCdPost()%>" name="cdPost">
                                <button type="submit" style="background-color: transparent;border:0;"><img src="imagens/curtir.png" class="icone"></button>
                            </form>


                            <form method="post" action="ServletCurtir">
                                <input type="hidden" value="<%=postagem.getCdPost()%>" name="cdPost">
                                <button type="submit" style="background-color: transparent;border:0;"><img src="imagens/compartilhar.png" class="icone"></button>
                            </form>

                            <form method="post" action="ServletCurtir">
                                <input type="hidden" value="<%=postagem.getCdPost()%>" name="cdPost">
                                <button type="submit" style="background-color: transparent;border:0;"><img src="imagens/denuncia.png" class="icone"></button>
                            </form>


                            <li>
                                <img src="imagens/comentar.png" class="icone" onclick="mostrar_abas(this);" id="mostra_aba<%=idPost%>">                                 
                            </li>


                            <li>
                                <span class="dataHora">
                                    <%=postagem.getTsMoments()%>
                                </span>
                            </li>
                        </ul>
                    </div>
                    <span class="legenda">
                        <%=postagem.getDsPost()%><br>
                    </span>

                    <b>Comentários:</b><br>
                    <%
                        for (Comment post : postagem.getCommentCollection()) {
                            UsuarioMeme comentador = post.getUserCdUserMeme();
                    %>
                    <%=comentador.getNome()%>: <%=post.getDsComment()%><br>
                    <%
                        }
                    %>


                    <div id="div_aba<%=idPost%>" style="display:none;">
                        <form method="POST" action="ServletSalvarComentario">
                            <input type="text" name="comentario">
                            <div hidden>
                                <input type="text" name="comentador" value="<%=user.getCdUsuarioMeme()%>">
                                <input type="text" name="pid" value="<%=idPost%>">
                                <input type="text" name="publicacao" value="<%=codigo%>">
                            </div>
                            <input type="submit" value="Comentar">
                        </form>
                    </div>
                </div>



                <%
                    }
                %>


            </div>
        </div>
    </body>
</html>