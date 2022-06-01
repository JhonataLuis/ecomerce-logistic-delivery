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
public class BeanUsuarioEmpresa {
    
    private int codUserEmp;
    private String loginUserEmp;
    private String nomeUserEmp;
    private String telefone;
    private String senhaUserEmp;
    private Date dataCadUserEmp;

    /**
     * @return the codUserEmp
     */
    public int getCodUserEmp() {
        return codUserEmp;
    }

    /**
     * @param codUserEmp the codUserEmp to set
     */
    public void setCodUserEmp(int codUserEmp) {
        this.codUserEmp = codUserEmp;
    }

    /**
     * @return the loginUserEmp
     */
    public String getLoginUserEmp() {
        return loginUserEmp;
    }

    /**
     * @param loginUserEmp the loginUserEmp to set
     */
    public void setLoginUserEmp(String loginUserEmp) {
        this.loginUserEmp = loginUserEmp;
    }

    /**
     * @return the nomeUserEmp
     */
    public String getNomeUserEmp() {
        return nomeUserEmp;
    }

    /**
     * @param nomeUserEmp the nomeUserEmp to set
     */
    public void setNomeUserEmp(String nomeUserEmp) {
        this.nomeUserEmp = nomeUserEmp;
    }

    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @return the senhaUserEmp
     */
    public String getSenhaUserEmp() {
        return senhaUserEmp;
    }

    /**
     * @param senhaUserEmp the senhaUserEmp to set
     */
    public void setSenhaUserEmp(String senhaUserEmp) {
        this.senhaUserEmp = senhaUserEmp;
    }

    /**
     * @return the dataCadUserEmp
     */
    public Date getDataCadUserEmp() {
        return dataCadUserEmp;
    }

    /**
     * @param dataCadUserEmp the dataCadUserEmp to set
     */
    public void setDataCadUserEmp(Date dataCadUserEmp) {
        this.dataCadUserEmp = dataCadUserEmp;
    }
}
