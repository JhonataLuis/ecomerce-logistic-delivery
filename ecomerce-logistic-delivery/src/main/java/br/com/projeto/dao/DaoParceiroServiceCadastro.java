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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class DaoParceiroServiceCadastro {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoParceiroServiceCadastro() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA CADASTRAR O USUÁRIO QUE VAI FAZER A ENTREGA DO PRODUTO NA REGIÃO 
    public void cadParceiroService(BeanParceiroServicoLogin bpServLog){
        
        String sql = "insert into cadastroParceiroServicoLogin(email_parceServ, nome_parceServ, sobrenome_parceServ,"
                + "telefone_parceServ, password_parceServ, cidade_parceiroServ, codIndicacao_parceServ)values(?,?,?,?,?,?,?)";
       
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, bpServLog.getEmailParceServ());
            pst.setString(2, bpServLog.getNomeParceServ());
            pst.setString(3, bpServLog.getSobreNomeParceServ());
            pst.setString(4, bpServLog.getTeleParceServ());
            pst.setString(5, bpServLog.getPasswordParceServ());
            pst.setString(6, bpServLog.getCidadeParceServ());
            pst.setInt(7, bpServLog.getCodigoIndcParceServ());
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceiroServiceCadastro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //MÉTODO PARA LISTAR O USUÁRIO PARA CADASTRAR O VEÍCULO PARA ENTREGA
    public String totalRegistros(){
        
        //String sql = "select cod_parceServ from cadastroparceiroservicologin where cod_parceServ = cod_parceServ order by cod_parceServ desc limit 1";
        String sqli = "select count(1) AS contaRegistros from cadastroparceiroservicologin";
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sqli);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
               String qtdTotalRegistros = rs.getString("contaRegistros");
               return qtdTotalRegistros;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceiroServiceCadastro.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
