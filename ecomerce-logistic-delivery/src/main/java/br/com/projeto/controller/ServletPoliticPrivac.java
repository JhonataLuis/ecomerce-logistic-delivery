/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanPoliticPrivac;
import br.com.projeto.dao.DaoPoliticPrivac;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "ServletPoliticPrivac", urlPatterns = {"/politica-privacidade"})
public class ServletPoliticPrivac extends HttpServlet {

    DaoPoliticPrivac daoPoliticPrivac;
    
    public ServletPoliticPrivac() throws SQLException{
        daoPoliticPrivac = new DaoPoliticPrivac();
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
        
        
        String descPoliticPrivac = request.getParameter("descPoliticPrivac");
        String codParceServ_codParceServ_descPoliticPrivac = request.getParameter("codParceServ_codParceServ_descPoliticPrivac");
        
        BeanPoliticPrivac beanPoliticPrivac = new BeanPoliticPrivac();
        
        if(codParceServ_codParceServ_descPoliticPrivac != null)
        beanPoliticPrivac.setCodParceServ_codParceServ_descPolitic(Integer.parseInt(codParceServ_codParceServ_descPoliticPrivac));
        beanPoliticPrivac.setDescPoliticPrivac(descPoliticPrivac);
        
        daoPoliticPrivac.cadPoliticPrivac(beanPoliticPrivac);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("documentosVeiculo.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
