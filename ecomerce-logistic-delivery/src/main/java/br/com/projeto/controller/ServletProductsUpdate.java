/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanProducts;
import br.com.projeto.dao.DaoProducts;
import java.io.IOException;
import java.sql.SQLException;
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
@WebServlet(name = "ServletProductsUpdate", urlPatterns = {"/products_acao"})
public class ServletProductsUpdate extends HttpServlet {

   /**
	 * 
	 */
	private static final long serialVersionUID = 5692460254919424544L;
DaoProducts daoProd;
   
   public ServletProductsUpdate() throws SQLException{
       this.daoProd = new DaoProducts();
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String idProduct = request.getParameter("idProduct");
        String nomeProduct = request.getParameter("nomeProduct");
        String descProduct = request.getParameter("descProduct");
        String catProduct = request.getParameter("catProduct");
        String precoProduct = request.getParameter("precoProduct");
        String detalProduct = request.getParameter("detalProduct");
        
        BeanProducts beanProd = new BeanProducts();
        
        if(idProduct != null)
        beanProd.setIdProduct(Integer.parseInt(idProduct));
        beanProd.setNomeProduct(nomeProduct);
        beanProd.setDescProduct(descProduct);
        beanProd.setCatProduct(catProduct);
        beanProd.setPrecoProduct(Float.parseFloat(precoProduct));
        beanProd.setDetalProduct(detalProduct);
        
        if(idProduct != null && !idProduct.isEmpty()){
            
            daoProd.update_Product(beanProd);
            
            request.setAttribute("msgUpdateProduct", " Produto atualizado com sucesso!");
            RequestDispatcher up = request.getRequestDispatcher("cadProduct.jsp");
            up.forward(request, response);
        }
        else if(idProduct == null){
            
        }
        
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
