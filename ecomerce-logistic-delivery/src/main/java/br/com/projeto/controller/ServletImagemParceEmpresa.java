/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanParceCadEmpresa;
import br.com.projeto.dao.DaoParceCadEmpresa;
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
@WebServlet(name = "ServletImagemParceEmpresa", urlPatterns = {"/ServletImagemParceEmpresa"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MG)
        maxFileSize = 1024 * 1204 * 10, //10MB
        maxRequestSize = 1024 * 1024 *  50 )
public class ServletImagemParceEmpresa extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 2073238520105392807L;
	DaoParceCadEmpresa daoParceCadEmp;
    
    public ServletImagemParceEmpresa() throws SQLException{
        daoParceCadEmp = new DaoParceCadEmpresa();
    }
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        
        FileItemFactory file_factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(file_factory);
        
        ArrayList<String> campos = new ArrayList<>();
        ArrayList<String> imgs = new ArrayList<>();
        
        try{
            List<FileItem> items = sfu.parseRequest(request);
            
            for(int i = 0; i < items.size(); i++){
                
                FileItem item = (FileItem) items.get(i);
                if(!item.isFormField()){
                    File arquivo = new File("C:\\Users\\user\\Documents\\NetBeansProjects\\Project1\\web\\img1\\imgBusin\\"+item.getName());
                    item.write(arquivo);
                    imgs.add("img1/imgBusin/"+item.getName());
                }
                else{
                    campos.add(item.getString());
                }
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        BeanParceCadEmpresa beanParceEmp = new BeanParceCadEmpresa();
        
        if(campos.get(0) != null)
        beanParceEmp.setCodParceVend(Integer.parseInt(campos.get(0)));
        if(imgs.get(0) != null){
         beanParceEmp.setImgBusin(imgs.get(0));
        }
        daoParceCadEmp.salvarImgEmpresa(beanParceEmp);
        
        request.setAttribute("message", " Sucesso ao Alterar a imagem.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("infoBusiness.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
