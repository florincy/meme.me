package br.edu.iff.meme.entidades;

import java.io.Serializable;
import static java.lang.System.out;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "user_meme")
public class UsuarioMeme implements Serializable {

    @Column(name = "tp_private")
    private Boolean tpPrivate;
    //@Lob
    @Column(name = "bb_photo")
    private byte[] bbPhoto;
    @OneToMany(mappedBy = "userCdUserMeme")
    private Collection<Comment> commentCollection;

    /**
     * @return the foto
     */
    public byte[] getFoto() {
        return bbPhoto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(byte[] foto) {
        this.bbPhoto = foto;
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
     * @return the nascimento
     */
    public String getNascimento() {
        return nascimento;
    }

    /**
     * @param nascimento the nascimento to set
     */
    public void setNascimento(String nascimento) {
        this.nascimento = nascimento;
    }

    /**
     * @return the cdUsuarioMeme
     */
    public int getCdUsuarioMeme() {
        return cdUsuarioMeme;
    }

    /**
     * @param cdUsuarioMeme the cdUsuarioMeme to set
     */
    public void setCdUsuarioMeme(int cdUsuarioMeme) {
        this.cdUsuarioMeme = cdUsuarioMeme;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the sobrenome
     */
    public String getSobrenome() {
        return sobrenome;
    }

    /**
     * @param sobrenome the sobrenome to set
     */
    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    /**
     * @return the nick
     */
    public String getNick() {
        return nick;
    }

    /**
     * @param nick the nick to set
     */
    public void setNick(String nick) {
        this.nick = nick;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the pais
     */
    public String getPais() {
        return pais;
    }

    /**
     * @param pais the pais to set
     */
    public void setPais(String pais) {
        this.pais = pais;
    }

    /**
     * @return the privatePublic
     */
    public boolean isPrivado() {
        return tpPrivate;
    }

    /**
     * @param privatePublic the privatePublic to set
     */
    public void setPrivado(boolean privatePublic) {
        this.tpPrivate = privatePublic;
    }

    /**
     * @return the bio
     */
    public String getBio() {
        return bio;
    }

    /**
     * @param bio the bio to set
     */
    public void setBio(String bio) {
        this.bio = bio;
    }
    @Column(name="nm_extension")
    private String extensao;
    
    @OneToMany(mappedBy = "userCdUserMeme")
    private Collection<Post> postCollection;
    
    @Column(name = "ds_email")
    private String email;
    
    @Column(name = "nm_first")
    private String nome;
    
    @Column(name = "nm_last")
    private String sobrenome;
    
    @Column(name = "ds_nick")
    private String nick;
    
    @Column(name = "ds_password")
    private String senha;
    
    @Column(name = "ds_country")
    private String pais;
    
    @Column(name = "ds_bios")
    private String bio;
    
    @Column(name = "nm_birth")
    private String nascimento;
    
    @Id
    @Column(name = "cd_user_meme")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence_user_meme")
    @SequenceGenerator(name = "sequence_user_meme", sequenceName = "sq_cd_user_meme")
    private int cdUsuarioMeme;

    public UsuarioMeme() {
    }

  /*  @XmlTransient
    public Collection<Post> getPostCollection() {
        return postCollection;
    }

    public void setPostCollection(Collection<Post> postCollection) {
        this.postCollection = postCollection;
    }
  */

    public Boolean getTpPrivate() {
        return tpPrivate;
    }

    public void setTpPrivate(Boolean tpPrivate) {
        this.tpPrivate = tpPrivate;
    }

    public byte[] getBbPhoto() {
        return bbPhoto;
    }

    public void setBbPhoto(byte[] bbPhoto) {
        this.bbPhoto = bbPhoto;
    }

    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }
}