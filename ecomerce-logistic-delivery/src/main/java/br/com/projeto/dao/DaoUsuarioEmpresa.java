/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanUsuarioEmpresa;
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
public class DaoUsuarioEmpresa {
    
    Connection connection;
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    public DaoUsuarioEmpresa() throws SQLException{
        this.connection = conexaoBanco.conectaMysql("bancodedados");
    }
    
    //MÉTODO PARA CADASTRAR LOGIN DO USUARIO DA EMPRESA PARA CADASTRAR PRODUTOS NO SISTEMA PARA VENDER
    public void cadUsuEmpresa(BeanUsuarioEmpresa beanUsuEmp){
        
        String sql = "insert into usuarioempresa (login_userEmp, nome_userEmp, telefone, senha_userEmp, data_cadUsuEmp) values (?,?,?,?,?)";
        
        PreparedStatement pst = null;
        try {
            
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanUsuEmp.getLoginUserEmp());
            pst.setString(2, beanUsuEmp.getNomeUserEmp());
            pst.setString(3, beanUsuEmp.getTelefone());
            pst.setString(4, beanUsuEmp.getSenhaUserEmp());
            pst.setDate(5, new java.sql.Date(beanUsuEmp.getDataCadUserEmp().getTime()));
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuarioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //MÉTODO PARA LISTAR OS USUÁRIOS EMPRESA CADASTRADOS NA PLATAFORMA
    public List<BeanUsuarioEmpresa> listarUsuarioEmpresa(){
        
        String sql = "SELECT * FROM usuarioempresa order by cod_userEmp";
        
        List<BeanUsuarioEmpresa> listar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanUsuarioEmpresa beanUsuEmp = new BeanUsuarioEmpresa();
                beanUsuEmp.setCodUserEmp(rs.getInt("cod_userEmp"));
                beanUsuEmp.setNomeUserEmp(rs.getString("nome_userEmp"));
                beanUsuEmp.setLoginUserEmp(rs.getString("login_userEmp"));
                beanUsuEmp.setTelefone(rs.getString("telefone"));
                beanUsuEmp.setDataCadUserEmp(rs.getDate("data_cadUsuEmp"));
                
                listar.add(beanUsuEmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuarioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                if(pst != null){pst.close();}
                if(rs != null){rs.close();}
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        return listar;
    }
}
