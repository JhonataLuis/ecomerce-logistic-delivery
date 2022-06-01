/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanEntrega;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author rayss
 */
public class DaoEntrega {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoEntrega() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA CADASTRAR O ENDEREÇO DE ENTREGA DOS PRODUTOS COMPRADOS PELO USUÁRIO
    public void cadEnderEntregaUsu(BeanEntrega beanEntre){
        
        String sql = "insert into ";
    }//FIM DO MÉTODO CADASTRO ENDEREÇO
}
