/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.meme.me;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "user_meme")
public class UsuarioMeme implements Serializable {

    /**
     * @return the cdUsuarioMeme
     */
    public Integer getCdUsuarioMeme() {
        return cdUsuarioMeme;
    }

    /**
     * @param cdUsuarioMeme the cdUsuarioMeme to set
     */
    public void setCdUsuarioMeme(Integer cdUsuarioMeme) {
        this.cdUsuarioMeme = cdUsuarioMeme;
    }

    /**
     * @return the nascimento
     */
    public Date getNascimento() {
        return nascimento;
    }

    /**
     * @param nascimento the nascimento to set
     */
    public void setNascimento(Date nascimento) {
        this.nascimento = nascimento;
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
        return privado;
    }

    /**
     * @param privatePublic the privatePublic to set
     */
    public void setPrivado(boolean privatePublic) {
        this.privado = privatePublic;
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
    @Column (name="ds_email")
    private String email;
    @Column(name = "nm_first")
    private String nome;
    @Column (name="nm_last")
    private String sobrenome;
    @Column (name="ds_nick")
    private String nick;
    @Column (name="ds_password")
    private String senha;
    @Column (name="ds_country")
    private String pais;
    @Column(name="tp_private")
    private boolean privado;
    @Column(name="ds_bios")
    private String bio;
    //@Column(name="dt_birth")
    //@Temporal(javax.persistence.TemporalType.DATE)
    private Date nascimento;
    @Id
    @Column(name="cd_user_meme")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence_user_meme")
    @SequenceGenerator(name = "sequence_user_meme", sequenceName = "sq_cd_user_meme")
    private Integer cdUsuarioMeme;
    
    
}
