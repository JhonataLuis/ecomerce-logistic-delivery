/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanParceCadEmpresa;
import br.com.projeto.model.BeanProducts;
import br.com.projeto.dao.DaoParceCadEmpresa;
import br.com.projeto.dao.DaoProducts;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "ServletParceEmpresa", urlPatterns = {"/parceiro-empresa"})
public class ServletParceEmpresa extends HttpServlet {

    DaoParceCadEmpresa daoParceCadEmp;
    DaoProducts daoProducts = new DaoProducts();
    
    public ServletParceEmpresa() throws SQLException{
        this.daoParceCadEmp = new DaoParceCadEmpresa();
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
        //String idParceEmp = request.getParameter("idParceEmp");
        
        //LISTA AS EMPRESAS PARA OS CLIENTES
        if(action.equalsIgnoreCase("listar")){
            
            List<BeanParceCadEmpresa> listar = daoParceCadEmp.listaEmpresa();
            
            request.setAttribute("listandoEmpresa", listar);
            RequestDispatcher dp = request.getRequestDispatcher("listaEmpresa.jsp");
            dp.forward(request, response);
        }
        //FAZ UMA CONSULTA DA EMPRESA E LISTA TODOS OS PRODUTOS DA MESMA PARA O USUARIO
        if(action.equalsIgnoreCase("produtosEmpresa")){
            
            String codParceVend = request.getParameter("codParceVend");
            //int idImgLogo = Integer.parseInt(request.getParameter("idImgLogo"));
            //String idImgLogo = request.getParameter("idImgLogo");
            
            BeanParceCadEmpresa consultEmp = daoParceCadEmp.consultEmpresa(Integer.parseInt(codParceVend));
            
            List<BeanProducts> listandoProdutos = daoProducts.listarProdutosParaCompra(Integer.parseInt(codParceVend));
            
            request.setAttribute("consultEmp", consultEmp);
            request.setAttribute("listandoProdutos", listandoProdutos);
            RequestDispatcher list = request.getRequestDispatcher("mostraProdutosEmp.jsp");
            list.forward(request, response);
        }
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        String nomeEmp = request.getParameter("nomeEmp");
        String cnpjEmp = request.getParameter("cnpjEmp");
        String teleEmp = request.getParameter("teleEmp");
        String ramoEmp = request.getParameter("ramoEmp");
        String cepEmp = request.getParameter("cepEmp");
        String estadoEmp = request.getParameter("estadoEmp");
        String cidadeEmp = request.getParameter("cidadeEmp");
        String bairroEmp = request.getParameter("bairroEmp");
        String endeEmp = request.getParameter("endeEmp");
        String numerEmp = request.getParameter("numerEmp");
        String compleEmp = request.getParameter("compleEmp");
        String nomeRepre = request.getParameter("nomeRepre");
        String sobrenomeRepre = request.getParameter("sobrenomeRepre");
        String emailRepre = request.getParameter("emailRepre");
        String celularRepre = request.getParameter("celularRepre");
        String encontTimeLogistic = request.getParameter("encontTimeLogistic");
   
        
        BeanParceCadEmpresa beanParceEmp = new BeanParceCadEmpresa();
        
        beanParceEmp.setNomeEmp(nomeEmp);
        beanParceEmp.setCnpjEmp(cnpjEmp);
        if(teleEmp != null)
        beanParceEmp.setTeleEmp(Integer.parseInt(teleEmp));
        beanParceEmp.setRamoEmp(ramoEmp);
        if(cepEmp != null)
        beanParceEmp.setCepEmp(Integer.parseInt(cepEmp));
        beanParceEmp.setEstadoEmp(estadoEmp);
        beanParceEmp.setCidadeEmp(cidadeEmp);
        beanParceEmp.setBairroEmp(bairroEmp);
        beanParceEmp.setEndeEmp(endeEmp);
        if(numerEmp != null)
        beanParceEmp.setNumerEmp(Integer.parseInt(numerEmp));
        beanParceEmp.setCompleEmp(compleEmp);
        beanParceEmp.setNomeRepre(nomeRepre);
        beanParceEmp.setSobrenomeRepre(sobrenomeRepre);
        beanParceEmp.setEmailRepre(emailRepre);
        if(celularRepre != null)
        beanParceEmp.setCelularRepre(Integer.parseInt(celularRepre));
        beanParceEmp.setEncontTimeLogistic(encontTimeLogistic);
        
        daoParceCadEmp.cadastroParceEmpresa(beanParceEmp);
        
        response.sendRedirect("successParceBusiness.jsp");
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
