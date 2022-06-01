/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanArticulo;
import br.com.projeto.model.BeanProducts;
import br.com.projeto.dao.DaoTipoEntrega;
import java.io.IOException;
import java.sql.SQLException;
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
@WebServlet(name = "ServletFimPedido", urlPatterns = {"/FimPedido"})
public class ServletFimPedido extends HttpServlet {

 
DaoTipoEntrega daoTipoEnt;
  
  public ServletFimPedido() throws SQLException{
      this.daoTipoEnt = new DaoTipoEntrega();
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
                  
            HttpSession sessioncart = request.getSession(true);
            ArrayList<BeanArticulo> articulos = sessioncart.getAttribute("carrito") == null ? null : (ArrayList) sessioncart.getAttribute("carrito");
            
            
            int idProduct = Integer.parseInt(request.getParameter("idProduct"));
            int codParceVend = Integer.parseInt(request.getParameter("codParceVend"));
            String precoProduct = request.getParameter("precoProduct");
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            String datosUsuCli = request.getParameter("datosUsuCli");
            String statusPedido = request.getParameter("statusPedido");
            String dataPedido = request.getParameter("dataPedido");
            String valueTotal = request.getParameter("valueTotal");
            boolean flag = false;
            
            //DaoProducts daoProd = new DaoProducts();
            BeanProducts beanProd = new BeanProducts();
          
           
                if(articulos.size() > 0){
                    
                      //BeanArticulo PODE SE ITENS DO CARRINHO OU ITENS DO PEDIDO
                     for(BeanArticulo a : articulos){
                
                        beanProd.setIdProduct(idProduct);
                        beanProd.setCodParceVend(codParceVend);
                        beanProd.setPrecoProduct(Float.parseFloat(precoProduct));
                        beanProd.setIdProduct(a.getQuantidade());
                        beanProd.setLoginUsuEmp(datosUsuCli);
                        
//                        if(idProduct == a.getIdProduct()){
//                            a.setQuantidade(a.getQuantidade() + quantidade);
//                            flag = true;
//                            break;
//                        }
                     }
                }
//                if(!flag){
//                    
//                    BeanArticulo beanArt = new BeanArticulo();
//                    beanArt.setIdProduct(idProduct);
//                    beanArt.setQuantidade(quantidade);
//                    articulos.add(beanArt);
//                }
                  //sessioncart.setAttribute("tipoentrega", beanTipoEnt);
                  sessioncart.setAttribute("carrito", articulos);
                  
               //response.sendRedirect("confirmEndereco.jsp");
               RequestDispatcher envi = request.getRequestDispatcher("confirmEndereco.jsp");
               envi.forward(request, response);

            }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
