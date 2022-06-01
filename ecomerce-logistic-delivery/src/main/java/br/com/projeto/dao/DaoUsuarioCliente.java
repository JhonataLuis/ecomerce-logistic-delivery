/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanUsuarioCliente;
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
public class DaoUsuarioCliente {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoUsuarioCliente() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA CADASTRAR OS DADOS DO USUÁRIO COMUM PARA PODER FAZER COMPRAS NO SISTEMA   
    public void cadDadosUsuCliente(BeanUsuarioCliente beanUsuCli){
        
        PreparedStatement pst = null;
        
        try {
            
            String sql = "insert into usuario_Cliente(nomeUsu_cliente, sobreNomeUsu_cliente, dataNascUsu_cliente, telefoneUsu_cliente, enderUsu_cliente,"
                    + " cepUsu_cliente, bairroUsu_cliente, cidadeUsu_cliente, estadoUsu_cliente, paisUsu_cliente, numeroUsu_cliente, emailUsu_cliente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanUsuCli.getNomeUsu_cliente());
            pst.setString(2, beanUsuCli.getSobreNomeUsu_cliente());
            pst.setDate(3, new java.sql.Date(beanUsuCli.getDataNascUsu_cliente().getTime()));
            pst.setString(4, beanUsuCli.getTelefoneUsu_cliente());
            pst.setString(5, beanUsuCli.getEnderUsu_cliente());
            pst.setString(6, beanUsuCli.getCepUsu_cliente());
            pst.setString(7, beanUsuCli.getBairroUsu_cliente());
            pst.setString(8, beanUsuCli.getCidadeUsu_cliente());
            pst.setString(9, beanUsuCli.getEstadoUsu_cliente());
            pst.setString(10, beanUsuCli.getPaisUsu_cliente());
            pst.setInt(11, beanUsuCli.getNumeroUsu_cliente());
            pst.setString(12, beanUsuCli.getEmailUsu_cliente());
            pst.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuarioCliente.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                if(pst != null)pst.close();
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    //MÉTODO PARA LISTAR OS DADOS DO USUARIO 
    public List<BeanUsuarioCliente> listarDadosUsuCli(){
        
        String sql = "select * from usuario_cliente";
        
        List<BeanUsuarioCliente> listar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanUsuarioCliente beanUsuCli = new BeanUsuarioCliente();
                beanUsuCli.setNomeUsu_cliente(rs.getString("nomeUsu_cliente"));
                beanUsuCli.setSobreNomeUsu_cliente(rs.getString("sobreNomeUsu_cliente"));
                beanUsuCli.setDataNascUsu_cliente(rs.getDate("dataNascUsu_cliente"));
                beanUsuCli.setTelefoneUsu_cliente(rs.getString("telefoneUsu_cliente"));
                beanUsuCli.setEnderUsu_cliente(rs.getString("enderUsu_cliente"));
                beanUsuCli.setCidadeUsu_cliente(rs.getString("cidadeUsu_cliente"));
                beanUsuCli.setEstadoUsu_cliente(rs.getString("estadoUsu_cliente"));
                beanUsuCli.setCepUsu_cliente(rs.getString("cepUsu_cliente"));
                beanUsuCli.setBairroUsu_cliente(rs.getString("bairroUsu_cliente"));
                
                listar.add(beanUsuCli);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuarioCliente.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                
                if(pst != null)pst.close();
                if(rs != null)rs.close();
                
            }catch(Exception exception){
                exception.printStackTrace();
            }
        }
        
        return listar;
    }
    // MÉTODO PARA CONSULTAR OS DADOS DO USURIO CLIENTE COMUM PARA COMPRAS
    public BeanUsuarioCliente consultDados(String loginUsu){
        
        String sql = "select * from usuario_cliente inner join usuario where emailUsu_cliente='"+loginUsu+"' and login_usu='"+loginUsu+"'";
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                BeanUsuarioCliente beanUsuCli = new BeanUsuarioCliente();
                
                beanUsuCli.setIdUsu_cliente(rs.getInt("idUsu_cliente"));
                beanUsuCli.setNomeUsu_cliente(rs.getString("nomeUsu_cliente"));
                beanUsuCli.setSobreNomeUsu_cliente(rs.getString("sobreNomeUsu_cliente"));
                beanUsuCli.setDataNascUsu_cliente(rs.getDate("dataNascUsu_cliente"));
                beanUsuCli.setTelefoneUsu_cliente(rs.getString("telefoneUsu_cliente"));
                beanUsuCli.setEnderUsu_cliente(rs.getString("enderUsu_cliente"));
                beanUsuCli.setBairroUsu_cliente(rs.getString("bairroUsu_cliente"));
                beanUsuCli.setCidadeUsu_cliente(rs.getString("cidadeUsu_cliente"));
                beanUsuCli.setCepUsu_cliente(rs.getString("cepUsu_cliente"));
                beanUsuCli.setNumeroUsu_cliente(rs.getInt("numeroUsu_cliente"));
                beanUsuCli.setEmailUsu_cliente(rs.getString("emailUsu_cliente"));
                
               return beanUsuCli;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuarioCliente.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                
                if(pst != null)pst.close();
                if(rs != null)rs.close();
                
            }catch(Exception exception){
                exception.printStackTrace();
            }
        }
        
        return null;
    }//FIM DO MÉTODO CONSULTAR DADOS
    
    //MÉTODO PARA CONSULTAR OS DADOS DO USUARIO CLIENTE PARA MOSTRAR A ONDE É A ENTREGA DO PRODUTO
    public BeanUsuarioCliente datosParaEntrega(int idUsuCli){
        
        String sql = "select * from usuario_cliente where idUsu_cliente='"+idUsuCli+'"';
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                  BeanUsuarioCliente beanUsuCli = new BeanUsuarioCliente();
                
                beanUsuCli.setIdUsu_cliente(rs.getInt("idUsu_cliente"));
                beanUsuCli.setNomeUsu_cliente(rs.getString("nomeUsu_cliente"));
                beanUsuCli.setSobreNomeUsu_cliente(rs.getString("sobreNomeUsu_cliente"));
                beanUsuCli.setDataNascUsu_cliente(rs.getDate("dataNascUsu_cliente"));
                beanUsuCli.setTelefoneUsu_cliente(rs.getString("telefoneUsu_cliente"));
                beanUsuCli.setEnderUsu_cliente(rs.getString("enderUsu_cliente"));
                beanUsuCli.setCepUsu_cliente(rs.getString("cepUsu_cliente"));
                beanUsuCli.setNumeroUsu_cliente(rs.getInt("numeroUsu_cliente"));
                beanUsuCli.setEmailUsu_cliente(rs.getString("emailUsu_cliente"));
                beanUsuCli.setBairroUsu_cliente(rs.getString("bairroUsu_cliente"));
                
                return beanUsuCli;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuarioCliente.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                
                if(pst != null)pst.close();
                if(rs != null)rs.close();
                //connection.rollback();
                
            }catch(Exception excep){
                excep.printStackTrace();
            }
        }
        
        return null;
    }//FIM DO MÉTODO PARA CONSULTAR O ENDEREÇO PARA ENTREGA DO PRODUTO
    
}
