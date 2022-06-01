/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanArticulo;
import br.com.projeto.model.BeanPedido;
import br.com.projeto.model.BeanProducts;
import br.com.projeto.dao.DaoPedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "ServletTest", urlPatterns = {"/ServletTest"})
public class ServletTest extends HttpServlet {

	DaoPedido daoPedido;
        
        public ServletTest() throws SQLException{
            daoPedido = new DaoPedido();
        }
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        List<BeanProducts> produtos = new ArrayList<>();
        String action = request.getParameter("action");
        String idProduct = request.getParameter("idProduct");
        String idParceVend = request.getParameter("idParceVend");
        String idUsuCliente = request.getParameter("idUsuCliente");
        String statusPedido = request.getParameter("statusPedido");
        String dataPedido = request.getParameter("dataPedido");
        String valorPedido = request.getParameter("valorPedido");
        String quantPedido = request.getParameter("quantPedido");
               
         
        
        if(action.equalsIgnoreCase("finalizar")){
            
            BeanPedido beanPedido = new BeanPedido();
            
//             for(BeanProducts prod : produtos ){
//             
//                if(idProduct == prod.getIdProduct()){
//                    prod.setIdProduct(Integer.parseInt(idProduct));
//                    
//            }
//        }
            
            beanPedido.setIdProduct(Integer.parseInt(idProduct));
            beanPedido.setIdParceVend(Integer.parseInt(idParceVend));
            beanPedido.setIdUsuCliente(Integer.parseInt(idUsuCliente));
            beanPedido.setStatusPedido(statusPedido);
            
            try{
                
                SimpleDateFormat  sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date date = sdf.parse(dataPedido);
                beanPedido.setDataPedido(date);
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
            
            beanPedido.setValorPedido(Float.parseFloat(valorPedido));
            beanPedido.setQuantPedido(Integer.parseInt(quantPedido));
            
            daoPedido.cadastrarPedidoCompra(beanPedido);
            
            RequestDispatcher disp = request.getRequestDispatcher("successParceBusiness.jsp");
            disp.forward(request, response);
           
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
