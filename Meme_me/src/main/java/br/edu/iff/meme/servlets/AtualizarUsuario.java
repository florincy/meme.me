/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.servlets;

import br.edu.iff.meme.entidades.UsuarioMeme;
import br.edu.iff.meme.utilidades.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import javax.script.*;
import javax.swing.JOptionPane;

/**
 *
 * @author florincy
 */
public class AtualizarUsuario extends HttpServlet {

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
            out.println("<title>Servlet AtualizarUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AtualizarUsuario at " + request.getContextPath() + "</h1>");
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
        UsuarioMeme user = new UsuarioMeme();
        user.setCdUsuarioMeme(Integer.parseInt(request.getParameter("id")));
        Session session = HibernateUtil.getSession();
        Transaction tr = session.beginTransaction();
        String idUsuario = request.getParameter("id");
        String hql = "from UsuarioMeme u where u.id='" + idUsuario + "'";
        user = (UsuarioMeme) session.createQuery(hql).uniqueResult();
        String senhaAtual = user.getSenha();
        String senhaAntiga = request.getParameter("senha");
        String senhaNova = request.getParameter("senhaNova");
        String senhaConf = request.getParameter("senhaConf");
        if (senhaAtual.equals(senhaAntiga)) {
            if (senhaNova.equals(senhaConf)) {
                user.setSenha(senhaNova);
               // ScriptEngineManager manager = new ScriptEngineManager();
               // ScriptEngine engine = manager.getEngineByName("nashorn");
               // engine.eval("print('Hello, World')");
                //  JOptionPane.showMessageDialog(null, "Hello world!");
            } else {
            }
        } else {
            // response.sendRedirect("erroLogin.html");
        }
        user.setEmail(request.getParameter("email"));
        user.setNome(request.getParameter("nome"));
        user.setSobrenome(request.getParameter("sobrenome"));
        String data = request.getParameter("birth");
        user.setNascimento(data);
        user.setNick(request.getParameter("nick"));

        //user.setSenha(request.getParameter("senha"));
        user.setPais(request.getParameter("pais"));
        user.setPrivado(Boolean.parseBoolean(request.getParameter("private")));
        user.setBio(request.getParameter("bio"));
        user.setCdUsuarioMeme(Integer.parseInt(request.getParameter("id")));

        //todos os atributos SETados
        session.saveOrUpdate(user);
        tr.commit();
        session.close();
        response.sendRedirect("perfil.jsp");
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("usuarioLogado", user);

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
