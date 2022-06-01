/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanUsuario;
import br.com.projeto.dao.DaoUsuario;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rayss
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/cadastro"})
public class ServletUsuario extends HttpServlet {

    
	private static final long serialVersionUID = -6198433840582427999L;
	DaoUsuario daoUsuario;
    
    public ServletUsuario() throws SQLException{
        this.daoUsuario = new DaoUsuario();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String action = request.getParameter("action");
        //String objeto = request.getParameter("objeto");
        
        if(action.equalsIgnoreCase("listar")){
            
            List<BeanUsuario> listar = daoUsuario.listaUsuarios();
            
            request.setAttribute("listando", listar);
            RequestDispatcher disp = request.getRequestDispatcher("listaUsu.jsp");
            disp.forward(request, response);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        //String usuCodigo = request.getParameter("usuCodigo");
        String usuLogin = request.getParameter("usuLogin");
        String usuNome = request.getParameter("usuNome");
        String usuTele = request.getParameter("usuTele");
        String usuSenha = request.getParameter("usuSenha");
        String dateAtual = request.getParameter("dateAtual");
        
        
        BeanUsuario beanUsu = new BeanUsuario();
        
        //if(usuCodigo != null)
            
       // beanUsu.setCodUsu(Integer.parseInt(usuCodigo));
        //beanUsu.setCodUsu((usuLogin));
        beanUsu.setLogin_usu(usuLogin);
        beanUsu.setNome_usu(usuNome);
        beanUsu.setTele_usu(usuTele);
        beanUsu.setSenha_usu(usuSenha);
        
        try{
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = sdf.parse(dateAtual);
            beanUsu.setData_cad(date);
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
       
        //if(usuCodigo.isEmpty() || usuCodigo == null){
            
            daoUsuario.cadastrarUsuario(beanUsu);
            
            request.setAttribute("sucess", " O seu cadastro foi efetuado com sucesso!");
            RequestDispatcher rd = request.getRequestDispatcher("cadUsu.jsp");
            rd.forward(request, response);
        //}
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
