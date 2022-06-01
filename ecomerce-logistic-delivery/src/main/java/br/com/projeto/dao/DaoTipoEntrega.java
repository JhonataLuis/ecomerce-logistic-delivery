/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanTipoEntrega;
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
 * @author rayss
 */
public class DaoTipoEntrega {
    
    Connection connection;
    ConexaoBanco cb = new ConexaoBanco();
    
    public DaoTipoEntrega() throws SQLException{
        this.connection = cb.conectaMysql("bancodedados");
    }
    
    
    
    //MÉTODO PARA LISTAR OS TIPOS DE ENTREGAS CADASTRADOS NO BANCO
    public List<BeanTipoEntrega> listTipoEntega(){
        
        String sql = "select * from tipoentrega order by idTipoEntrega";
        
        List<BeanTipoEntrega> listar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanTipoEntrega beanTipoEnt = new BeanTipoEntrega();
                beanTipoEnt.setIdTipoEntre(rs.getInt("idTipoEntrega"));
                beanTipoEnt.setNomeTipoEntre(rs.getString("nomeTipoEntrega"));
                beanTipoEnt.setValorTipoEntre(rs.getFloat("valorTipoEntrega"));
                
                listar.add(beanTipoEnt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoTipoEntrega.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                
                if(pst != null)pst.close();
                if(rs != null)rs.close();
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        return listar;
    }
}
