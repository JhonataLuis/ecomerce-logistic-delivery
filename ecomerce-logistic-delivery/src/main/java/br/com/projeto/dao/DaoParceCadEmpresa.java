/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.model.BeanParceCadEmpresa;
import br.com.projeto.conexao.ConexaoBanco;

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
public class DaoParceCadEmpresa {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoParceCadEmpresa() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA CADASTRAR O ESTABELECIMENTO E ENDEREÇO PARA VENDER OS PRODUTOS PARA OS CLIENTES
    public void cadastroParceEmpresa(BeanParceCadEmpresa beanParceEmp){
        
        String sql = "insert into cadastroparceiroempresa(nomeEmp, cnpjEmp, teleEmp, ramoEmp, cepEmp, estadoEmp, "
                + "cidadeEmp, bairroEmp, endeEmp, numerEmp, compleEmp, nomeRepre, sobrenomeRepre, emailRepre, "
                + "celularRepre, encontrouComoTimeLogistic, imgBusin)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanParceEmp.getNomeEmp());
            pst.setString(2, beanParceEmp.getCnpjEmp());
            pst.setInt(3, beanParceEmp.getTeleEmp());
            pst.setString(4, beanParceEmp.getRamoEmp());
            pst.setInt(5, beanParceEmp.getCepEmp());
            pst.setString(6, beanParceEmp.getEstadoEmp());
            pst.setString(7, beanParceEmp.getCidadeEmp());
            pst.setString(8, beanParceEmp.getBairroEmp());
            pst.setString(9, beanParceEmp.getEndeEmp());
            pst.setInt(10, beanParceEmp.getNumerEmp());
            pst.setString(11, beanParceEmp.getCompleEmp());
            pst.setString(12, beanParceEmp.getNomeRepre());
            pst.setString(13, beanParceEmp.getSobrenomeRepre());
            pst.setString(14, beanParceEmp.getEmailRepre());
            pst.setInt(15, beanParceEmp.getCelularRepre());
            pst.setString(16, beanParceEmp.getEncontTimeLogistic());
            pst.setString(17, beanParceEmp.getImgBusin());
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceCadEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //MÉTODO PARA SALVAR A IMAGEM LOGO DA EMPRESA
    public void salvarImgEmpresa(BeanParceCadEmpresa beanParceEmp){
        
        String sql = "insert into cadastrologoempresa(codParceVend_codParceVend_imgLogo,filePart)values(?,?)";
        
        PreparedStatement pst = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setInt(1, beanParceEmp.getCodParceVend());
            pst.setString(2, beanParceEmp.getImgBusin());
            pst.execute();
       
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceCadEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //MÉTODO PARA LISTAR EMPRESAS PARA CLIENTES ESCOLHEREM AS EMPRESAS PARA COMPRAR DE SEUS PRODUTOS
    public List<BeanParceCadEmpresa> listaEmpresa(){
        
        //String sql = "select * from cadastroparceiroempresa inner join cadastrologoempresa where codParceVend_codParceVend_imgLogo order by codParceVend";
        String sql = "select * from cadastroparceiroempresa inner join cadastrologoempresa where codParceVend_codParceVend_imgLogo = codParceVend";
        
        List<BeanParceCadEmpresa> listar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanParceCadEmpresa beanEmp = new BeanParceCadEmpresa();
                beanEmp.setCodParceVend(rs.getInt("codParceVend"));
                beanEmp.setNomeEmp(rs.getString("nomeEmp"));
                beanEmp.setRamoEmp(rs.getString("ramoEmp"));
                beanEmp.setCidadeEmp(rs.getString("cidadeEmp"));
                beanEmp.setImgBusin(rs.getString("imgBusin"));
                beanEmp.setIdImgLogo(rs.getInt("idImgLogo"));
                beanEmp.setFilePart(rs.getString("filePart"));
                listar.add(beanEmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceCadEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
                try {
                    if(pst != null)pst.close();
                    if(rs != null)rs.close();
                    
                } catch (SQLException ex) {
                    Logger.getLogger(DaoParceCadEmpresa.class.getName()).log(Level.SEVERE, null, ex);
                }
            
        }
        
        return listar;
    }
    
    //MÉTODO PARA MOSTRAR EMPRESA E UMA LISTA DE SEUS PRODUTOS PARA O CLIENTE QUE VAI COMPRAR
    public BeanParceCadEmpresa consultEmpresa(int codParceEmp){
        
        String sql = "select * from cadastroparceiroempresa inner join cadastrologoempresa where codParceVend ='"+codParceEmp+"' and codParceVend_codParceVend_imgLogo='"+codParceEmp+" and idImgLogo'";
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                BeanParceCadEmpresa beanEmp = new BeanParceCadEmpresa();
                beanEmp.setCodParceVend(rs.getInt("codParceVend"));
                beanEmp.setNomeEmp(rs.getString("nomeEmp"));
                beanEmp.setRamoEmp(rs.getString("ramoEmp"));
                beanEmp.setCidadeEmp(rs.getString("cidadeEmp"));
                //beanEmp.setImgBusin(rs.getString("imgBusin"));
                beanEmp.setFilePart(rs.getString("filePart"));
                
                return beanEmp;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceCadEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                
                if(pst != null)pst.close();
                if(rs != null)rs.close();
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        return null;
    }
    
    //MÉTODO PARA MOSTRAR A EMPRESA DO PARCEIRO A HORA QUE ELE ENTRAR NO SEU DASHBOARD
    public BeanParceCadEmpresa verEmp(String login){
        //select * from cadastroparceiroempresa inner join usuarioempresa join cadastrologoempresa where emailRepre = 'rute@email.com.br' and login_userEmp = 'rute@email.com.br' and  codParceVend_codParceVend_imgLogo = codParceVend;
        String sql = "select * from cadastroparceiroempresa inner join usuarioEmpresa join cadastrologoempresa where emailRepre ='"+login+"' and login_userEmp='"+login+"' and codParceVend_codParceVend_imgLogo = codParceVend";
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            if(rs.next()){
                
                BeanParceCadEmpresa beanParceEmp = new BeanParceCadEmpresa();
                
                beanParceEmp.setCodParceVend(rs.getInt("codParceVend"));
                beanParceEmp.setNomeEmp(rs.getString("nomeEmp"));
                beanParceEmp.setNomeRepre(rs.getString("nomeRepre"));
  //              beanParceEmp.setCelularRepre(rs.getInt("celularRepre"));
                beanParceEmp.setEmailRepre(rs.getString("emailRepre"));
                beanParceEmp.setFilePart(rs.getString("filePart"));
                return beanParceEmp;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoParceCadEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                
                if(pst != null)pst.close();
                if(rs != null)pst.close();
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        return null;
    }
}
