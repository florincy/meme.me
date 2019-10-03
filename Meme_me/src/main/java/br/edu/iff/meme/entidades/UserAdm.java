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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mandin
 */
@Entity
@Table(name = "user_adm")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserAdm.findAll", query = "SELECT u FROM UserAdm u")
    , @NamedQuery(name = "UserAdm.findByCdUserAdm", query = "SELECT u FROM UserAdm u WHERE u.cdUserAdm = :cdUserAdm")
    , @NamedQuery(name = "UserAdm.findByNmFirst", query = "SELECT u FROM UserAdm u WHERE u.nmFirst = :nmFirst")
    , @NamedQuery(name = "UserAdm.findByNmLast", query = "SELECT u FROM UserAdm u WHERE u.nmLast = :nmLast")
    , @NamedQuery(name = "UserAdm.findByDsNick", query = "SELECT u FROM UserAdm u WHERE u.dsNick = :dsNick")
    , @NamedQuery(name = "UserAdm.findByDsEmail", query = "SELECT u FROM UserAdm u WHERE u.dsEmail = :dsEmail")
    , @NamedQuery(name = "UserAdm.findByDsPassword", query = "SELECT u FROM UserAdm u WHERE u.dsPassword = :dsPassword")
    , @NamedQuery(name = "UserAdm.findByDsCountry", query = "SELECT u FROM UserAdm u WHERE u.dsCountry = :dsCountry")
    , @NamedQuery(name = "UserAdm.findByNmBirth", query = "SELECT u FROM UserAdm u WHERE u.nmBirth = :nmBirth")})
public class UserAdm implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence_useradm")
    @SequenceGenerator(name = "sequence_useradm", sequenceName = "sq_useradm")
    @Column(name = "cd_user_adm")
    private Integer cdUserAdm;
    @Size(max = 2147483647)
    @Column(name = "nm_first")
    private String nmFirst;
    @Size(max = 2147483647)
    @Column(name = "nm_last")
    private String nmLast;
    @Size(max = 2147483647)
    @Column(name = "ds_nick")
    private String dsNick;
    @Size(max = 2147483647)
    @Column(name = "ds_email")
    private String dsEmail;
    @Size(max = 2147483647)
    @Column(name = "ds_password")
    private String dsPassword;
    @Size(max = 2147483647)
    @Column(name = "ds_country")
    private String dsCountry;
    @Size(max = 2147483647)
    @Column(name = "nm_birth")
    private String nmBirth;

    public UserAdm() {
    }

    public UserAdm(Integer cdUserAdm) {
        this.cdUserAdm = cdUserAdm;
    }

    public Integer getCdUserAdm() {
        return cdUserAdm;
    }

    public void setCdUserAdm(Integer cdUserAdm) {
        this.cdUserAdm = cdUserAdm;
    }

    public String getNmFirst() {
        return nmFirst;
    }

    public void setNmFirst(String nmFirst) {
        this.nmFirst = nmFirst;
    }

    public String getNmLast() {
        return nmLast;
    }

    public void setNmLast(String nmLast) {
        this.nmLast = nmLast;
    }

    public String getDsNick() {
        return dsNick;
    }

    public void setDsNick(String dsNick) {
        this.dsNick = dsNick;
    }

    public String getDsEmail() {
        return dsEmail;
    }

    public void setDsEmail(String dsEmail) {
        this.dsEmail = dsEmail;
    }

    public String getDsPassword() {
        return dsPassword;
    }

    public void setDsPassword(String dsPassword) {
        this.dsPassword = dsPassword;
    }

    public String getDsCountry() {
        return dsCountry;
    }

    public void setDsCountry(String dsCountry) {
        this.dsCountry = dsCountry;
    }

    public String getNmBirth() {
        return nmBirth;
    }

    public void setNmBirth(String nmBirth) {
        this.nmBirth = nmBirth;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cdUserAdm != null ? cdUserAdm.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserAdm)) {
            return false;
        }
        UserAdm other = (UserAdm) object;
        if ((this.cdUserAdm == null && other.cdUserAdm != null) || (this.cdUserAdm != null && !this.cdUserAdm.equals(other.cdUserAdm))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.meme.entidades.UserAdm[ cdUserAdm=" + cdUserAdm + " ]";
    }
    
}
