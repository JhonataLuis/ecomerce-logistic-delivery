<%-- 
    Document   : cabecalho2
    Created on : 25/03/2019, 10:28:36
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cabeçalho | Box in Box</title>
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <%
        BeanLogin beanLogin = (BeanLogin) session.getAttribute("usuariocomum");
    %>
    <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #5F5CCE; color: #ffffff">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">BOX in BOX</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul style="background-color: #5F5CCE; color: #ffffff" class="nav justify-content-center">
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="fas fa-th-list"></i> Categorias
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                              <a class="dropdown-item" href="#">Action</a>
                              <a class="dropdown-item" href="#">Another action</a>
                              <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                          </div>
                        
                    </ul>
                </div>
                         <ul class="nav justify-content-end">
                            <%if (beanLogin != null) {%>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-user"></i> <%=beanLogin.getUsuLogin()%>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item primary" href="myDados.jsp" style="color: #5F5CCE"><i class="fas fa-dice-six"></i> Meus Dados</a>
                                <a class="dropdown-item" href="#" style="color: #5F5CCE"><i class="fas fa-shopping-bag"></i> Compras</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" style="color: #5F5CCE"><i class="fas fa-motorcycle"></i> Motocicletas</a>
                                <a class="dropdown-item" href="#" style="color: #5F5CCE"><i class="fas fa-bicycle"></i> Bicicletas</a>
                                <a class="dropdown-item" href="#" style="color: #5F5CCE"><i class="fab fa-phoenix-squadron"></i> Drones</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Logout" style="color: #5F5CCE"><i class="fas fa-sign-out-alt"></i> Sair </a>
                            </div>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                            <a class="nav-link" href="cadUsu.jsp" style="color: #ffffff"> <i class="far fa-user"></i> CADASTRAR  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="authenticar.jsp" style="color: #ffffff"> <i class="far fa-user"></i> ENTRAR  </a>
                        </li>
                        <%}%>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i> 0 </a>
                        </li> 
                            
                          </ul>
            </div>
        </nav>
                        <body>
    
