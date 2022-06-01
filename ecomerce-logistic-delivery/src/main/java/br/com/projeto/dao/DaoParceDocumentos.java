/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanParceDocumentos;
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
public class DaoParceDocumentos {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoParceDocumentos() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //METODO PARA CADASTRAR OS DOCUMENTOS DO PARCEIRO DE SERVIÇOS
    public void cadastroParceDocumentos(BeanParceDocumentos beanParceDocs){
        
        String sql = "INSERT INTO cadastroparceiroservicodocumentos(cnh_parceServ, codParceServ_codParceServ, foto_parceServ, registroLicenci_parceServ)values(?,?,?,?)";
        
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanParceDocs.getCnhParceServ());
            pst.setInt(2, beanParceDocs.getCodParceServEntLogin());
            pst.setString(3, beanParceDocs.getFotoParceServ());
            pst.setString(4, beanParceDocs.getRegLicenciParceServ());
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceDocumentos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //*****************************************************************************************//
    
    //MÉTODO PARA LISTAR TODOS OS  PARCEIRO DE ENTREGA COM SUAS INFORMAÇÕES PARA O ADMINISTRADOR
    public List<BeanParceDocumentos> listaParceServiceEntrega(){
        
        String sql = "SELECT * FROM cadastroparceiroservicologin INNER JOIN cadastroparceiroservicoveiculo ON cadastroparceiroservicologin.cod_parceServ = cadastroparceiroservicoveiculo.codParceServ_codParceServ JOIN cadastroparceiroservicodocumentos ON cadastroparceiroservicodocumentos.codParceServ_codParceServ = cadastroparceiroservicologin.cod_parceServ";
        
        List<BeanParceDocumentos> listar = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanParceDocumentos beanParceDocs = new BeanParceDocumentos();
                
                beanParceDocs.setCodParceServEntLogin(rs.getInt("cod_parceServ"));
                beanParceDocs.setCidadeParceiroServEnt(rs.getInt("cidade_parceiroServ"));
                beanParceDocs.setNomeParceServEnt(rs.getString("nome_parceServ"));
                beanParceDocs.setSobreNomeParceServEnt(rs.getString("sobrenome_parceServ"));
                beanParceDocs.setCodVeiculoParceServEnt(rs.getInt("codVeiculo_parceServ"));
                beanParceDocs.setTipoVeiculoParceServEnt(rs.getString("tipoVeiculo_parceServ"));
                beanParceDocs.setCnhParceServ(rs.getString("cnh_parceServ"));
                beanParceDocs.setFotoParceServ(rs.getString("foto_parceServ"));
                beanParceDocs.setRegLicenciParceServ(rs.getString("registroLicenci_parceServ"));
                
                listar.add(beanParceDocs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceDocumentos.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listar;
    }
    
    //MÉTODO PARA MOSTRAR DETALHES DO PARCEIRO ENTREGADOR
    
    
}
