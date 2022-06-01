/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.javabean.bean;

/**
 *
 * @author user
 */
public class BeanPagamento {
    
    private int idPagamento;
    private int codPedido;
    private int codCartao;
    private float valorPagamento;
    private String tipoPagamento;
    private int parcelaPagamento;
    private String bandeiraPagamento;

    /**
     * @return the idPagamento
     */
    public int getIdPagamento() {
        return idPagamento;
    }

    /**
     * @param idPagamento the idPagamento to set
     */
    public void setIdPagamento(int idPagamento) {
        this.idPagamento = idPagamento;
    }

    /**
     * @return the codPedido
     */
    public int getCodPedido() {
        return codPedido;
    }

    /**
     * @param codPedido the codPedido to set
     */
    public void setCodPedido(int codPedido) {
        this.codPedido = codPedido;
    }

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
     * @return the valorPagamento
     */
    public float getValorPagamento() {
        return valorPagamento;
    }

    /**
     * @param valorPagamento the valorPagamento to set
     */
    public void setValorPagamento(float valorPagamento) {
        this.valorPagamento = valorPagamento;
    }

    /**
     * @return the tipoPagamento
     */
    public String getTipoPagamento() {
        return tipoPagamento;
    }

    /**
     * @param tipoPagamento the tipoPagamento to set
     */
    public void setTipoPagamento(String tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }

    /**
     * @return the parcelaPagamento
     */
    public int getParcelaPagamento() {
        return parcelaPagamento;
    }

    /**
     * @param parcelaPagamento the parcelaPagamento to set
     */
    public void setParcelaPagamento(int parcelaPagamento) {
        this.parcelaPagamento = parcelaPagamento;
    }

    /**
     * @return the bandeiraPagamento
     */
    public String getBandeiraPagamento() {
        return bandeiraPagamento;
    }

    /**
     * @param bandeiraPagamento the bandeiraPagamento to set
     */
    public void setBandeiraPagamento(String bandeiraPagamento) {
        this.bandeiraPagamento = bandeiraPagamento;
    }
}
