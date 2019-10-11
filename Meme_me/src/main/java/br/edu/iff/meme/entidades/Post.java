/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author florincy
 */
@Entity
@Table(name = "post")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Post.findAll", query = "SELECT p FROM Post p")
    , @NamedQuery(name = "Post.findByCdPost", query = "SELECT p FROM Post p WHERE p.cdPost = :cdPost")
    , @NamedQuery(name = "Post.findByTsMoments", query = "SELECT p FROM Post p WHERE p.tsMoments = :tsMoments")
    , @NamedQuery(name = "Post.findByDsPost", query = "SELECT p FROM Post p WHERE p.dsPost = :dsPost")})
public class Post implements Serializable {

    /**
     * @return the cdPost
     */
    public Integer getCdPost() {
        return cdPost;
    }

    /**
     * @param cdPost the cdPost to set
     */
    public void setCdPost(Integer cdPost) {
        this.cdPost = cdPost;
    }

    /**
     * @return the tsMoments
     */
    public Date getTsMoments() {
        return tsMoments;
    }

    /**
     * @param tsMoments the tsMoments to set
     */
    public void setTsMoments(Date tsMoments) {
        this.tsMoments = tsMoments;
    }

    /**
     * @return the dsPost
     */
    public String getDsPost() {
        return dsPost;
    }

    /**
     * @param dsPost the dsPost to set
     */
    public void setDsPost(String dsPost) {
        this.dsPost = dsPost;
    }

    /**
     * @return the userCdUserMeme
     */
    public UsuarioMeme getUserCdUserMeme() {
        return userCdUserMeme;
    }

    /**
     * @param userCdUserMeme the userCdUserMeme to set
     */
    public void setUserCdUserMeme(UsuarioMeme userCdUserMeme) {
        this.userCdUserMeme = userCdUserMeme;
    }

    /**
     * @return the extensao
     */
    public String getExtensao() {
        return extensao;
    }

    /**
     * @param extensao the extensao to set
     */
    public void setExtensao(String extensao) {
        this.extensao = extensao;
    }

    /**
     * @return the foto
     */
    public byte[] getFoto() {
        return foto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(byte[] foto) {
        this.foto = foto;
    }
    @Id
    @Column(name = "cd_post")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence_user_meme")
    @SequenceGenerator(name = "sequence_user_meme", sequenceName = "sq_cd_user_meme")
    private Integer cdPost;
    @Column(name = "ts_moments")
    @Temporal(TemporalType.TIMESTAMP)
    private Date tsMoments;
    @Column(name = "ds_post")
    private String dsPost;
    @JoinColumn(name = "user_cd_user_meme", referencedColumnName = "cd_user_meme")
    @ManyToOne
    private UsuarioMeme userCdUserMeme;
    @Column(name="nm_extension")
    private String extensao;
    @Column(name="bb_photo")
    private byte[] foto;

  
   

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (getCdPost() != null ? getCdPost().hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Post)) {
            return false;
        }
        Post other = (Post) object;
        if ((this.getCdPost() == null && other.getCdPost() != null) || (this.getCdPost() != null && !this.cdPost.equals(other.cdPost))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.meme.entidades.Post[ cdPost=" + getCdPost() + " ]";
    }

}