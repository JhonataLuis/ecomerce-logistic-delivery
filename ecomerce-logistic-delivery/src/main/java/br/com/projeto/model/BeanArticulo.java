/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.model;

/**
 *
 * @author rayss
 */
public class BeanArticulo {
    
    private int idProduct;
    private int quantidade;
    private float precoTotal;
    private String nomeTipoEntrega;
    private float valorEnvioUsuCliEntre;

    /**
     * @return the idProduct
     */
    public int getIdProduct() {
        return idProduct;
    }

    /**
     * @param idProduct the idProduct to set
     */
    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    /**
     * @return the quantidade
     */
    public int getQuantidade() {
        return quantidade;
    }

    /**
     * @param quantidade the quantidade to set
     */
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    /**
     * @return the nomeTipoEntrega
     */
    public String getNomeTipoEntrega() {
        return nomeTipoEntrega;
    }

    /**
     * @param nomeTipoEntrega the nomeTipoEntrega to set
     */
    public void setNomeTipoEntrega(String nomeTipoEntrega) {
        this.nomeTipoEntrega = nomeTipoEntrega;
    }

    /**
     * @return the valorEnvioUsuCliEntre
     */
    public float getValorEnvioUsuCliEntre() {
        return valorEnvioUsuCliEntre;
    }

    /**
     * @param valorEnvioUsuCliEntre the valorEnvioUsuCliEntre to set
     */
    public void setValorEnvioUsuCliEntre(float valorEnvioUsuCliEntre) {
        this.valorEnvioUsuCliEntre = valorEnvioUsuCliEntre;
    }

   
}
