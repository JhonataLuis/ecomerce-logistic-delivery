/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanNotification;
import br.com.projeto.model.BeanUsuarioEmpresa;
import br.com.projeto.dao.DaoNotification;
import br.com.projeto.dao.DaoUsuarioEmpresa;
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
@WebServlet(name = "ServletUsuEmpresa", urlPatterns = {"/cadastroUsuEmp"})
public class ServletUsuEmpresa extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DaoUsuarioEmpresa daoUsuEmp;
        DaoNotification daoNotifi = new DaoNotification();
        BeanNotification beanNotifi = new BeanNotification();
    
    public ServletUsuEmpresa() throws SQLException{
        this.daoUsuEmp = new DaoUsuarioEmpresa();
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
        
        if(action.equalsIgnoreCase("notifi")){
           
            List<BeanNotification> listarNotification = daoNotifi.listaNotifiNovaEmpresa();
            
            request.setAttribute("listarnotification", listarNotification);
            RequestDispatcher notification = request.getRequestDispatcher("cadUsuEmpresa.jsp");
            notification.forward(request, response);
        }
        if(action.equalsIgnoreCase("listausuariosempresa")){
            
            List<BeanUsuarioEmpresa> listarUsuEmpresa = daoUsuEmp.listarUsuarioEmpresa();
            
            request.setAttribute("listarusuarioempresa", listarUsuEmpresa);
            RequestDispatcher req = request.getRequestDispatcher("cadUsuEmpresa.jsp");
            req.forward(request, response);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    
        String loginUserEmp = request.getParameter("loginUserEmp");
        String nomeUserEmp = request.getParameter("nomeUserEmp");
        String telefone = request.getParameter("telefone");
        String senhaUserEmp = request.getParameter("senhaUserEmp");
        String dataCadUserEmp = request.getParameter("dataCadUserEmp");
        String descNotifi = "Nova Empresa Cadastrada.";
        
        BeanUsuarioEmpresa beanUsuEmp = new BeanUsuarioEmpresa();
        
        beanUsuEmp.setLoginUserEmp(loginUserEmp);
        beanUsuEmp.setNomeUserEmp(nomeUserEmp);
        beanUsuEmp.setTelefone(telefone);
        beanUsuEmp.setSenhaUserEmp(senhaUserEmp);
        
        try{
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = sdf.parse(dataCadUserEmp);
            beanUsuEmp.setDataCadUserEmp(date);
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        daoUsuEmp.cadUsuEmpresa(beanUsuEmp);
        
        beanNotifi.setTitleNotifi(nomeUserEmp);
        beanNotifi.setDescNotifi(descNotifi);
        daoNotifi.novaNotification(beanNotifi);
        
        List<BeanNotification> listar = daoNotifi.listaNotifiNovaEmpresa();
        
        request.setAttribute("notification", listar);
        request.setAttribute("sucess", " O acesso do usuário parceiro foi criado com sucesso!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("cadUsuEmpresa.jsp");
        dispatcher.forward(request, response);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
