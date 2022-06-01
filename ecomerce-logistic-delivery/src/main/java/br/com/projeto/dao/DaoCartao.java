/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanCartao;
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
public class DaoCartao {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoCartao() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA CADASTRAR UM CARTÃO DE CRÉDITO PARA USUÁRIO REALIZAR COMPRAS COM O CARTÃO NO SISTEMA
    public void cadastroCartao(BeanCartao beanCart){
        
        String sql = "INSERT INTO cartao(idUsu_cliente_idUsu_cliente, bandeiraCartao, numeroCartao, validCartao, cvcCartao, nomePropriCartao, cpfPropriCartao)values(?,?,?,?,?,?,?)";
        
        PreparedStatement pst = null;
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setInt(1, beanCart.getIdUsu_cliente());
            pst.setString(2, beanCart.getBandeiraCartao());
            pst.setString(3, beanCart.getNumeroCartao());
            pst.setDate(4, new java.sql.Date(beanCart.getValidCartao().getTime()));
            pst.setInt(5, beanCart.getCvcCartao());
            pst.setString(6, beanCart.getNomePropriCartao());
            pst.setString(7, beanCart.getCpfPropriCartao());
            pst.execute();
             
        } catch (SQLException ex) {
            Logger.getLogger(DaoCartao.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                
                if(pst != null)pst.close();
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
       
    }
    
    //MÉTODO PARA LISTAR SE USUÁRIO JÁ TEM CARTÃO CADASTRADO NO SISTEMA PARA EFETUAR PAGAMENTOS COM O CARTÃO
    public boolean testCadCartao() throws SQLException{
        
        String sql = "SELECT * FROM usuario_cliente INNER JOIN cartao ON usuario_cliente.idUsu_cliente = cartao.idUsu_cliente_idUsu_cliente";
        
       PreparedStatement pst = null;
       ResultSet rs = null;
       
      
            
            pst = connection.prepareCall(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                return true;
            }
            else{
                
                return false;
            }
      
    }
    
    //MÉTODO PARA LISTAR O CARTÃO DE CRÉDITO DO USUÁRIO PARA COMPRAS ONLINE COM CARTÃO DE CRÉDITO
    public BeanCartao listaCartaoUsuCli(int idUsuCli){
        
        String sql = "SELECT * FROM usuario_cliente INNER JOIN cartao ON usuario_cliente.'"+idUsuCli+"' = cartao.'"+idUsuCli+"'";
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareCall(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                BeanCartao beanCart = new BeanCartao();
                
                beanCart.setCodCartao(rs.getInt("codCartao"));
                beanCart.setIdUsu_cliente(rs.getInt("idUsu_cliente_idUsu_cliente"));
                beanCart.setBandeiraCartao(rs.getString("bandeiraCartao"));
                beanCart.setNumeroCartao(rs.getString("numeroCartao"));
                beanCart.setValidCartao(rs.getDate("validCartao"));
                beanCart.setNomePropriCartao(rs.getString("nomePropriCartao"));
                return beanCart;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoCartao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
