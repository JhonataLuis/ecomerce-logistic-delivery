/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rayss
 */
public class ConexaoBanco {
    
    Connection connection = null;
    String caminho = "jdbc:mysql://localhost:3306/";
    //String caminho = "jdbc:mysql://localhost:3306/bancodedados?useTimezone=true&serverTimezone=UTC";
    String usuario = "root";
    String password = "usuario";
    
    
    public Connection conectaMysql(String banco)throws SQLException{
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Encontrou o driver do Banco de dados.");
            try {
                connection = DriverManager.getConnection(caminho+banco, usuario, password);
                System.out.println("Conectou ao usuario, senha e banco de dados");
            } catch (SQLException ex) {
                Logger.getLogger(ConexaoBanco.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Não Encontrou banco usuario e password, conectou.");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexaoBanco.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(" não Encontrou Driver do Banco.");
        }
        
        return connection;
    }
}
