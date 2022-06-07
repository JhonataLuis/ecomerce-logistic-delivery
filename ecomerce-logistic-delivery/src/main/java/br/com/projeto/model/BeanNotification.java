/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.model;

/**
 *
 * @author user
 */
public class BeanNotification {
    
    private int idNotifi;
    private String titleNotifi;
    private String descNotifi;
    private String imgNotifi;

    /**
     * @return the idNotfi
     */
    public int getIdNotifi() {
        return idNotifi;
    }

    /**
     * @param idNotfi the idNotfi to set
     */
    public void setIdNotifi(int idNotifi) {
        this.idNotifi = idNotifi;
    }

    /**
     * @return the descNotifi
     */
    public String getDescNotifi() {
        return descNotifi;
    }

    /**
     * @param descNotifi the descNotifi to set
     */
    public void setDescNotifi(String descNotifi) {
        this.descNotifi = descNotifi;
    }

    /**
     * @return the imgNotifi
     */
    public String getImgNotifi() {
        return imgNotifi;
    }

    /**
     * @param imgNotifi the imgNotifi to set
     */
    public void setImgNotifi(String imgNotifi) {
        this.imgNotifi = imgNotifi;
    }

    /**
     * @return the titleNotifi
     */
    public String getTitleNotifi() {
        return titleNotifi;
    }

    /**
     * @param titleNotifi the titleNotifi to set
     */
    public void setTitleNotifi(String titleNotifi) {
        this.titleNotifi = titleNotifi;
    }
}
