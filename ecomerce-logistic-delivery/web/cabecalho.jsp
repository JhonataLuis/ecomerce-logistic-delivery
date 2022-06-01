<%-- 
    Document   : cabecalho
    Created on : 26/01/2019, 10:53:23
    Author     : rayss
--%>
<%@page import="br.com.javabean.bean.BeanUsuarioCliente"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
            <a class="navbar-brand" href="index.jsp">BOX in BOX</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <%
                //BeanLogin beanLog = (BeanLogin) session.getAttribute("usuario");
                BeanUsuarioCliente consultDatos = (BeanUsuarioCliente) session.getAttribute("datos");
                BeanLogin beanLogin = (BeanLogin) session.getAttribute("usuariocomum");
            %>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <i class="fas fa-th-list"></i> Categorias
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"><i class="fas fa-truck-moving"></i> Caminhões </a>
                            <a class="dropdown-item text-muted" href="parceiro-empresa?action=listar"><i style="color: #EO6641" class="far fa-building"></i> Encontre Empresas</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><i class="fas fa-motorcycle"></i> Motocicletas</a>
                            <a class="dropdown-item" href="#">Bicicletas</a>
                            <a class="dropdown-item" href="#">Drones</a>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="cadastro?action=listar">Lista</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Formas de Entregas
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Caminhões</a>
                            <a class="dropdown-item" href="#">Carros</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Motocicletas</a>
                            <a class="dropdown-item" href="#">Bicicletas</a>
                            <a class="dropdown-item" href="#">Drones</a>
                             <div class="dropdown-divider"></div>
                         
                               <a class="dropdown-item" href="#">Entregadores <i class="fas fa-truck"></i></a>
                        </div>
                    </li>
                     <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Pesquisar">
                        <button class="btn btn-success my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                <!-- </ul>
                 <ul class="nav justify-end">-->
                 <%if(beanLogin != null){%>
                    
                        <li class="nav-item dropdown nav">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-user"></i> <%=beanLogin.getUsuLogin()%>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                                    <a class="dropdown-item primary" href="salvaImagem.jsp"><i class="far fa-user"></i> <%=beanLogin.getUsuLogin()%></a>

                                <a class="dropdown-item primary" href="Dados?action=consultDados&user=<%=beanLogin.getUsuLogin()%>"><i class="fas fa-dice-six"></i> Meus Dados</a>
                                <a class="dropdown-item" href="ServletPedido?numeroPagina=1&action=listarPedidosUsuario&codUser=<%=consultDatos.getIdUsu_cliente()%>"><i class="fas fa-hand-holding-usd"></i> Compras</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="fas fa-motorcycle"></i> Motocicletas</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-bicycle"></i> Bicicletas</a>
                                <a class="dropdown-item" href="#"><i class="fab fa-phoenix-squadron"></i> Drones</a>
                                 <div class="dropdown-divider"></div>
                                 <a class="dropdown-item" href="#"><i class="fas fa-info"></i> Ajuda</a>
                                 <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Logout"><i class="fas fa-sign-out-alt"></i> Sair </a>

                            </div>
                        </li>
                        
                    <%}else{%>
                        <li class="nav-item">
                            <a class="nav-link active" href="cadUsu.jsp" tabindex="-1" aria-disabled="true">Cadastrar</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link active" href="authenticar.jsp" tabindex="-1" aria-disabled="true"> <i class="fas fa-sign-in-alt"></i> ENTRAR</a>
                        </li>
                        
                    <%}%>
                    </ul>
                   
            </div>
            </div>
        </nav>
       


