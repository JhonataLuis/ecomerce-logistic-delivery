/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanParceiroServiceVeiculo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rayss
 */
public class DaoParceServVeiculo {
    
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    Connection connection;
    
    public DaoParceServVeiculo() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    public void cadastroVeiculo(BeanParceiroServiceVeiculo beanServVeiculo){
        
        String sql = "insert into cadastroparceiroservicoveiculo (codParceServ_codParceServ, tipoVeiculo_parceServ) values(?,?)";
        
        PreparedStatement pst = null;
        
         try {
             
             pst = connection.prepareStatement(sql);
             pst.setInt(1, beanServVeiculo.getCodParceServ_codParceServ());
             pst.setString(2, beanServVeiculo.getTipoVeiculo_parceServ());
             pst.execute();
             pst.close();
             
         } catch (SQLException ex) {
             Logger.getLogger(DaoParceServVeiculo.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    
    //MÉTODO PARA LISTAR O ID DO USUÁRIO CADASTRADO PARA TODAS AS PAGINAS DE CADASTROS ESTÁREM VINCULADAS COM O USUÁRIO 
    public String totalRegistro(){
        
        String sql = "select max(codParceServ_codParceServ) from cadastroparceiroservicoveiculo";
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
         try {
             
             pst = connection.prepareStatement(sql);
             rs = pst.executeQuery();
             
             if(rs.next()){
               
                 String qtdTotalRegistros = rs.getString("codParceServ_codParceServ");
                 return qtdTotalRegistros;
             }
         } catch (SQLException ex) {
             Logger.getLogger(DaoParceServVeiculo.class.getName()).log(Level.SEVERE, null, ex);
         }
        return null;
    }
    
}
