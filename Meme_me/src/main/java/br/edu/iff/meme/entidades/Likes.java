/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author florincy
 */
@Entity
@Table(name = "likes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Likes.findAll", query = "SELECT l FROM Likes l")
    , @NamedQuery(name = "Likes.findByCdLike", query = "SELECT l FROM Likes l WHERE l.cdLike = :cdLike")})
public class Likes implements Serializable {

    /**
     * @return the curtidor
     */
    public UsuarioMeme getCurtidor() {
        return curtidor;
    }

    /**
     * @param curtidor the curtidor to set
     */
    public void setCurtidor(UsuarioMeme curtidor) {
        this.curtidor = curtidor;
    }

    /**
     * @return the postagem
     */
    public Post getPostagem() {
        return postagem;
    }

    /**
     * @param postagem the postagem to set
     */
    public void setPostagem(Post postagem) {
        this.postagem = postagem;
    }

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "cd_like")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence_likes")
    @SequenceGenerator(name = "sequence_likes", sequenceName = "sq_cd_likes")
    private Integer cdLike;
    @JoinColumn(name = "user_cd_user_meme", referencedColumnName = "cd_user_meme")
    @ManyToOne
    private UsuarioMeme curtidor;
    @JoinColumn(name = " post_cd_post", referencedColumnName = "cd_post")
    @ManyToOne
    private Post postagem;

    public Likes() {
    }

    public Likes(Integer cdLike) {
        this.cdLike = cdLike;
    }

    public Integer getCdLike() {
        return cdLike;
    }

    public void setCdLike(Integer cdLike) {
        this.cdLike = cdLike;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cdLike != null ? cdLike.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Likes)) {
            return false;
        }
        Likes other = (Likes) object;
        if ((this.cdLike == null && other.cdLike != null) || (this.cdLike != null && !this.cdLike.equals(other.cdLike))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.meme.entidades.Likes[ cdLike=" + cdLike + " ]";
    }
    
}
