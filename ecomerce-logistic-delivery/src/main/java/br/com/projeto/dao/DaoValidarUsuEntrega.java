/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanParceiroServicoLogin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class DaoValidarUsuEntrega {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoValidarUsuEntrega() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA VALIDAR OS O USUÁRIO DE ENTREGA QUE FEZ O CADASTRO INICIAL
    public boolean validarUsuarioEntrega(String login, String password) throws SQLException{
        
        String sql = "select * FROM cadastroparceiroservicologin WHERE email_parceServ = '"+login+"' and password_parceServ = '"+password+"'";
        
        PreparedStatement pst = connection.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        
        if(rs.next()){
            
            return true;
        }
        else{
            return false;
        }
    }
    
     //MÉTODO PARA VALIDAR OS O USUÁRIO DE ENTREGA QUE FEZ O CADASTRO INICIAL
    public BeanParceiroServicoLogin validarUsuarioEntrega(BeanParceiroServicoLogin beanParceiroServicoLogin) throws SQLException{
        
        //BeanParceiroServicoLogin beanParceiroServicoLogin = null;
        
        String sql = "select * FROM cadastroparceiroservicologin WHERE email_parceServ = ? and password_parceServ = ?";
        
        PreparedStatement pst = connection.prepareStatement(sql);
        pst.setString(1, beanParceiroServicoLogin.getEmailParceServ());
        pst.setString(2, beanParceiroServicoLogin.getPasswordParceServ());
        
        ResultSet rs = pst.executeQuery();
        
        if(rs.next()){
            
            beanParceiroServicoLogin = new BeanParceiroServicoLogin();
            beanParceiroServicoLogin.setEmailParceServ(rs.getString("email_parceServ"));
            beanParceiroServicoLogin.setPasswordParceServ(rs.getString("password_parceServ"));
            beanParceiroServicoLogin.setCodParceServ(rs.getInt("cod_parceServ"));
            beanParceiroServicoLogin.setNomeParceServ(rs.getString("nome_parceServ"));
            
            return beanParceiroServicoLogin;
        }
        
        return null;
        
       
    }
}
