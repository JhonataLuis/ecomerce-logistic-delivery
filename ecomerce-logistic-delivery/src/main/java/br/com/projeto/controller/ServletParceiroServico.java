/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanParceiroServicoLogin;
import br.com.projeto.dao.DaoParceiroServiceCadastro;
import java.io.IOException;
import java.sql.SQLException;
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
@WebServlet(name = "ServletParceiroServico", urlPatterns = {"/cadastro-parceiroServico"})
public class ServletParceiroServico extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = -4179785714155862615L;
	DaoParceiroServiceCadastro daoParceServCad;
    
    public ServletParceiroServico() throws SQLException{
        this.daoParceServCad = new DaoParceiroServiceCadastro();
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
        
       String codParceServ = request.getParameter("codParceServ");
        String emailParceServ = request.getParameter("emailParceServ");
        String nomeParceServ = request.getParameter("nomeParceServ");
        String sobreNomeParceServ = request.getParameter("sobreNomeParceServ");
        String teleParceServ = request.getParameter("teleParceServ");
        String passwordParceServ = request.getParameter("passwordParceServ");
        String cidadeParceServ = request.getParameter("cidadeParceServ");
        String codigoIndcParceServ = request.getParameter("codigoIndcParceServ");
        
        BeanParceiroServicoLogin beanParceServLogin = new BeanParceiroServicoLogin();
        
        if(codParceServ != null)
        beanParceServLogin.setCodParceServ(Integer.parseInt(codParceServ));
        beanParceServLogin.setEmailParceServ(emailParceServ);
        beanParceServLogin.setNomeParceServ(nomeParceServ);
        beanParceServLogin.setSobreNomeParceServ(sobreNomeParceServ);
        beanParceServLogin.setTeleParceServ(teleParceServ);
        beanParceServLogin.setPasswordParceServ(passwordParceServ);
        beanParceServLogin.setCidadeParceServ(cidadeParceServ);
        if(codigoIndcParceServ != null)
        beanParceServLogin.setCodigoIndcParceServ(Integer.parseInt(codigoIndcParceServ));
     
       
        daoParceServCad.cadParceiroService(beanParceServLogin);
        
        //request.setAttribute("sessionCadUsuEntrega", daoParceServCad.totalRegistros());
        
       // HttpSession session = request.getSession();
        //session.setAttribute("sessaocodusuario", beanParceServLogin);
        //request.setAttribute("sessionCadUsuEntrega", daoParceServCad.totalRegistros());
        RequestDispatcher dispatcher = request.getRequestDispatcher("validarCadastro.jsp");
        dispatcher.forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
