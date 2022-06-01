/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanCartao;
import br.com.projeto.dao.DaoCartao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "ServletCartao", urlPatterns = {"/cartao"})
public class ServletCartao extends HttpServlet {

    DaoCartao daoCartao;
    
    public ServletCartao() throws SQLException{
        this.daoCartao = new DaoCartao();
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
        
        String idUsu_cliente = request.getParameter("idUsu_cliente");
        String bandeiraCartao = request.getParameter("bandeiraCartao");
        String numeroCartao = request.getParameter("numeroCartao");
        String validCartao = request.getParameter("validCartao");
        String cvcCartao = request.getParameter("cvcCartao");
        String nomePropriCartao = request.getParameter("nomePropriCartao");
        String cpfPropriCartao = request.getParameter("cpfPropriCartao");
        
        BeanCartao beanCartao = new BeanCartao();
        
        beanCartao.setIdUsu_cliente(Integer.parseInt(idUsu_cliente));
        beanCartao.setBandeiraCartao(bandeiraCartao);
        beanCartao.setNumeroCartao(numeroCartao);
        
        try{
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Date dateCartao = sdf.parse(validCartao);
            beanCartao.setValidCartao(dateCartao);
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        beanCartao.setCvcCartao(Integer.parseInt(cvcCartao));
        beanCartao.setNomePropriCartao(nomePropriCartao);
        beanCartao.setCpfPropriCartao(cpfPropriCartao);
        
        daoCartao.cadastroCartao(beanCartao);
        
        request.setAttribute("msgSucess", "Registro de Cartão de Crédito com Sucesso!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("finalizarPedido.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
