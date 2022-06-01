/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.dao;

import br.com.projeto.conexao.ConexaoBanco;
import br.com.projeto.model.BeanUsuario;
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
public class DaoUsuario {
    
    Connection connection;
    ConexaoBanco conectBanco = new ConexaoBanco();
    
    public DaoUsuario() throws SQLException{
        this.connection = conectBanco.conectaMysql("bancodedados");
    }
    
    public void cadastrarUsuario(BeanUsuario beanUsu){
        
       
            String sql = "insert into usuario(login_usu, nome_usu, tele_usu, senha_usu, data_cad)values(?,?,?,?,?)";
             
         try {
             
            PreparedStatement pst = null;
            pst = connection.prepareStatement(sql);
            pst.setString(1, beanUsu.getLogin_usu());
            pst.setString(2, beanUsu.getNome_usu());
            pst.setString(3, beanUsu.getTele_usu());
            pst.setString(4, beanUsu.getSenha_usu());
            pst.setDate(5, new java.sql.Date(beanUsu.getData_cad().getTime()));
            pst.execute();
            pst.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //Método para listar os usuarios cadastrados
    public List<BeanUsuario> listaUsuarios(){
      
        String sql = "select * from usuario order by cod_user";
        List<BeanUsuario> listar = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                BeanUsuario beanUsu = new BeanUsuario();
                beanUsu.setCodUsu(rs.getInt("cod_user"));
                beanUsu.setLogin_usu(rs.getString("login_usu"));
                beanUsu.setSenha_usu(rs.getString("senha_usu"));
                beanUsu.setData_cad(rs.getDate("data_cad"));
                listar.add(beanUsu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try{
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            }catch(Exception ex){
                
            }
        }
        
        return listar;
    }
}
