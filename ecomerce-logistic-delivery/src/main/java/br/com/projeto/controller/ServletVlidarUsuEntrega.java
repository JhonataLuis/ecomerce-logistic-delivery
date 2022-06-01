/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanParceiroServicoLogin;
import br.com.projeto.dao.DaoValidarUsuEntrega;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ServletVlidarUsuEntrega", urlPatterns = {"/validar-cadastro"})
public class ServletVlidarUsuEntrega extends HttpServlet {

    DaoValidarUsuEntrega daoValidarUsuEnt;

    public ServletVlidarUsuEntrega() throws SQLException {
        daoValidarUsuEnt = new DaoValidarUsuEntrega();
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

        try {
//
//            String emailParceServ = request.getParameter("emailParceServ");
//            String passwordParceServ = request.getParameter("passwordParceServ");
//
//            
//            if (daoValidarUsuEnt.validarUsuarioEntrega(emailParceServ, passwordParceServ)){
//                
//                BeanParceiroServicoLogin beanParceServLogin = new BeanParceiroServicoLogin();
//               
//                beanParceServLogin.setEmailParceServ(emailParceServ);
//                beanParceServLogin.setPasswordParceServ(passwordParceServ);
//                
//                HttpSession session = request.getSession();
//                session.setAttribute("sessaocadusuentrega", beanParceServLogin);
//                
//                RequestDispatcher dispatcher = request.getRequestDispatcher("cadParceFormTrabalho.jsp");
//                dispatcher.forward(request, response);
//            }
//            else{
//                
//                request.setAttribute("errologin", "erro ao confirmar, cadastrar novamente!");
//            }
            
             String emailParceServ = request.getParameter("emailParceServ");
            String passwordParceServ = request.getParameter("passwordParceServ");
            
              BeanParceiroServicoLogin beanParceiroServicoLogin = new BeanParceiroServicoLogin();
               
                beanParceiroServicoLogin.setEmailParceServ(emailParceServ);
                beanParceiroServicoLogin.setPasswordParceServ(passwordParceServ);
                
                BeanParceiroServicoLogin usuValidado = daoValidarUsuEnt.validarUsuarioEntrega(beanParceiroServicoLogin);
                
            if(usuValidado != null){
                
                HttpSession session = request.getSession();
                session.setAttribute("sessaocadusuentrega", usuValidado);
                
               RequestDispatcher dispatcher = request.getRequestDispatcher("cadParceFormTrabalho.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServletVlidarUsuEntrega.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
