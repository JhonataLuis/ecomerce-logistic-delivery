/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanArticulo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "AddCart", urlPatterns = {"/agregarproduto"})
public class AddCart extends HttpServlet {

   
   


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
        
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        
//        response.getWriter().print(idProduct);
//        response.getWriter().print(quantidade);

        //cria a sessÃ£o do carrinho de compras
        HttpSession sessioncart = request.getSession(true);
        ArrayList<BeanArticulo> articulos = sessioncart.getAttribute("carrito") == null ? new ArrayList<>() : (ArrayList) sessioncart.getAttribute("carrito");
        
        boolean flag = false;
        
        if(articulos.size() > 0){
            
            for(BeanArticulo a : articulos){
                //AQUI VERIFICA SE O ITEM JÃ� ESTÃ� NO CARRINHO E SOMA O VALOR A MAIS DO ITEM
                if(idProduct == a.getIdProduct()){
                    a.setQuantidade(a.getQuantidade() + quantidade);
                    flag = true;
                    break;
                }
            }
        }
        
        if(!flag){
            
            BeanArticulo beanArticulo = new BeanArticulo();
            beanArticulo.setIdProduct(idProduct);
            beanArticulo.setQuantidade(quantidade);
            articulos.add(beanArticulo);
        }
        
        sessioncart.setAttribute("carrito", articulos);
        
        response.sendRedirect("cart.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
