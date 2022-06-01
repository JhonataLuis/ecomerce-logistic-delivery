<%-- 
    Document   : listaEmpresa
    Created on : 08/02/2019, 15:50:51
    Author     : rayss
--%>
<%@page import="br.com.javabean.bean.BeanParceCadEmpresa"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Encontre Empresas cadastradas | Box in Box</title>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <%
        BeanLogin beanLogin = (BeanLogin) session.getAttribute("usuariocomum");
    %>
    <body style="background: #F0F0F0">
        <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #5F5CCE; color: #ffffff">
            <div class="container">
                <a class="navbar-brand" href="index.jsp" style="color: #ffffff"><h3><b>Box in</b> Box</h3></a>
                <div class="dropdown">
                    <button class="btn dropdown-toggle" style="color: #ffffff" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-th-list"></i> Categorias
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Alimentos</a>
                      <a class="dropdown-item" href="#">Móveis Planejados</a>
                      <a class="dropdown-item" href="#">Técnologias</a>
                       <a class="dropdown-item" href="#">Alimentos</a>
                      <a class="dropdown-item" href="#">Móveis Planejados</a>
                      <a class="dropdown-item" href="#">Técnologias</a>
                    </div>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">

                    </ul>
                    <%if (beanLogin != null) {%>
                    <ul class="nav justify-content-end">

                        <div class="dropdown">
                            <button class="btn dropdown-toggle" style="color: #ffffff" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-user"></i> <%=beanLogin.getUsuLogin()%>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                   <a class="dropdown-item primary" href="Dados?action=consultDados&user=<%=beanLogin.getUsuLogin()%>"><i class="far fa-user"></i> <%=beanLogin.getUsuLogin()%></a>
                                <a class="dropdown-item primary" href="Dados?action=consultDados&user=<%=beanLogin.getUsuLogin()%>"><i class="fas fa-dice-six"></i> Meus Dados</a>
                                <a class="dropdown-item" href=""><i class="fas fa-hand-holding-usd"></i> Compras</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="fas fa-motorcycle"></i> Motocicletas</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-bicycle"></i> Bicicletas</a>
                                <a class="dropdown-item" href="#"><i class="fab fa-phoenix-squadron"></i> Drones</a>
                                <div class="dropdown-divider"></div>
                                   <a class="dropdown-item" href="#"><i class="fas fa-info"></i> Ajuda</a>
                                <a class="dropdown-item" href="Logout"><i class="fas fa-sign-out-alt"></i> Sair </a>
                            </div>
                        </div>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i>  <span class="badge badge-primary badge-pill">14</span></a>
                        </li> 

                    </ul>
                    <%} else {%>
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="cadUsu.jsp" style="color: #ffffff"> <i class="far fa-user"></i> CADASTRAR  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="authenticar.jsp" style="color: #ffffff"> <i class="far fa-user"></i> ENTRAR  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i> 0 </a>
                        </li> 
                    </ul>
                    <%}%>
                </div>

            </div>
        </nav>

        <div class="container">
            <h1 class="text-muted">Empresas (Restaurantes, Auto peças etc.) </h1>

            <div class="row">
                <c:forEach var="listar" items="${listandoEmpresa}">
                    <div class="col-sm-6 mb-3">
                        <a href="parceiro-empresa?action=produtosEmpresa&codParceVend=${listar.codParceVend}&idImgLogo=${listar.idImgLogo}" class="nav-link text-muted">
                            <div class="card shadow-sm">
                                <c:if test="${listar.filePart}">
                                    <div class="container">
                                        <img src="imagens/logo.png" class="img-responsive img-circle shadow" width="100px" height="100px">
                                    </div>
                                </c:if>
                                <div class="container">
                                    <!--<img src="imagens/logo.png" class="img-responsive" width="100px" height="100px">-->
                                     <img src="${listar.filePart}" class="img-responsive" width="100px" height="100px">
                                    <!--<input type="text" value="${listar.idImgLogo}" disabled>-->
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${listar.nomeEmp}</h5>
                                    <label> ${listar.ramoEmp} Pizzas,pratos,burguers</label>
                                    <p class="text-muted">(104)</p>
                                    <label class="breadcrumb" style="color: #0497df"><b>45-60 min-</b>R$5 delivery <i class="fas fa-truck"></i></label>

                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>

        </div>
    </body>
</html>
