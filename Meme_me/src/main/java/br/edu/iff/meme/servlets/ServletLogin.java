/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.servlets;

import br.edu.iff.meme.entidades.UserAdm;
import br.edu.iff.meme.utilidades.HibernateUtil;
import br.edu.iff.meme.entidades.UsuarioMeme;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

/**
 *
 * @author aluno
 */
public class ServletLogin extends HttpServlet {

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
            out.println("<title>Servlet ServletLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLogin at " + request.getContextPath() + "</h1>");
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

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String tipo = request.getParameter("tipo");
        System.out.println("Tipo USUARIO: " + tipo);
        Session session = HibernateUtil.getSession();
        //equals.funcionando safe
        if ("meme".equals(tipo)) {
            UsuarioMeme user = (UsuarioMeme) session.createQuery("from UsuarioMeme where email=? and senha=?").setString(0, email).setString(1, senha).uniqueResult();
            session.close();

            if (user == null) {
                response.sendRedirect("erroLogin.html");
            } else {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("usuarioMemeLogado", user);
                // httpSession.setAttribute("nome", user.getNome());
                response.sendRedirect("principal.jsp");
            }
        } else if ("adm".equals(tipo)) {
            UserAdm userAdm = (UserAdm) session.createQuery("from UserAdm where dsEmail=? and dsPassword=?").setString(0, email).setString(1, senha).uniqueResult();
            session.close();

            if (userAdm == null) {
                response.sendRedirect("erroLogin.html");
            } else {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("usuarioAdmLogado", userAdm);
                // httpSession.setAttribute("nome", user.getNome());
        
                //response.sendRedirect("principal.jsp");
            }
        } else {
            System.out.println("Hacker detectado tentando fazer um login diferente.");
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
