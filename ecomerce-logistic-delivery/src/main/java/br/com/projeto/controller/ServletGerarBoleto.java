/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;
/*

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jrimum.bopepo.Boleto;
import org.jrimum.bopepo.view.BoletoViewer;


 
@WebServlet(name = "ServletGerarBoleto", urlPatterns = {"/ServletGerarBoleto"})
public class ServletGerarBoleto extends HttpServlet {

   

	private static final long serialVersionUID = -8846060946063266614L;


	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ServletGerarBoleto</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Gerar Boleto para a compra dos itens " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
 /*   }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("gerarboleto")){
            
           Boleto boleto = new Boleto();

            BoletoViewer viewer = new BoletoViewer(boleto);
             
            
            byte[] pdfAsBytes = viewer.getPdfAsByteArray();

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=boleto.pdf");

            OutputStream output = response.getOutputStream();
            output.write(pdfAsBytes);

            response.flushBuffer();
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
    

}*/
