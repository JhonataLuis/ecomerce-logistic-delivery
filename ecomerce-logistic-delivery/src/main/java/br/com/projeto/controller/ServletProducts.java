/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanProducts;
import br.com.projeto.dao.DaoProducts;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author user
 */
@WebServlet(name = "ServletProducts", urlPatterns = {"/products"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MB
        maxFileSize = 1024 * 1024 * 10, //10MB
maxRequestSize = 1024 * 1024 *  50 )
public class ServletProducts extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 2713189418976600442L;
	//BeanProducts beanProd = new BeanProducts();
    DaoProducts daoProducts;
    
    public ServletProducts() throws SQLException{
        this.daoProducts = new DaoProducts();
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String codProduct = request.getParameter("codProduct");
        String action = request.getParameter("action");
        String user = request.getParameter("user");
        
        if(action.equalsIgnoreCase("listar")){
            
            List<BeanProducts> listar = daoProducts.listaProdutos(user);
            
            request.setAttribute("listandoProdutos", listar);
            RequestDispatcher disp = request.getRequestDispatcher("mostraProdutosEmp.jsp");
            disp.forward(request, response);
        }
        else if(action.equalsIgnoreCase("lista")){
            
            List<BeanProducts> listar = daoProducts.listaProdutos(user);
            
            request.setAttribute("listaProducts", listar);
            RequestDispatcher list = request.getRequestDispatcher("listMyProducts.jsp");
            list.forward(request, response);
        }
        else if(action.equalsIgnoreCase("consultar")){
            
            BeanProducts consultProduct = daoProducts.consultaProduto(Integer.parseInt(codProduct));
            
            request.setAttribute("consulta", consultProduct);
            RequestDispatcher consult = request.getRequestDispatcher("detailProduct.jsp");
            consult.forward(request, response);
        }
        else if(action.equalsIgnoreCase("delete")){
            
            daoProducts.excluir_produto(Integer.parseInt(codProduct));
            
            request.setAttribute("msgExcProduct", " Produto foi excluído");
            RequestDispatcher exc = request.getRequestDispatcher("cadProduct.jsp");
            exc.forward(request, response);
        }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
      
            
        FileItemFactory file_factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(file_factory);
        
        ArrayList<String> campos = new ArrayList<>();
        ArrayList<String> imgs = new ArrayList<>();
        
        try{
            List<FileItem> items = sfu.parseRequest(request);
            
            for(int i = 0; i < items.size(); i++){
                
                FileItem item = (FileItem) items.get(i);
                if(!item.isFormField()){
                    File arquivo = new File("C:\\Users\\user\\Documents\\NetBeansProjects\\Project1\\web\\img1\\folder\\"+item.getName());
                    item.write(arquivo);
                    imgs.add("img1/folder/"+item.getName());
                }
                else{
                    campos.add(item.getString());
                }
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
       
        BeanProducts beanProd = new BeanProducts();
        
        beanProd.setImgProduct(imgs.get(0));
        //login, nome, desc, cat, preço, detail
        beanProd.setLoginUsuEmp(campos.get(0));
        beanProd.setCodParceVend(Integer.parseInt(campos.get(1)));
        beanProd.setNomeProduct(campos.get(2));
        beanProd.setDescProduct(campos.get(3));
        beanProd.setCatProduct(campos.get(4));
        beanProd.setPrecoProduct(Float.parseFloat(campos.get(5)));
        beanProd.setDetalProduct(campos.get(6));
        
        
            
            daoProducts.criarProducts(beanProd);

            request.setAttribute("sucess", " Produto cadastrado com sucesso!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("cadProduct.jsp");
            dispatcher.forward(request, response);
       
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
