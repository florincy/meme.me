/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * armando é lindo
 */
package br.edu.iff.meme.servlets;

import br.edu.iff.meme.entidades.UserAdm;
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
 * @author armando gostoso
 */
public class ServletCadastroAdm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletCadastroUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCadastroUsuario at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        UserAdm user = new UserAdm();
        Session session = HibernateUtil.getSession();
        Transaction tr = session.beginTransaction();
        user.setDsEmail(request.getParameter("email"));
        user.setNmFirst(request.getParameter("nome"));
        user.setNmLast(request.getParameter("sobrenome"));
        String data = request.getParameter("birth");
        user.setNmBirth(data);
        user.setDsNick(request.getParameter("nick"));
        user.setDsPassword(request.getParameter("senha"));
        user.setDsCountry(request.getParameter("pais"));
        session.save(user);
        tr.commit();
        session.close();
        response.sendRedirect("cadastroOK.html");
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
