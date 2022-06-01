/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanPedido;
import br.com.projeto.model.BeanProducts;
import br.com.projeto.dao.DaoPedido;
import br.com.projeto.dao.DaoProducts;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ServletPedido", urlPatterns = {"/ServletPedido"})
public class ServletPedido extends HttpServlet {

    DaoPedido daoPedido;
    
    public ServletPedido() throws SQLException{
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
        
        String statusPedido = request.getParameter("statusPedido");
        String numeroPagina = request.getParameter("numeroPagina");
        String codUser = request.getParameter("codUser");
        String codParceVend = request.getParameter("codParceVend");
        String codPedido = request.getParameter("codPedido");
        String action = request.getParameter("action");
        
        //AÇÃO PARA LISTAR OS PEDIDOS NA ÁREA DO DASHBOARD DA EMPRESA QUE VENDE OS PRODUTOS
        if(action.equalsIgnoreCase("pedidos")){
            
            List<BeanPedido> listadepedidos = daoPedido.listaDePedidosVendedor(Integer.parseInt(codParceVend));
            request.setAttribute("listadepedidos", listadepedidos);
            RequestDispatcher dispatcher = request.getRequestDispatcher("pedidos.jsp");
            dispatcher.forward(request, response);
        }
        
        //AÇÃO PARA CONSULTAR UM PEDIDO NA ÁREA DO DASHBOARD DA EMPRESA QUE VENDE OS PRODUTOS
        if(action.equalsIgnoreCase("consultarpedido")){
            
            BeanPedido beanPedido = daoPedido.consultPedido(Integer.parseInt(codPedido));
            List<BeanPedido> listadepedidos = daoPedido.listaDePedidosVendedor(Integer.parseInt(codParceVend));
            request.setAttribute("listadepedidos", listadepedidos);
            request.setAttribute("consultarpedido", beanPedido);
            RequestDispatcher consult = request.getRequestDispatcher("consultarPedido.jsp");
            consult.forward(request, response);
        }
        
        //AÇÃO PARA LISTAR OS PEDIDOS DO USUÁRIO QUE REALIZOU
        if(action.equalsIgnoreCase("listarPedidosUsuario")){
            
            try {
                
                List<BeanPedido> listaCompraUsu = daoPedido.listarPedidosCompUsuario(Integer.parseInt(codUser), numeroPagina);
                
                if(listaCompraUsu.isEmpty()){
                    numeroPagina = ""+(Integer.parseInt(numeroPagina) -1);
                    listaCompraUsu = daoPedido.listarPedidosCompUsuario(Integer.parseInt(codUser), numeroPagina);
                }
                
                request.setAttribute("listacomprausu", listaCompraUsu);
                request.setAttribute("numeroPagina", (numeroPagina != null ? numeroPagina : 1));
                
                int quantidadePaginaPorUsu = daoPedido.quantidadePaginaPorUsu(Integer.parseInt(codUser));
                request.setAttribute("quantidadePagina", quantidadePaginaPorUsu);
                
                
                RequestDispatcher verComp = request.getRequestDispatcher("myCompras.jsp?quantidadePagina="+quantidadePaginaPorUsu+"&numeroPagina="+numeroPagina);
                verComp.forward(request, response);
                
            } catch (SQLException ex) {
                Logger.getLogger(ServletPedido.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if(action.equalsIgnoreCase("updatestatuspedido")){
            
            BeanPedido beanPed = new BeanPedido();
            beanPed.setIdPedido(Integer.parseInt(codPedido));
            beanPed.setStatusPedido(statusPedido);
            
            daoPedido.updateStatusPedido(beanPed);
            
            response.sendRedirect("pedidos.jsp");
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
