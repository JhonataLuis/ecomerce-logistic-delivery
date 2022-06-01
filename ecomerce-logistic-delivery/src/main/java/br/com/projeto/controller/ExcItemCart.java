/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanArticulo;
import br.com.projeto.model.BeanProducts;
import br.com.projeto.dao.DaoProducts;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ExcItemCart", urlPatterns = {"/ExcItemCart"})
public class ExcItemCart extends HttpServlet {

   
    /**
	 * 
	 */
	//private static final long serialVersionUID = -1756510931985652787L;


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
           
            
            int idproducto = Integer.parseInt(request.getParameter("idproducto"));
            
            HttpSession sessioncart = request.getSession(true);
            ArrayList<BeanArticulo> articulos = sessioncart.getAttribute("carrito") == null ? null : (ArrayList) sessioncart.getAttribute("carrito");
            
            if(articulos != null){
                for(BeanArticulo a : articulos){
                    if(a.getIdProduct() == idproducto){
                        articulos.remove(a);
                        break;
                    }
                }
            }
            
            double total = 0;
            DaoProducts daoProd = new DaoProducts();
            for(BeanArticulo a : articulos){
                BeanProducts beanProd = daoProd.consultaProduto(a.getIdProduct());
                total += a.getQuantidade() * beanProd.getPrecoProduct();
            }
            
            response.getWriter().print(Math.round(total * 100.0)/ 100.0);
            
        } catch (SQLException ex) {
            Logger.getLogger(ExcItemCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
