/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanPoliticPrivac;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class DaoPoliticPrivac {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoPoliticPrivac() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA ACEITAR CADASTRAR A POLÍTICA E PRIVACIDADE
    public void cadPoliticPrivac(BeanPoliticPrivac beanPoliPri){
        
        String sql = "insert into politicaprivacidade(codParceServ_codParceServ_descPoliticPrivac, descPoliticPrivac) values(?,?)";
        
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setInt(1, beanPoliPri.getCodParceServ_codParceServ_descPolitic());
            pst.setString(2, beanPoliPri.getDescPoliticPrivac());
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoPoliticPrivac.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
