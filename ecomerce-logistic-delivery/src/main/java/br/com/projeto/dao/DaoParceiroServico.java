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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rayss
 */
public class DaoParceiroServico {
    
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    Connection connection;
    
    public DaoParceiroServico() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    public void cadastroParceServico(BeanParceiroServicoLogin beanParceServ){
        
        String sql = "insert into cadastroparceiroservicologin(email_parceServ, nome_parceServ, sobrenome_parceServ, telefone_parceServ, password_parceServ,"
                + " cidade_parceServ, codigoIndicacao_parceServ)values(?,?,?,?,?,?,?)";
        
        PreparedStatement pst = null;
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanParceServ.getEmailParceServ());
            pst.setString(2, beanParceServ.getNomeParceServ());
            pst.setString(3, beanParceServ.getSobreNomeParceServ());
            pst.setString(4, beanParceServ.getTeleParceServ());
            pst.setString(5, beanParceServ.getPasswordParceServ());
            pst.setString(6, beanParceServ.getCidadeParceServ());
            pst.setInt(7, beanParceServ.getCodigoIndcParceServ());
            pst.execute();
            System.out.println(" CADASTRO " +pst.toString());
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceiroServico.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
