/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author rayss
 */
public class DaoLogin {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoLogin() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    public boolean conectar(String login, String password) throws SQLException{
        
        String sql = "select * FROM usuario WHERE login_usu='"+login+"' and senha_usu='"+password+"'";
        
        PreparedStatement pst = connection.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                
                return true;
            }
            else{
                
                return false;
            }
    }
    
    //MÉTODO PARA OS USUÁRIOS DAS EMPRESAS ACESSAREM O DASHBOARD DA EMPRESA
    public boolean conectaUsuEmp(String login, String password) throws SQLException{
        
        String sql = "select * FROM usuarioEmpresa WHERE login_userEmp='"+login+"' and senha_userEmp='"+password+"'";
        
         PreparedStatement pst = connection.prepareStatement(sql);
         ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                
                return true;
            }
            else{
                
                return false;
            }
    }
}
