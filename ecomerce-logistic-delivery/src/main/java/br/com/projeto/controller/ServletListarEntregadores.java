/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanParceDocumentos;
import br.com.projeto.model.BeanPedido;
import br.com.projeto.dao.DaoParceDocumentos;
import br.com.projeto.dao.DaoPedido;
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
@WebServlet(name = "ServletListarEntregadores", urlPatterns = {"/lista-entregadores"})
public class ServletListarEntregadores extends HttpServlet {

    DaoParceDocumentos daoParceDocs;
    DaoPedido daoPedido = new DaoPedido();
    
    public ServletListarEntregadores() throws SQLException{
        this.daoParceDocs = new DaoParceDocumentos();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("listaentregadores")){
            
            List<BeanParceDocumentos> listarentregadores = daoParceDocs.listaParceServiceEntrega();
            request.setAttribute("listaentregadores", listarentregadores);
            RequestDispatcher dispatcher = request.getRequestDispatcher("listaDeEntregadores.jsp");
            dispatcher.forward(request, response);
        }
        //AÇÃO PARA LISTAR TODAS AS COMPRAS PARA O ADMINISTRADOR VER
        if(action.equalsIgnoreCase("listartodospedidos")){
            
            try {
                
                String numeroPagina = request.getParameter("numeroPagina");
                
                List<BeanPedido> listarPedidos = daoPedido.listPedidoCompra(numeroPagina);
                
                if(listarPedidos.isEmpty()){
                    numeroPagina = ""+(Integer.parseInt(numeroPagina) -1);
                    listarPedidos = daoPedido.listPedidoCompra(numeroPagina);
                }
                
                
                request.setAttribute("listartodospedidos", listarPedidos);
                request.setAttribute("numeroPagina", (numeroPagina != null ? numeroPagina : 1));
                
                int quantidadePagina = daoPedido.quantidadePagina();
                request.setAttribute("quantidadePagina", quantidadePagina);
                
                RequestDispatcher disp = request.getRequestDispatcher("listaDePedidos.jsp?quantidadePagina="+quantidadePagina+"&numeroPagina="+numeroPagina);
                disp.forward(request, response);
                
            } catch (SQLException ex) {
                Logger.getLogger(ServletListarEntregadores.class.getName()).log(Level.SEVERE, null, ex);
            }
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
