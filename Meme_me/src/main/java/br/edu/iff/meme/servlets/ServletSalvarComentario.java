/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
Vou sentir saudade disso
 */
package br.edu.iff.meme.servlets;

import br.edu.iff.meme.entidades.*;
import br.edu.iff.meme.utilidades.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author aluno
 */
public class ServletSalvarComentario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ComentarioServletSA</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ComentarioServletSA at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsuarioMeme logado = (UsuarioMeme) request.getSession().getAttribute("usuarioLogado");
        int cdLogado = logado.getCdUsuarioMeme();
        String idtext = request.getParameter("pid");
        String conteudo = request.getParameter("comentario");
        String idComentador = request.getParameter("comentador");
        String idPublicacao = request.getParameter("publicacao");
        Session session = HibernateUtil.getSession();
        Comment comentario = new Comment();
        //Post publicacao = new Post();
        String hql = "from Post where cd_post='" + idPublicacao + "'";
        Post publicacao = (Post) session.createQuery(hql).uniqueResult();
        UsuarioMeme usuario = new UsuarioMeme();

        if (!idtext.isEmpty()) {
            Integer id = Integer.parseInt(idtext);
            comentario.setCdComment(id);
        }

       // publicacao.setCdPost(Integer.parseInt(idPublicacao));
        usuario.setCdUsuarioMeme(Integer.parseInt(idComentador));

        comentario.setDsComment(conteudo);
        comentario.setUserCdUserMeme(usuario);
        comentario.setPostCdPost(publicacao);

        
        Transaction tr = session.beginTransaction();
        session.save(comentario);
        tr.commit();
        session.close();
        UsuarioMeme publicador = publicacao.getUserCdUserMeme();
        int cdPost = publicador.getCdUsuarioMeme();
        System.out.println(cdLogado);
        if (cdLogado==cdPost) {
            response.sendRedirect("postagens.jsp");
        }else{
            response.sendRedirect("principal.jsp");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
