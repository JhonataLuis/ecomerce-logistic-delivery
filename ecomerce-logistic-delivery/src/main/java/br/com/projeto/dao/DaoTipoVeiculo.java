/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanTipoVeiculo;
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
public class DaoTipoVeiculo {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoTipoVeiculo() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //METODO PARA CADASTRAR VEICULO7
    
    
    //METODO PARA LISTAR VEICULO PARA CADASTRO DE VEICULO DO PARCEIRO PARA TRABALHAR COM ENTREGAS
    public List<BeanTipoVeiculo> listaTipoVeiculo(){
        
        String sql = "select * from tiposDeVeiculos order by codTipoVeiculo";
        
        List<BeanTipoVeiculo> listar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                BeanTipoVeiculo beanTipo = new BeanTipoVeiculo();
                
                beanTipo.setCodTipoVeiculo(rs.getInt("codTipoVeiculo"));
                beanTipo.setTipoVeiculo(rs.getString("tipoVeiculo"));
                beanTipo.setMarcaVeiculo(rs.getString("marcaVeiculo"));
                beanTipo.setMarcaVeiculo(rs.getString("modeloVeiculo"));
                beanTipo.setAnoVeiculo(rs.getInt("anoVeiculo"));
                
                listar.add(beanTipo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoTipoVeiculo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listar;
    }
}
