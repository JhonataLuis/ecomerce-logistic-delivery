<%-- 
    Document   : listaUsu
    Created on : 26/01/2019, 11:42:33
    Author     : rayss
--%>
<%@page import="java.util.List"%>
<%@page import="br.com.javabean.bean.BeanUsuario"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de usuarios cadastrados</title>
    </head>
    <c:import url="cabecalho.jsp"/>
    <body style="background: #AAC9CE">
         <div class="container">
        <h2>Lista de usuarios</h2>
       
            <div class="card shadow-sm p-3 mb-5 bg-white rounded">
                <table class="table table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">Código</th>
                            <th scope="col">Login</th>
                            <th scope="col">Password</th>
                            <th scope="col">Data</th>
                        </tr>
                    </thead>
                    
                    <c:forEach var="linha" items="${listando}">
                    <tbody>
                        <tr>
                            <th scope="row"> ${linha.codUsu}</th>
                            <td> ${linha.login_usu}</td>
                            <td> ${linha.senha_usu}</td>
                            <td> <fmt:formatDate value="${linha.data_cad}" pattern="dd/MM/yyyy HH:mm:ss"></fmt:formatDate></td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
            </div>
                
                <nav aria-label="...">
                    <ul class="pagination justify-content-center">
                      <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active" aria-current="page">
                        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                      </li>
                    </ul>
                  </nav>   
        </div>
    </body>
</html>
