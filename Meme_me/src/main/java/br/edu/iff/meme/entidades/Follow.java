/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.entidades;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "follow")
public class Follow implements Serializable{
    

    /**
     * @return the cdFollow
     */
    public int getCdFollow() {
        return cdFollow;
    }

    /**
     * @param cdFollow the cdFollow to set
     */
    public void setCdFollow(int cdFollow) {
        this.cdFollow = cdFollow;
    }

    /**
     * @return the seguido
     */
    public UsuarioMeme getSeguido() {
        return seguido;
    }

    /**
     * @param seguido the seguido to set
     */
    public void setSeguido(UsuarioMeme seguido) {
        this.seguido = seguido;
    }

    /**
     * @return the seguidor
     */
    public UsuarioMeme getSeguidor() {
        return seguidor;
    }

    /**
     * @param seguidor the seguidor to set
     */
    public void setSeguidor(UsuarioMeme seguidor) {
        this.seguidor = seguidor;
    }
    @Id
    @Column(name = "cd_follow")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence_follow")
    @SequenceGenerator(name = "sequence_follow", sequenceName = "sq_cd_follow")
    private int cdFollow;
    @JoinColumn(name = "followed_cd_user_meme", referencedColumnName = "cd_user_meme")
    @ManyToOne
    private UsuarioMeme seguido;
    @JoinColumn(name = "follower_cd_user_meme", referencedColumnName = "cd_user_meme")
    @ManyToOne
    private UsuarioMeme seguidor;

     public Follow() {
    }
}
