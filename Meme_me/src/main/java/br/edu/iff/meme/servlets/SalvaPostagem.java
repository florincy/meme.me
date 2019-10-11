/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.servlets;

import br.edu.iff.meme.entidades.Post;
import br.edu.iff.meme.entidades.UsuarioMeme;
import br.edu.iff.meme.utilidades.HibernateUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author florincy
 */
@MultipartConfig
//(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class SalvaPostagem extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SalvaPostagem</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SalvaPostagem at " + request.getContextPath() + "</h1>");
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
    /* @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        Post postagem = new Post();

        UsuarioMeme user = new UsuarioMeme();
        user.setCdUsuarioMeme(Integer.parseInt(request.getParameter("id")));
        Session session = HibernateUtil.getSession();
        Transaction tr = session.beginTransaction();
        String idUsuario = request.getParameter("id");
        String hql = "from UsuarioMeme u where u.id='" + idUsuario + "'";
        user = (UsuarioMeme) session.createQuery(hql).uniqueResult();
        postagem.setUserCdUserMeme(user);
        //Part file = request.getPart("imagem");
        //String filename = getFilename(file);
        //InputStream filecontent = file.getInputStream();
        File file = new File("/home/aluno/caderno.png");
        byte[] picInBytes = new byte[(int) file.length()];
        FileInputStream fileInputStream = new FileInputStream(file);
        fileInputStream.read(picInBytes);
        fileInputStream.close();
        //response.setContentType("text/plain");
        //response.setCharacterEncoding("UTF-8");
        //response.getWriter().write("File " + filename + " successfully uploaded");
        postagem.setDsPost(request.getParameter("descricao"));
        postagem.setBbImage(picInBytes);
        session.save(postagem);
        tr.commit();
        session.close();

    }*/

 /*static String getFilename( Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                int meio = cd.indexOf('=');
                String filename = cd.substring(meio + 1).trim().replace("\"", "");
                return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Post postagem = new Post();
        response.setContentType("text/html;charset=UTF-8");
        UsuarioMeme user = new UsuarioMeme();
        user.setCdUsuarioMeme(Integer.parseInt(request.getParameter("id")));
        Session session = HibernateUtil.getSession();
        Transaction tr = session.beginTransaction();
        String idUsuario = request.getParameter("id");
        String hql = "from UsuarioMeme u where u.id='" + idUsuario + "'";
        user = (UsuarioMeme) session.createQuery(hql).uniqueResult();
        postagem.setUserCdUserMeme(user);
        postagem.setDsPost(request.getParameter("descricao"));
        Date agora = new Date();
        postagem.setTsMoments(agora);
        final Part filePart = request.getPart("imagem");
        if (filePart != null) {
            InputStream inputStream = filePart.getInputStream();
            postagem.setFoto(IOUtils.toByteArray(inputStream));
            postagem.setExtensao(filePart.getContentType());
        }

        session.save(postagem);
        tr.commit();
        session.close();
        response.sendRedirect("perfil.jsp");

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
