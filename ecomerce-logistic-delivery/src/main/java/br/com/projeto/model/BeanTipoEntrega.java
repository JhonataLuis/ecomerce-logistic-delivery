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
public class BeanTipoEntrega {
    
    private int idTipoEntre;
    private int idUsu_cli;
    private String nomeTipoEntre;
    private float valorTipoEntre;

    /**
     * @return the idTipoEntre
     */
    public int getIdTipoEntre() {
        return idTipoEntre;
    }

    /**
     * @param idTipoEntre the idTipoEntre to set
     */
    public void setIdTipoEntre(int idTipoEntre) {
        this.idTipoEntre = idTipoEntre;
    }

    /**
     * @return the nomeTipoEntre
     */
    public String getNomeTipoEntre() {
        return nomeTipoEntre;
    }

    /**
     * @param nomeTipoEntre the nomeTipoEntre to set
     */
    public void setNomeTipoEntre(String nomeTipoEntre) {
        this.nomeTipoEntre = nomeTipoEntre;
    }

    /**
     * @return the valorTipoEntre
     */
    public float getValorTipoEntre() {
        return valorTipoEntre;
    }

    /**
     * @param valorTipoEntre the valorTipoEntre to set
     */
    public void setValorTipoEntre(float valorTipoEntre) {
        this.valorTipoEntre = valorTipoEntre;
    }

    /**
     * @return the idUsu_cli
     */
    public int getIdUsu_cli() {
        return idUsu_cli;
    }

    /**
     * @param idUsu_cli the idUsu_cli to set
     */
    public void setIdUsu_cli(int idUsu_cli) {
        this.idUsu_cli = idUsu_cli;
    }
}
