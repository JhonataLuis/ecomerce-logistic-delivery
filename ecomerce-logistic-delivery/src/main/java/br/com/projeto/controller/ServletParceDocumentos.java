/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;


import br.com.projeto.model.BeanParceDocumentos;
import br.com.projeto.dao.DaoParceDocumentos;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
 * @author rayss
 */

@WebServlet(name = "ServletParceDocumentos", urlPatterns = {"/ServletParceDocumentos"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MB
maxFileSize = 1024 * 1024 * 10, //10MB
maxRequestSize = 1024 * 1024 * 50)

public class ServletParceDocumentos extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 7186581911513985782L;
	DaoParceDocumentos daoParceDocs;
    
    public ServletParceDocumentos() throws SQLException{
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
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        response.setContentType("text/html;charset=UTF-8");
        
        FileItemFactory file_factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(file_factory);
        
        ArrayList<String> campos = new ArrayList<>();
        ArrayList<String> imgs = new ArrayList<>();
        
        try{
        List<FileItem> items = sfu.parseRequest(request);
        for(int i = 0; i < items.size(); i++){
            FileItem item = (FileItem) items.get(i);
            if(!item.isFormField()){
                File arquivo = new File("C:\\Users\\user\\Documents\\NetBeansProjects\\Project1\\web\\img\\documentos\\"+item.getName());
                item.write(arquivo); 
                imgs.add("img/documentos/"+item.getName());
            }else{
                campos.add(item.getString());
            }
        }
        
        }catch(Exception ex){
            ex.printStackTrace();
            
        }
        
        BeanParceDocumentos beanParceDocs = new BeanParceDocumentos();
        
        beanParceDocs.setCodParceServEntLogin(Integer.parseInt(campos.get(0)));
        
        beanParceDocs.setCnhParceServ(imgs.get(0));
        beanParceDocs.setFotoParceServ(imgs.get(1));
        beanParceDocs.setRegLicenciParceServ(imgs.get(2));
        
        daoParceDocs.cadastroParceDocumentos(beanParceDocs);
        
        response.sendRedirect("successParceEntrega.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
 