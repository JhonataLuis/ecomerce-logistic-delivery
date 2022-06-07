/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.model;

import java.util.Date;

/**
 *
 * @author user
 */
public class BeanCartao {
    
    private int codCartao;
    private int idUsu_cliente;
    private String bandeiraCartao;
    private String numeroCartao;
    private Date validCartao;
    private int cvcCartao;
    private String nomePropriCartao;
    private String cpfPropriCartao;

    /**
     * @return the codCartao
     */
    public int getCodCartao() {
        return codCartao;
    }

    /**
     * @param codCartao the codCartao to set
     */
    public void setCodCartao(int codCartao) {
        this.codCartao = codCartao;
    }

    /**
     * @return the numeroCartao
     */
    public String getNumeroCartao() {
        return numeroCartao;
    }

    /**
     * @param numeroCartao the numeroCartao to set
     */
    public void setNumeroCartao(String numeroCartao) {
        this.numeroCartao = numeroCartao;
    }

    /**
     * @return the validCartao
     */
    public Date getValidCartao() {
        return validCartao;
    }

    /**
     * @param validCartao the validCartao to set
     */
    public void setValidCartao(Date validCartao) {
        this.validCartao = validCartao;
    }

    /**
     * @return the cvcCartao
     */
    public int getCvcCartao() {
        return cvcCartao;
    }

    /**
     * @param cvcCartao the cvcCartao to set
     */
    public void setCvcCartao(int cvcCartao) {
        this.cvcCartao = cvcCartao;
    }

    /**
     * @return the nomePropriCartao
     */
    public String getNomePropriCartao() {
        return nomePropriCartao;
    }

    /**
     * @param nomePropriCartao the nomePropriCartao to set
     */
    public void setNomePropriCartao(String nomePropriCartao) {
        this.nomePropriCartao = nomePropriCartao;
    }

    /**
     * @return the cpfPropriCartao
     */
    public String getCpfPropriCartao() {
        return cpfPropriCartao;
    }

    /**
     * @param cpfPropriCartao the cpfPropriCartao to set
     */
    public void setCpfPropriCartao(String cpfPropriCartao) {
        this.cpfPropriCartao = cpfPropriCartao;
    }

    /**
     * @return the bandeiraCartao
     */
    public String getBandeiraCartao() {
        return bandeiraCartao;
    }

    /**
     * @param bandeiraCartao the bandeiraCartao to set
     */
    public void setBandeiraCartao(String bandeiraCartao) {
        this.bandeiraCartao = bandeiraCartao;
    }

    /**
     * @return the idUsu_cliente
     */
    public int getIdUsu_cliente() {
        return idUsu_cliente;
    }

    /**
     * @param idUsu_cliente the idUsu_cliente to set
     */
    public void setIdUsu_cliente(int idUsu_cliente) {
        this.idUsu_cliente = idUsu_cliente;
    }
    
}
