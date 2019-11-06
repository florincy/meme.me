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
import org.hibernate.Session;
import org.hibernate.Transaction;

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
        UsuarioMeme UserSeguidor = (UsuarioMeme) request.getSession().getAttribute("usuarioLogado");
        seguida.setSeguido(UserSeguido);
        seguida.setSeguidor(UserSeguidor);
        String cdSeguido = String.valueOf(UserSeguido.getCdUsuarioMeme());
        String cdSeguidor = String.valueOf(UserSeguidor.getCdUsuarioMeme());
        Follow seguidaExistente = (Follow) session.createQuery("from Follow where followed_cd_user_meme=? and follower_cd_user_meme=?").setString(0, cdSeguido).setString(1, cdSeguidor).uniqueResult();
   
            session.saveOrUpdate(seguida);
            tr.commit();
            session.close();
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("seguido", seguida);
            response.sendRedirect("perfilBuscas.jsp?cd=" + UserSeguido.getCdUsuarioMeme());
     
            /*
            session.delete(seguida);
            tr.commit();
            session.close();
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("seguido", seguida);
            response.sendRedirect("perfilBuscas.jsp?cd=" + UserSeguido.getCdUsuarioMeme());
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
