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
        // Create path components to save the file
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
            String pathImage = path + fileName;
            postagem.setDsPath(pathImage);
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
        session.save(postagem);
        tr.commit();
        session.close();
        response.sendRedirect("perfil.jsp");

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
