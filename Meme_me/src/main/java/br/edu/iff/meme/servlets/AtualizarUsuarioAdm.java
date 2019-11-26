/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.servlets;

import br.edu.iff.meme.entidades.UserAdm;
import br.edu.iff.meme.utilidades.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author talissoares
 */
@MultipartConfig
public class AtualizarUsuarioAdm extends HttpServlet {

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
            out.println("<title>Servlet AtualizarUsuarioAdm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AtualizarUsuarioAdm at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        UserAdm user = new UserAdm();
        user.setCdUserAdm(Integer.parseInt(request.getParameter("id")));
        Session session = HibernateUtil.getSession();
        Transaction tr = session.beginTransaction();
        String idUsuario = request.getParameter("id");
        String hql = "from UserAdm u where u.id='" + idUsuario + "'";
        user = (UserAdm) session.createQuery(hql).uniqueResult();
        String senhaAtual = user.dsPassword();
        String senhaAntiga = request.getParameter("senha");
        String senhaNova = request.getParameter("senhaNova");
        String senhaConf = request.getParameter("senhaConf");
        
        boolean tretaDeSenha = false;
        if (!(senhaAntiga == null || "".equals(senhaAntiga))) {
            String senha = comparaSenha(senhaAtual, senhaAntiga, senhaNova, senhaConf);
            System.out.println(senhaAntiga);
            if (!"erro".equals(senha)) {
                user.setDsPassword(senha);
                String a = senha;
                System.out.println("Senha é "+user.getDsPassword());
                
            } else {
                tretaDeSenha= true;
            }
        }
        user.setDsEmail(request.getParameter("email"));
        user.setNmFirst(request.getParameter("nome"));
        user.setNmLast(request.getParameter("sobrenome"));
        String data = request.getParameter("birth");
        user.setNmBirth(data);
        user.setDsNick(request.getParameter("nick"));
        user.setDsCountry(request.getParameter("pais"));
        // Era coisa simples, às vezes, o simples é difícil, manjou?
    
     session.saveOrUpdate(user);
     tr.commit();
     session.close();

    if(tretaDeSenha){
    PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('Erro ao atualizar senha!');");
            out.println("document.location=('perfilAdm.jsp');");
            out.println("</script>");
    
    } else{
     response.sendRedirect("perfilAdm.jsp");
}
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

    private String comparaSenha(String senhaAtual, String senhaAntiga, String senhaNova, String senhaConf) {
       if (senhaAtual.equals(senhaAntiga)) {
            if (senhaNova.equals(senhaConf)) {
                String senha = senhaNova;
                return senha;
            } else {
                return "erro";
            }
        } else {
            return "erro";
        }
    }
    }


