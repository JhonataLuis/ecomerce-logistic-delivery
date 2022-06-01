/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto.controller;

import br.com.projeto.model.BeanUsuarioCliente;
import br.com.projeto.dao.DaoUsuarioCliente;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "ServletUsuarioDados", urlPatterns = {"/Dados"})
public class ServletUsuarioDados extends HttpServlet {

   
	private static final long serialVersionUID = -8070264224127145418L;
	DaoUsuarioCliente daoUsuCli;
    
    public ServletUsuarioDados() throws SQLException{
        daoUsuCli = new DaoUsuarioCliente();
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
        String user = request.getParameter("user");
        
        if(action.equalsIgnoreCase("consultDados")){
            
            BeanUsuarioCliente consult = daoUsuCli.consultDados(user);
            
            request.setAttribute("consultar", consult);
            RequestDispatcher rd = request.getRequestDispatcher("myDados.jsp");
            rd.forward(request, response);
        }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String nomeUsuCli = request.getParameter("nomeUsuCli");
        String sobreNomeUsuCli = request.getParameter("sobreNomeUsuCli");
        String dataNascUsuCli = request.getParameter("dataNascUsuCli");
        String telefoneUsuCli = request.getParameter("telefoneUsuCli");
        String enderUsuCli = request.getParameter("enderUsuCli");
        String cepUsuCli = request.getParameter("cepUsuCli");
        String bairroUsuCli = request.getParameter("bairroUsuCli");
        String cidadeUsu_cliente = request.getParameter("cidadeUsu_cliente");
        String estadoUsuCli = request.getParameter("estadoUsuCli");
        String paisUsuCli = request.getParameter("paisUsuCli");
        String numeroUsuCli = request.getParameter("numeroUsuCli");
        String emailUsuCli = request.getParameter("emailUsuCli");
        
        BeanUsuarioCliente beanUsuCli = new BeanUsuarioCliente();
        
        beanUsuCli.setNomeUsu_cliente(nomeUsuCli);
        beanUsuCli.setSobreNomeUsu_cliente(sobreNomeUsuCli);
        
        try{
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = sdf.parse(dataNascUsuCli);
            beanUsuCli.setDataNascUsu_cliente(date);
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        beanUsuCli.setTelefoneUsu_cliente(telefoneUsuCli);
        beanUsuCli.setEnderUsu_cliente(enderUsuCli);
        beanUsuCli.setCepUsu_cliente(cepUsuCli);
        beanUsuCli.setBairroUsu_cliente(bairroUsuCli);
        beanUsuCli.setCidadeUsu_cliente(cidadeUsu_cliente);
        beanUsuCli.setEstadoUsu_cliente(estadoUsuCli);
        beanUsuCli.setPaisUsu_cliente(paisUsuCli);
        beanUsuCli.setNumeroUsu_cliente(Integer.parseInt(numeroUsuCli));
        beanUsuCli.setEmailUsu_cliente(emailUsuCli);
        
        daoUsuCli.cadDadosUsuCliente(beanUsuCli);
        
        request.setAttribute("msgSucess", " Cadastro efetuado com Sucesso!");
        RequestDispatcher dispCad = request.getRequestDispatcher("cadUsuDados.jsp");
        dispCad.forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
