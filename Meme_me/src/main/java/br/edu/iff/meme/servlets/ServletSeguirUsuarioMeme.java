/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.servlets;

import br.edu.iff.meme.entidades.Follow;
import br.edu.iff.meme.entidades.UsuarioMeme;
import br.edu.iff.meme.utilidades.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sun.awt.X11.XException;

/**
 *
 * @author aluno
 */
public class ServletSeguirUsuarioMeme extends HttpServlet {

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
            out.println("<title>Servlet ServletSeguirUsuarioMeme</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletSeguirUsuarioMeme at " + request.getContextPath() + "</h1>");
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

        Follow seguida = new Follow();
        /*String seguidor = request.getParameter("seguidor");
        String seguido = request.getParameter("seguido");*/
        Session session = HibernateUtil.getSession();
        Transaction tr = session.beginTransaction();
        UsuarioMeme UserSeguido = (UsuarioMeme) request.getSession().getAttribute("buscado");
        String cdSeguido = String.valueOf(UserSeguido.getCdUsuarioMeme());
        System.out.println(cdSeguido);
        UsuarioMeme UserSeguidor = (UsuarioMeme) request.getSession().getAttribute("usuarioLogado");
        String cdSeguidor = String.valueOf(UserSeguidor.getCdUsuarioMeme());
        System.out.println(cdSeguidor);
        seguida.setSeguido(UserSeguido);
        seguida.setSeguidor(UserSeguidor);
        Query query = session.createQuery("from Follow where follower_cd_user_meme='" + cdSeguidor + "'and followed_cd_user_meme='" + cdSeguido + "'");
        Follow jaSeguida = (Follow) query.uniqueResult();
        try {
            int a = jaSeguida.getCdFollow();
            session.delete(jaSeguida);
            tr.commit();
            session.close();
            response.sendRedirect("perfilBuscas.jsp");
        } catch (NullPointerException e) {
            session.saveOrUpdate(seguida);
            tr.commit();
            session.close();
            response.sendRedirect("perfilBuscas.jsp");
        }
        /*
       UsuarioMeme jaSeguidor = jaSeguida.getSeguidor();
        String cdJaSeguidor = String.valueOf(jaSeguidor.getCdUsuarioMeme());
        UsuarioMeme jaSeguido = jaSeguida.getSeguido();
        System.out.println(cdJaSeguidor);
        System.out.println(cdSeguidor);
        String cdJaSeguido = String.valueOf(jaSeguido.getCdUsuarioMeme());
        if (cdJaSeguido.equals(cdSeguido)&&cdJaSeguidor.equals(cdSeguidor) ){
            System.out.println("Já tem essa seguida aí");
            response.sendRedirect("perfilBuscas.jsp");
        } else {
            session.saveOrUpdate(seguida);
            tr.commit();
            session.close();
            response.sendRedirect("perfilBuscas.jsp");
        }
         */

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
