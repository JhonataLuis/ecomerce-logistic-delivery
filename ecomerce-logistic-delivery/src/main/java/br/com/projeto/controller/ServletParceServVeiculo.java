/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanParceiroServiceVeiculo;
import br.com.projeto.dao.DaoParceServVeiculo;
import br.com.projeto.dao.DaoParceiroServiceCadastro;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rayss
 */
@WebServlet(name = "ServletParceServVeiculo", urlPatterns = {"/veiculo"})
public class ServletParceServVeiculo extends HttpServlet {

   
	private static final long serialVersionUID = 523065556276279077L;
        
	DaoParceServVeiculo daoParceServVeiculo;
    
    public ServletParceServVeiculo() throws SQLException{
        this.daoParceServVeiculo = new DaoParceServVeiculo();
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
        
        
        String codParceServ_codParceServ = request.getParameter("codParceServ_codParceServ");
        String tipoVeiculo = request.getParameter("tipoVeiculo");
        
        BeanParceiroServiceVeiculo beanServVeiculo = new BeanParceiroServiceVeiculo();
       
        if(codParceServ_codParceServ != null)
        beanServVeiculo.setCodParceServ_codParceServ(Integer.parseInt(codParceServ_codParceServ));
        beanServVeiculo.setTipoVeiculo_parceServ(tipoVeiculo);
        
        daoParceServVeiculo.cadastroVeiculo(beanServVeiculo);
        request.setAttribute("sessionCadUsuEntrega", daoParceServVeiculo.totalRegistro());
       // request.setAttribute("sessionCadUsuEntrega", daoParceServ.totalRegistros());
        response.sendRedirect("concordParceiro.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
