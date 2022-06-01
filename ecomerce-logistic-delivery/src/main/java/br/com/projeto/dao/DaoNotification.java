/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanNotification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class DaoNotification {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoNotification() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    public void novaNotification(BeanNotification beanNotifi){
        
        String sql = "INSERT INTO notification(titleNotifi, descNotifi)values(?,?)";
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanNotifi.getTitleNotifi());
            pst.setString(2, beanNotifi.getDescNotifi());
            pst.execute();
            
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoNotification.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    //LISTAR NOTIFICATION CRIADAS
    public List<BeanNotification> listaNotifiNovaEmpresa(){
        
        String sql = "SELECT * FROM notification";
        
        List<BeanNotification> listar = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanNotification beanNotifi = new BeanNotification();
                
                beanNotifi.setIdNotifi(rs.getInt("idNotifi"));
                beanNotifi.setTitleNotifi(rs.getString("titleNotifi"));
                beanNotifi.setDescNotifi(rs.getString("descNotifi"));
                listar.add(beanNotifi);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoNotification.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listar;
    }
    
    //MÉTODO PARA EXCLUIR UMA NOTIFICAÇÃO
    public void excluirNotification(int idNotifi){
        
        String sql = "delete from notification where idNotifi='"+idNotifi+"'";
        
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoNotification.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
