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
public class BeanPedido {
    
    //ITENS DA TABELA PEDIDOVENDA
    private int idPedido;
    private int idProduct;
    private int idParceVend;
    private int idUsuCliente;
    private String statusPedido;
    private Date dataPedido;
    private float valorPedido;
    private int quantPedido;
    
    //ITENS DA TABELA CLIENTEUSUARIO
    private String nomeUsuCli;
    private String sobrenomeUsuCli;
    private String emailUsuCli;
    private int numeroUsuCli;
    private String enderUsuCli;
    private String cepUsuCli;
    private String bairroUsuCli;
    private String cidadeUsuCli;
    private String estadoUsuCli;
    
    //ITENS DA TABELA CADASTROPARCEIROEMPRESA
    private String nomeEmp;
    
    //PRODUTOS DA TABELA PRODUCTS
    private String nomeProduto;
    private String imageProduct;
    

    /**
     * @return the idPedido
     */
    public int getIdPedido() {
        return idPedido;
    }

    /**
     * @param idPedido the idPedido to set
     */
    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

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
     * @return the idParceVend
     */
    public int getIdParceVend() {
        return idParceVend;
    }

    /**
     * @param idParceVend the idParceVend to set
     */
    public void setIdParceVend(int idParceVend) {
        this.idParceVend = idParceVend;
    }

    /**
     * @return the idUsuCliente
     */
    public int getIdUsuCliente() {
        return idUsuCliente;
    }

    /**
     * @param idUsuCliente the idUsuCliente to set
     */
    public void setIdUsuCliente(int idUsuCliente) {
        this.idUsuCliente = idUsuCliente;
    }

    /**
     * @return the statusPedido
     */
    public String getStatusPedido() {
        return statusPedido;
    }

    /**
     * @param statusPedido the statusPedido to set
     */
    public void setStatusPedido(String statusPedido) {
        this.statusPedido = statusPedido;
    }

    /**
     * @return the dataPedido
     */
    public Date getDataPedido() {
        return dataPedido;
    }

    /**
     * @param dataPedido the dataPedido to set
     */
    public void setDataPedido(Date dataPedido) {
        this.dataPedido = dataPedido;
    }

    /**
     * @return the valorPedido
     */
    public float getValorPedido() {
        return valorPedido;
    }

    /**
     * @param valorPedido the valorPedido to set
     */
    public void setValorPedido(float valorPedido) {
        this.valorPedido = valorPedido;
    }

    /**
     * @return the quantPedido
     */
    public int getQuantPedido() {
        return quantPedido;
    }

    /**
     * @param quantPedido the quantPedido to set
     */
    public void setQuantPedido(int quantPedido) {
        this.quantPedido = quantPedido;
    }

    /**
     * @return the emailUsuCli
     */
    public String getEmailUsuCli() {
        return emailUsuCli;
    }

    /**
     * @param emailUsuCli the emailUsuCli to set
     */
    public void setEmailUsuCli(String emailUsuCli) {
        this.emailUsuCli = emailUsuCli;
    }

    /**
     * @return the enderUsuCli
     */
    public String getEnderUsuCli() {
        return enderUsuCli;
    }

    /**
     * @param enderUsuCli the enderUsuCli to set
     */
    public void setEnderUsuCli(String enderUsuCli) {
        this.enderUsuCli = enderUsuCli;
    }

    /**
     * @return the cepUsuCli
     */
    public String getCepUsuCli() {
        return cepUsuCli;
    }

    /**
     * @param cepUsuCli the cepUsuCli to set
     */
    public void setCepUsuCli(String cepUsuCli) {
        this.cepUsuCli = cepUsuCli;
    }

    /**
     * @return the bairroUsuCli
     */
    public String getBairroUsuCli() {
        return bairroUsuCli;
    }

    /**
     * @param bairroUsuCli the bairroUsuCli to set
     */
    public void setBairroUsuCli(String bairroUsuCli) {
        this.bairroUsuCli = bairroUsuCli;
    }

    /**
     * @return the cidadeUsuCli
     */
    public String getCidadeUsuCli() {
        return cidadeUsuCli;
    }

    /**
     * @param cidadeUsuCli the cidadeUsuCli to set
     */
    public void setCidadeUsuCli(String cidadeUsuCli) {
        this.cidadeUsuCli = cidadeUsuCli;
    }

    /**
     * @return the estadoUsuCli
     */
    public String getEstadoUsuCli() {
        return estadoUsuCli;
    }

    /**
     * @param estadoUsuCli the estadoUsuCli to set
     */
    public void setEstadoUsuCli(String estadoUsuCli) {
        this.estadoUsuCli = estadoUsuCli;
    }

    /**
     * @return the numeroUsuCli
     */
    public int getNumeroUsuCli() {
        return numeroUsuCli;
    }

    /**
     * @param numeroUsuCli the numeroUsuCli to set
     */
    public void setNumeroUsuCli(int numeroUsuCli) {
        this.numeroUsuCli = numeroUsuCli;
    }

    /**
     * @return the nomeUsuCli
     */
    public String getNomeUsuCli() {
        return nomeUsuCli;
    }

    /**
     * @param nomeUsuCli the nomeUsuCli to set
     */
    public void setNomeUsuCli(String nomeUsuCli) {
        this.nomeUsuCli = nomeUsuCli;
    }

    /**
     * @return the sobrenomeUsuCli
     */
    public String getSobrenomeUsuCli() {
        return sobrenomeUsuCli;
    }

    /**
     * @param sobrenomeUsuCli the sobrenomeUsuCli to set
     */
    public void setSobrenomeUsuCli(String sobrenomeUsuCli) {
        this.sobrenomeUsuCli = sobrenomeUsuCli;
    }

    /**
     * @return the nomeEmp
     */
    public String getNomeEmp() {
        return nomeEmp;
    }

    /**
     * @param nomeEmp the nomeEmp to set
     */
    public void setNomeEmp(String nomeEmp) {
        this.nomeEmp = nomeEmp;
    }

    /**
     * @return the nomeProduto
     */
    public String getNomeProduto() {
        return nomeProduto;
    }

    /**
     * @param nomeProduto the nomeProduto to set
     */
    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    /**
     * @return the imageProduct
     */
    public String getImageProduct() {
        return imageProduct;
    }

    /**
     * @param imageProduct the imageProduct to set
     */
    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }
}
