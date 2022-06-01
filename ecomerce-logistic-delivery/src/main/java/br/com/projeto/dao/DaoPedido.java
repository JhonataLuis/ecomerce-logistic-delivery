/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanPedido;
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
 * @author user
 */
public class DaoPedido {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    //construtor
    public DaoPedido() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA CADASTRAR O PEDIDO DE COMPRA
    public void cadastrarPedidoCompra(BeanPedido beanPedido){
        
        String sql = "INSERT INTO pedidovenda(codParceVend_codParceVend, idProduct_idProduct, idUsu_cliente_idUsu_cliente, statusPedido, dataPedido, valorPedido, quantPedido) values(?,?,?,?,?,?,?)";
        
        PreparedStatement pst = null;
        try {
            
            pst = connection.prepareCall(sql);
            pst.setInt(1, beanPedido.getIdParceVend());
            pst.setInt(2, beanPedido.getIdProduct());
            pst.setInt(3, beanPedido.getIdUsuCliente());
            pst.setString(4, beanPedido.getStatusPedido());
            pst.setDate(5, new java.sql.Date(beanPedido.getDataPedido().getTime()));
            pst.setFloat(6, beanPedido.getValorPedido());
            pst.setInt(7, beanPedido.getQuantPedido());
            pst.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoPedido.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                
                if(pst != null)pst.close();
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    //MÉTODO PARA LISTAR OS PEDIDOS DE COMPRAS REALIZADOS NO SISTEMA PARA O DASHBOARD ADMINISTRADOR DO SISTEMA(MÉTODO PAGINADO)
    public List<BeanPedido> listPedidoCompra(String numeroPagina) throws SQLException{
        
        int total_pedidos_por_pagina = 6;
        if(numeroPagina == null || numeroPagina != null && numeroPagina.trim().isEmpty()){
            numeroPagina = "0";
        }
        
        int offset = (Integer.parseInt(numeroPagina) * total_pedidos_por_pagina) - total_pedidos_por_pagina;
        
        if(offset < 0){
            offset = 0;
        }
        String sql = "SELECT * FROM pedidovenda INNER JOIN usuario_cliente ON pedidovenda.idUsu_cliente_idUsu_cliente = usuario_cliente.idUsu_cliente JOIN cadastroparceiroempresa ON pedidovenda.codParceVend_codParceVend = cadastroparceiroempresa.codParceVend LIMIT " + total_pedidos_por_pagina + " OFFSET " + offset + "";
        
        List<BeanPedido> lista = new ArrayList<>();
        
        //PreparedStatement pst = null;
        //ResultSet rs = null;
        
        
            
          PreparedStatement pst = connection.prepareStatement(sql);
          ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanPedido beanPed = new BeanPedido();
                
                beanPed.setIdPedido(rs.getInt("codPedidoVenda"));
                beanPed.setIdUsuCliente(rs.getInt("idUsu_cliente_idUsu_cliente"));
                beanPed.setIdParceVend(rs.getInt("codParceVend_codParceVend"));
                beanPed.setNomeEmp(rs.getString("nomeEmp"));
                beanPed.setIdProduct(rs.getInt("idProduct_idProduct"));
                beanPed.setQuantPedido(rs.getInt("quantPedido"));
                beanPed.setValorPedido(rs.getFloat("valorPedido"));
                beanPed.setDataPedido(rs.getDate("dataPedido"));
                beanPed.setStatusPedido(rs.getString("statusPedido"));
                beanPed.setNomeUsuCli(rs.getString("nomeUsu_cliente"));
                lista.add(beanPed);
            }
            
       
        
        return lista;
    }
    //MÉTODO PARA CONTAR O NÚMERO DE PAGINAS PARA PAGINAR LISTA DE PEDIDOS DE VENDA PARA O ADMINISTRADOR
    public int quantidadePagina() throws SQLException{
        
        String sql = "SELECT count(1) totalPedidosVenda FROM pedidovenda";
        int quantidadePagina = 1;
        double total_pedidos_por_pagina = 6.0;
        
        PreparedStatement find = connection.prepareStatement(sql);
        ResultSet resultSet = find.executeQuery();
        
        if(resultSet.next()){
            double totalPedidosVenda = resultSet.getDouble("totalPedidosVenda");
            if(totalPedidosVenda > total_pedidos_por_pagina){
                
                double quantidadePaginaTemp = Float.parseFloat(""+(totalPedidosVenda / total_pedidos_por_pagina));
                
                if(!(quantidadePaginaTemp % 2 == 0)){
                    quantidadePagina = new Double(quantidadePaginaTemp).intValue() + 1;
                }
                else{
                    quantidadePagina = new Double(quantidadePaginaTemp).intValue();
                }
            }
            else{
                quantidadePagina = 1;
            }
        }
        return quantidadePagina;
    }
    //MÉTODO PARA LISTAR OS PEDIDOS REALIZADOS PARA O VENDEDOR DO PRODUTO NO SEU DASHBOARD
    public List<BeanPedido> listaDePedidosVendedor(int codParceVend){
        
        //String sql = "select * from cadastroparceiroempresa INNER JOIN pedidovenda ON cadastroparceiroempresa.codParceVend = pedidovenda.codParceVend_codParceVend";
        String sql = "SELECT * FROM pedidovenda INNER JOIN cadastroparceiroempresa ON pedidovenda.codParceVend_codParceVend = cadastroparceiroempresa.codParceVend where pedidovenda.codParceVend_codParceVend='"+codParceVend+"'";
       
        List<BeanPedido> listar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                
                BeanPedido beanPed = new BeanPedido();
                
                beanPed.setIdPedido(rs.getInt("codPedidoVenda"));
                beanPed.setIdUsuCliente(rs.getInt("idUsu_cliente_idUsu_cliente"));
                beanPed.setIdParceVend(rs.getInt("codParceVend_codParceVend"));
                beanPed.setIdProduct(rs.getInt("idProduct_idProduct"));
                beanPed.setQuantPedido(rs.getInt("quantPedido"));
                beanPed.setValorPedido(rs.getFloat("valorPedido"));
                beanPed.setDataPedido(rs.getDate("dataPedido"));
                beanPed.setStatusPedido(rs.getString("statusPedido"));
                //beanPed.setNomeUsuCli(rs.getString("nomeUsu_cliente"));
                listar.add(beanPed);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoPedido.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            
        }
        
        return listar;
    }
    
    //MÉTODO PARA CONSULTAR UM PEDIDO NA ÁREA DO DASHBOARD DA EMPRESA QUE VENDE PRODUTOS
    public BeanPedido consultPedido(int idPedido){
        
        String sql = "select * from pedidovenda INNER JOIN usuario_cliente ON pedidovenda.idUsu_cliente_idUsu_cliente = usuario_cliente.idUsu_cliente JOIN products ON pedidovenda.idProduct_idProduct = products.idProduct where codPedidoVenda='"+idPedido+"'";
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                BeanPedido beanPed = new BeanPedido();
                beanPed.setIdPedido(rs.getInt("codPedidoVenda"));
                beanPed.setIdUsuCliente(rs.getInt("idUsu_cliente_idUsu_cliente"));
                beanPed.setIdParceVend(rs.getInt("codParceVend_codParceVend"));
                beanPed.setIdProduct(rs.getInt("idProduct_idProduct"));
                beanPed.setNomeProduto(rs.getString("nomeProduct"));
                beanPed.setQuantPedido(rs.getInt("quantPedido"));
                beanPed.setValorPedido(rs.getFloat("valorPedido"));
                beanPed.setDataPedido(rs.getDate("dataPedido"));
                beanPed.setStatusPedido(rs.getString("statusPedido"));
                beanPed.setEmailUsuCli(rs.getString("emailUsu_cliente"));
                beanPed.setCepUsuCli(rs.getString("cepUsu_cliente"));
                beanPed.setEnderUsuCli(rs.getString("enderUsu_cliente"));
                beanPed.setNumeroUsuCli(rs.getInt("numeroUsu_cliente"));
                beanPed.setBairroUsuCli(rs.getString("bairroUsu_cliente"));
                beanPed.setCidadeUsuCli(rs.getString("cidadeUsu_cliente"));
                beanPed.setEstadoUsuCli(rs.getString("estadoUsu_cliente"));
                beanPed.setNomeUsuCli(rs.getString("nomeUsu_cliente"));
                beanPed.setSobrenomeUsuCli(rs.getString("sobreNomeUsu_cliente"));
                return beanPed;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoPedido.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
        return null;
    }
    //MÉTODO PARA MOSTRAR LISTA PAGINADA DOS ITENS DO PEDIDO DE VENDA DO USUÁRIO QUE COMPROU
   public List<BeanPedido> listarPedidosCompUsuario(int codUser, String numeroPagina){
       
       int total_itens_por_pagina = 6;
        if(numeroPagina == null || numeroPagina != null && numeroPagina.trim().isEmpty()){
            numeroPagina = "0";
        }
        
        int offset = (Integer.parseInt(numeroPagina) * total_itens_por_pagina) - total_itens_por_pagina;
        
        if(offset < 0){
            offset = 0;
        }
       
       String sql = "select * from pedidovenda INNER JOIN usuario_cliente ON pedidovenda.idUsu_cliente_idUsu_cliente='"+codUser+"' and usuario_cliente.idUsu_cliente='"+codUser+"' JOIN cadastroparceiroempresa ON pedidovenda.codParceVend_codParceVend = cadastroparceiroempresa.codParceVend JOIN products ON pedidovenda.idProduct_idProduct = products.idProduct LIMIT " + total_itens_por_pagina + " OFFSET " + offset + "";
       List<BeanPedido> lista = new ArrayList<>();
       
       PreparedStatement pst = null;
       ResultSet rs = null;
       
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanPedido beanPed = new BeanPedido();
                beanPed.setIdPedido(rs.getInt("codPedidoVenda"));
                beanPed.setIdParceVend(rs.getInt("codParceVend_codParceVend"));
                beanPed.setNomeEmp(rs.getString("nomeEmp"));
                beanPed.setIdUsuCliente(rs.getInt("idUsu_cliente_idUsu_cliente"));
                beanPed.setStatusPedido(rs.getString("statusPedido"));
                beanPed.setEmailUsuCli(rs.getString("emailUsu_cliente"));
                beanPed.setValorPedido(rs.getFloat("valorPedido"));
                beanPed.setDataPedido(rs.getDate("dataPedido"));
                beanPed.setImageProduct(rs.getString("imgProduct"));
                lista.add(beanPed);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoPedido.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        return lista;
   }
    public int quantidadePaginaPorUsu(int codUsu) throws SQLException{
        
        String sql = "SELECT count(1) totalPedidosVenda FROM pedidovenda where idUsu_cliente_idUsu_cliente='"+codUsu+"'";
        int quantidadePagina = 1;
        double total_pedidos_por_pagina = 6.0;
        
        PreparedStatement find = connection.prepareStatement(sql);
        ResultSet resultSet = find.executeQuery();
        
        if(resultSet.next()){
            double totalPedidosVenda = resultSet.getDouble("totalPedidosVenda");
            if(totalPedidosVenda > total_pedidos_por_pagina){
                
                double quantidadePaginaTemp = Float.parseFloat(""+(totalPedidosVenda / total_pedidos_por_pagina));
                
                if(!(quantidadePaginaTemp % 2 == 0)){
                    quantidadePagina = new Double(quantidadePaginaTemp).intValue() + 1;
                }
                else{
                    quantidadePagina = new Double(quantidadePaginaTemp).intValue();
                }
            }
            else{
                quantidadePagina = 1;
            }
        }
        return quantidadePagina;
    }
   //MÉTODO PARA EMPRESA PARCEIRA ATUALIZAR O STATUS DO PRODUTO DASHBOARD USUÁRIO EMPRESA
   public void updateStatusPedido(BeanPedido beanPed){
       
       String sql = "UPDATE pedidovenda set statusPedido=? where codPedidoVenda='"+beanPed.getIdPedido()+"'";
       
       PreparedStatement pst = null;
        try {
            
            pst = connection.prepareStatement(sql);
            //pst.executeUpdate();
            pst.setString(1, beanPed.getStatusPedido());
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
}
