/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanArticulo;
import br.com.projeto.model.BeanCartao;
import br.com.projeto.model.BeanProducts;
import br.com.projeto.dao.DaoCartao;
import java.io.IOException;
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
@WebServlet(name = "ServletFormPayment", urlPatterns = {"/FormPayment"})
public class ServletFormPayment extends HttpServlet {

   DaoCartao daoCartao;
   
   public ServletFormPayment() throws SQLException{
       daoCartao = new DaoCartao();
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
        
            //String idProduct = request.getParameter("idProduct");
           // String codParceVend = request.getParameter("codParceVend");
            //String precoProduct = request.getParameter("precoProduct");
            String datosUsuCli = request.getParameter("datosUsuCli");
            String idUsuCli = request.getParameter("idUsuCli");
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            String tipoEnvioUsuCliEntre = request.getParameter("tipoEnvioUsuCliEntre");
            String valorEnvioUsuCliEntre = request.getParameter("valorEnvioUsuCliEntre");
            
            HttpSession sessioncart = request.getSession(true);
            ArrayList<BeanArticulo> articulos = sessioncart.getAttribute("carrito") == null ? null : (ArrayList) sessioncart.getAttribute("carrito");
            
            BeanProducts beanProd = new BeanProducts();
            for(BeanArticulo a : articulos){
                
                //beanProd.setIdProduct(Integer.parseInt(idProduct));
                //beanProd.setCodParceVend(Integer.parseInt(codParceVend));
                //beanProd.setPrecoProduct(Float.parseFloat(precoProduct));
                beanProd.setLoginUsuEmp(datosUsuCli);
                 beanProd.setIdProduct(a.getQuantidade());
                 a.setNomeTipoEntrega(tipoEnvioUsuCliEntre);
                 a.setValorEnvioUsuCliEntre(Float.parseFloat(valorEnvioUsuCliEntre));
                 //beanTipoEnt.setNomeTipoEntre(tipoEnvioUsuCliEntre);
                 //beanTipoEnt.setValorTipoEntre(Float.parseFloat(valorEnvioUsuCliEntre));
               
            }
       try {
           if(daoCartao.testCadCartao() == true){
               
               System.out.println("Verdadeiro");
                //daoCartao.listaCartaoUsuCli(Integer.parseInt(idUsuCli));
               request.setAttribute("idusucli", daoCartao.listaCartaoUsuCli(Integer.parseInt(idUsuCli)));
           }
       } catch (SQLException ex) {
           Logger.getLogger(ServletFormPayment.class.getName()).log(Level.SEVERE, null, ex);
       }
            
            sessioncart.setAttribute("carrito", articulos);
          
            response.sendRedirect("confirmFormPagar.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
