/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.servlets;

import br.edu.iff.meme.utilidades.HibernateUtil;
import br.edu.iff.meme.entidades.UsuarioMeme;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author aluno
 */
@MultipartConfig
public class ServletCadastroUsuario extends HttpServlet {

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
        UsuarioMeme user = new UsuarioMeme();
        Session session = HibernateUtil.getSession();
        Transaction tr = session.beginTransaction();
        user.setEmail(request.getParameter("email"));
        user.setNome(request.getParameter("nome"));
        user.setSobrenome(request.getParameter("sobrenome"));
        String data = request.getParameter("birth");
        user.setNascimento(data);
        user.setNick(request.getParameter("nick"));
        user.setSenha(request.getParameter("senha"));
        user.setPais(request.getParameter("pais"));
        user.setPrivado(Boolean.parseBoolean(request.getParameter("private")));
        user.setBio(request.getParameter("bio"));
        final String path = "/home/florincy/meme.me/Meme_me/target/Meme.me-1.0-SNAPSHOT/imagens/";//request.getParameter("destination");
        final Part filePart = request.getPart("imagem");
        final String fileName = getFileName(filePart);

        OutputStream out = null;
        InputStream filecontent = null;
        //final PrintWriter writer = response.getWriter();

        try {
            out = new FileOutputStream(new File(path + File.separator
                    + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            //writer.println("New file " + fileName + " created at " + path + "<br><img src=\"imagens/" + fileName + "\" class=\"padrao\">");
            System.out.println("New file " + fileName + " created at " + path);
            String pathImage = fileName;
            user.setDsPhoto(pathImage);
        } catch (FileNotFoundException fne) {
            // writer.println("You either did not specify a file to upload or are "
            //   + "trying to upload a file to a protected or nonexistent "
            // + "location.");
            // writer.println("<br/> ERROR: " + fne.getMessage());

            System.out.println("Problems during file upload. Error: " + fne.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }

        }
        //todos os atributos SETados
        session.save(user);
        tr.commit();
        session.close();
        response.sendRedirect("cadastroOK.html");
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("Part Header = " + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
