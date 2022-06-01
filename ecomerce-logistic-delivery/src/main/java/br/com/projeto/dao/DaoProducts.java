/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanProducts;
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
public class DaoProducts {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoProducts() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    public void criarProducts(BeanProducts beanProd){
        
        String sql = "insert into products(nomeProduct, loginUsuEmp, codParceVend, descProduct, catProduct, precoProduct, detalProduct, imgProduct)values(?,?,?,?,?,?,?,?)";
        
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanProd.getNomeProduct());
            pst.setString(2, beanProd.getLoginUsuEmp());
            pst.setInt(3, beanProd.getCodParceVend());
            pst.setString(4, beanProd.getDescProduct());
            pst.setString(5, beanProd.getCatProduct());
            pst.setFloat(6, beanProd.getPrecoProduct());
            pst.setString(7, beanProd.getDetalProduct());
            pst.setString(8, beanProd.getImgProduct());
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //METODO PARA LISTAR OS PRODUTOS DE CADA EMPRESA NA SUA AREA DE DASHBOARD
    public List<BeanProducts> listaProdutos(String user){
        
        String sql = "select * from products where loginUsuEmp='"+user+"'";
        
        List<BeanProducts> listar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanProducts beanProd = new BeanProducts();
                
                beanProd.setIdProduct(rs.getInt("idProduct"));
                beanProd.setLoginUsuEmp(rs.getString("loginUsuEmp"));
                beanProd.setNomeProduct(rs.getString("nomeProduct"));
                beanProd.setDescProduct(rs.getString("descProduct"));
                beanProd.setCatProduct(rs.getString("catProduct"));
                beanProd.setPrecoProduct(rs.getFloat("precoProduct"));
                beanProd.setDetalProduct(rs.getString("detalProduct"));
                beanProd.setImgProduct(rs.getString("imgProduct"));
                
                listar.add(beanProd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try{
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return listar;
    }
    
    //MÉTODO PARA LISTAR OS PRODUTOS QUANDO O CLIENTE FOR VER OS PRODUTOS POR EMPRESAS
    public List<BeanProducts> listarProdutosParaCompra(int codParceVend){
        
        String sql = "select * from products where codParceVend='"+codParceVend+"'";
        
         List<BeanProducts> listar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanProducts beanProd = new BeanProducts();
                
                beanProd.setIdProduct(rs.getInt("idProduct"));
                //beanProd.setLoginUsuEmp(rs.getString("loginUsuEmp"));
                beanProd.setCodParceVend(rs.getInt("codParceVend"));
                beanProd.setNomeProduct(rs.getString("nomeProduct"));
                beanProd.setDescProduct(rs.getString("descProduct"));
                beanProd.setCatProduct(rs.getString("catProduct"));
                beanProd.setPrecoProduct(rs.getFloat("precoProduct"));
                beanProd.setImgProduct(rs.getString("imgProduct"));
                
                listar.add(beanProd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try{
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return listar;
    }
    
    //MÉTODO PARA CONSULTAR O PRODUTO PARA COMPRAR
    //E USADO PARA ADICIONAR OS PRODUTOS NO CARRINHO TAMBÉM
    public BeanProducts consultaProduto(int codProduct){
        
        String sql = "select * from products where idProduct='"+codProduct+"'";
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                BeanProducts beanProd = new BeanProducts();
                
                beanProd.setIdProduct(rs.getInt("idProduct"));
                beanProd.setCodParceVend(rs.getInt("codParceVend"));
                beanProd.setNomeProduct(rs.getString("nomeProduct"));
                beanProd.setDescProduct(rs.getString("descProduct"));
                beanProd.setCatProduct(rs.getString("catProduct"));
                beanProd.setPrecoProduct(rs.getFloat("precoProduct"));
                beanProd.setDetalProduct(rs.getString("detalProduct"));
                beanProd.setImgProduct(rs.getString("imgProduct"));
                
                return beanProd;
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try{
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        
        }
        return null;
    }
    //MÉTODO PARA PARCEIRO CADASTRADO EXCLUIR UM PRODUTO SEU CADASTRADO NO DASHBOARD
    public void excluir_produto(int idProduct){
        
        String sql = "delete from products where idProduct='"+idProduct+"'";
        
        PreparedStatement pst = null;
        try {
            
            pst = connection.prepareStatement(sql);
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //MÉTODO PARA ATUALIZAR PRODUTOS NO DASHBOARD DO PARCEIRO CADASTRADO
    public void update_Product(BeanProducts beanProd){
        
        String sql = "update products set nomeProduct=?, descProduct=?, catProduct=?, precoProduct=?, detalProduct=? where idProduct='"+beanProd.getIdProduct()+"'";
        
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanProd.getNomeProduct());
            pst.setString(2, beanProd.getDescProduct());
            pst.setString(3, beanProd.getCatProduct());
            pst.setFloat(4, beanProd.getPrecoProduct());
            pst.setString(5, beanProd.getDetalProduct());
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//FIM DO MÉTODO ATUALIZAR
    
    
    //MÉTODO PARA LISTAR O PRODUTO PARA A TAGLIST
    public BeanProducts consultProductPedidos(int idProduct){
        
        String sql = "SELECT * FROM products where idProducts='"+idProduct+"'";
        
        PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                BeanProducts beanProd = new BeanProducts();
                beanProd.setIdProduct(rs.getInt("idProduct"));
                beanProd.setNomeProduct(rs.getString("nomeProduct"));
                
                return beanProd;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProducts.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            
        }
        
        return null;
    }
}
