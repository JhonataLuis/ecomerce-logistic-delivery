/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.javabean.bean;

import java.util.Date;

/**
 *
 * @author rayss
 */
public class BeanUsuario {
    
    private int codUsu;
    private String login_usu;
    private String nome_usu;
    private String tele_usu;
    private String senha_usu;
    private Date data_cad;

    /**
     * @return the codUsu
     */
    public int getCodUsu() {
        return codUsu;
    }

    /**
     * @param codUsu the codUsu to set
     */
    public void setCodUsu(int codUsu) {
        this.codUsu = codUsu;
    }

    /**
     * @return the login_usu
     */
    public String getLogin_usu() {
        return login_usu;
    }

    /**
     * @param login_usu the login_usu to set
     */
    public void setLogin_usu(String login_usu) {
        this.login_usu = login_usu;
    }

    /**
     * @return the nome_usu
     */
    public String getNome_usu() {
        return nome_usu;
    }

    /**
     * @param nome_usu the nome_usu to set
     */
    public void setNome_usu(String nome_usu) {
        this.nome_usu = nome_usu;
    }

    /**
     * @return the senha_usu
     */
    public String getSenha_usu() {
        return senha_usu;
    }

    /**
     * @param senha_usu the senha_usu to set
     */
    public void setSenha_usu(String senha_usu) {
        this.senha_usu = senha_usu;
    }

    /**
     * @return the data_cad
     */
    public Date getData_cad() {
        return data_cad;
    }

    /**
     * @param data_cad the data_cad to set
     */
    public void setData_cad(Date data_cad) {
        this.data_cad = data_cad;
    }

    /**
     * @return the tele_usu
     */
    public String getTele_usu() {
        return tele_usu;
    }

    /**
     * @param tele_usu the tele_usu to set
     */
    public void setTele_usu(String tele_usu) {
        this.tele_usu = tele_usu;
    }
    
    
}
