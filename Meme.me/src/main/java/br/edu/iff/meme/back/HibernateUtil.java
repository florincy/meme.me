/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.back;

import br.edu.iff.meme.me.UsuarioMeme;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.SettingsFactory;

public class HibernateUtil {

    private static final SessionFactory concreteSessionFactory;

    static {
        try {
            concreteSessionFactory = new AnnotationConfiguration()
                    .configure()
                    .addAnnotatedClass(UsuarioMeme.class)
                    .buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession()
            throws HibernateException {
        return concreteSessionFactory.openSession();
    }

    public static void main(String... args) {
        Session session = getSession();
        Transaction tr = session.beginTransaction();
        UsuarioMeme user = (UsuarioMeme) session.get(UsuarioMeme.class, new Integer(1));
        if (user == null) {
            System.out.println("Usuário não encontrado.");
        } else {
            System.out.println("Nome: "+user.getNome());
        }
        
        UsuarioMeme usuario = new UsuarioMeme();
        usuario.setBio("Sou eu!");
        usuario.setEmail("eu@g.c");
        //usuario.setNascimento(Date.);
        usuario.setNick("Eu");
        usuario.setNome("Eu 2");
        usuario.setSobrenome("Mesmo");
        usuario.setPais("Brasil");
        usuario.setPrivado(true);
        usuario.setSenha("123");
        
        session.save(usuario);
        tr.commit();
        
        session.close();
    }
}
