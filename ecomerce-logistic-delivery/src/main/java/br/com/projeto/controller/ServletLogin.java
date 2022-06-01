/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanLogin;
import br.com.projeto.model.BeanParceCadEmpresa;
import br.com.projeto.model.BeanUsuarioCliente;
import br.com.projeto.dao.DaoLogin;
import br.com.projeto.dao.DaoParceCadEmpresa;
import br.com.projeto.dao.DaoUsuarioCliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rayss
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/Autenticar"})
public class ServletLogin extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	DaoLogin daoLogin;
    DaoParceCadEmpresa daoParceEmp = new DaoParceCadEmpresa();
    DaoUsuarioCliente daoUsuCli = new DaoUsuarioCliente();
    
    public ServletLogin() throws SQLException{
        this.daoLogin = new DaoLogin();
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
            
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            
            String login = request.getParameter("login").trim();
            String password = request.getParameter("password").trim();
            
            //AÇÃO PARA REALIZAR LOGIN DO USUÁRIO COMUM PARA ACESSAR PLATAFORMA PARA EFETUAR COMPRAS
            if(daoLogin.conectar(login, password)){
                
                BeanLogin beanLogin = new BeanLogin();
                beanLogin.setUsuLogin(login);
                beanLogin.setUsuPassword(password);
                
                BeanUsuarioCliente consultDatos = daoUsuCli.consultDados(login);
                
                if(consultDatos != null){
                    
                    consultDatos.getEmailUsu_cliente();
                    HttpSession session = request.getSession();
                    session.setAttribute("usuariocomum", beanLogin);
                    session.setAttribute("datos", consultDatos);

                    RequestDispatcher disptcher = request.getRequestDispatcher("index.jsp");
                    disptcher.forward(request, response);
                }
                else{
                
                    HttpSession session = request.getSession();
                    session.setAttribute("usuariocomum", beanLogin);
                    session.setAttribute("datos", consultDatos);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                }
            } 
           
            //AÇÃO PARA REALIZAR LOGIN DO USUÁRIO DA EMPRESA PARCEIRA DE PRODUTOS
            if (daoLogin.conectaUsuEmp(login, password)){
                
                BeanLogin beanLogin = new BeanLogin();
                beanLogin.setUsuLogin(login);
                beanLogin.setUsuPassword(password);
                
                 BeanParceCadEmpresa beanParceEmp = daoParceEmp.verEmp(login);
                 beanParceEmp.setEmailRepre(login);
                
                HttpSession session = request.getSession();
                session.setAttribute("usuario", beanLogin);
                session.setAttribute("empUsu", beanParceEmp);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("testTable.jsp");
                dispatcher.forward(request, response);
            }
            else{
                
                request.setAttribute("msgErroLogin", "USUÃ�RIO OU SENHA INCORRETO!");
                RequestDispatcher erro = request.getRequestDispatcher("authenticar.jsp");
                erro.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
