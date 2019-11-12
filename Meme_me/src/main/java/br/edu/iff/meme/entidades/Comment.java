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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "comment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c")
    , @NamedQuery(name = "Comment.findByCdComment", query = "SELECT c FROM Comment c WHERE c.cdComment = :cdComment")
    , @NamedQuery(name = "Comment.findByDsComment", query = "SELECT c FROM Comment c WHERE c.dsComment = :dsComment")})
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence_user_meme")
    @SequenceGenerator(name = "sequence_user_meme", sequenceName = "sq_cd_comment")
    @Column(name = "cd_comment")
    private Integer cdComment;
    
    @Size(max = 2147483647)
    @Column(name = "ds_comment")
    private String dsComment;
    
    @JoinColumn(name = "post_cd_post", referencedColumnName = "cd_post")
    @ManyToOne
    private Post postCdPost;
    
    @JoinColumn(name = "user_cd_user_meme", referencedColumnName = "cd_user_meme")
    @ManyToOne
    private UsuarioMeme userCdUserMeme;

    public Comment() {
    }

    public Comment(Integer cdComment) {
        this.cdComment = cdComment;
    }

    public Integer getCdComment() {
        return cdComment;
    }

    public void setCdComment(Integer cdComment) {
        this.cdComment = cdComment;
    }

    public String getDsComment() {
        return dsComment;
    }

    public void setDsComment(String dsComment) {
        this.dsComment = dsComment;
    }

    public Post getPostCdPost() {
        return postCdPost;
    }

    public void setPostCdPost(Post postCdPost) {
        this.postCdPost = postCdPost;
    }

    public UsuarioMeme getUserCdUserMeme() {
        return userCdUserMeme;
    }

    public void setUserCdUserMeme(UsuarioMeme userCdUserMeme) {
        this.userCdUserMeme = userCdUserMeme;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cdComment != null ? cdComment.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.cdComment == null && other.cdComment != null) || (this.cdComment != null && !this.cdComment.equals(other.cdComment))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.meme.entidades.Comment[ cdComment=" + cdComment + " ]";
    }
    
}
