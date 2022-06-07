/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.model;

import java.util.Date;

/**
 *
 * @author rayss
 */
public class BeanLogin {
    
    private int idLogin;
    private String usuLogin;
    private String usuPassword;
    private Date usuHoraLogado;
    
    //////////////////////////
    
    private String nomeEmp;

    /**
     * @return the idLogin
     */
    public int getIdLogin() {
        return idLogin;
    }

    /**
     * @param idLogin the idLogin to set
     */
    public void setIdLogin(int idLogin) {
        this.idLogin = idLogin;
    }

    /**
     * @return the usuLogin
     */
    public String getUsuLogin() {
        return usuLogin;
    }

    /**
     * @param usuLogin the usuLogin to set
     */
    public void setUsuLogin(String usuLogin) {
        this.usuLogin = usuLogin;
    }

    /**
     * @return the usuPassword
     */
    public String getUsuPassword() {
        return usuPassword;
    }

    /**
     * @param usuPassword the usuPassword to set
     */
    public void setUsuPassword(String usuPassword) {
        this.usuPassword = usuPassword;
    }

    /**
     * @return the usuHoraLogado
     */
    public Date getUsuHoraLogado() {
        return usuHoraLogado;
    }

    /**
     * @param usuHoraLogado the usuHoraLogado to set
     */
    public void setUsuHoraLogado(Date usuHoraLogado) {
        this.usuHoraLogado = usuHoraLogado;
    }
    
}
