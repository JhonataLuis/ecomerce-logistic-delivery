<%-- 
    Document   : mostraProdutosEmp
    Created on : 17/02/2019, 12:33:47
    Author     : rayss
--%>
<%@page import="java.util.List"%>
<%@page import="br.com.javabean.bean.BeanProducts"%>
<%@page import="br.com.javabean.bean.BeanParceCadEmpresa"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Produtos das Empresas | Box in Box</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <%
        BeanLogin beanLogin = (BeanLogin) session.getAttribute("usuariocomum");
    %>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #5F5CCE; color: #ffffff">
            <div class="container">
                <a class="navbar-brand" href="index.jsp" style="color: #ffffff"><h3><b>Box in</b> Box</h3></a>
                <div class="dropdown">
                    <button class="btn dropdown-toggle" style="color: #ffffff" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-th-list"></i> Categorias
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Alimentos</a>
                        <a class="dropdown-item" href="#">Eletronicos</a>
                        <a class="dropdown-item" href="#">Ferragens</a>
                        <a class="dropdown-item" href="#">Ferragens</a>
                        <a class="dropdown-item" href="#">Ferragens</a>
                        <a class="dropdown-item" href="#">Ferramentas</a>
                        <a class="dropdown-item" href="#">Ferragens</a>
                        <a class="dropdown-item" href="#">Outros</a>
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

        <div class="container mt-4">
            <%
            ParceCadEmpresa consultEmp = (ParceCadEmpresa) request.getAttribute("consultEmp");
                            if (consultEmp != null) {
            %>

            <div class="card shadow" style="max-width: 25rem;">
                <div class="card-body">
                     <img src="<%=consultEmp.getFilePart()%>" class="img-responsive rounded mx-auto d-block" width="100px" height="100px">
                    <h3 class="card-title"><%=consultEmp.getNomeEmp()%></h3>
                    <h6 class="card-subtitle mb-2 text-muted"></h6>
                    <p class="card-text text-muted">$ <%=consultEmp.getRamoEmp()%></p>
                    <a href="#" class="card-link breadcrumb">20-30min<b>-R$ 5 delivery</b></a>
                </div>
            </div>
            <%}%>
            <div class="breadcrumb">
                <h3>Produtos</h3>
            </div>
           
            <div class="row">
                <c:forEach var="listar" items="${listandoProdutos}">

                    <div class="col-sm-6">
                        <a href="products?action=consultar&codProduct=${listar.idProduct}" class="nav-link active" >
                            <div class="card mb-3  shadow" style="max-width: 540px;">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img src="${listar.imgProduct}" class="card-img" alt="..." width="200" height="180">
                                    </div>
                                           
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title text-muted">${listar.nomeProduct}</h5>
                                            <p class="card-text text-muted">${listar.descProduct}</p>
                                            <p class="card-text" ><small style="color: #235D3A"><fmt:formatNumber type="currency" currencySymbol="R$" value="${listar.precoProduct}"></fmt:formatNumber></small></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>  

                </c:forEach>
            </div>
            <%
            List<Products> listar = (List<Products>) request.getAttribute("listandoProdutos");
                            if (listar.size() <= 0) {
            %>
            <div class="col-md-6 col-xs-6">
                <div class="card mb-3  shadow" style="max-width: 540px;">
                    <div class="row no-gutters">

                        <div class="card-body text-center">
                            <h1><i class="far fa-trash-alt" style="color: #F4841A"></i><i class="fas fa-box-open" style="color: #004C56"></i></h1>
                            <h5 class="card-title text-muted">Os produtos da empresa não estão disponiveis ainda!</h5>
                            <p class="card-text text-muted"></p>
                            <p class="card-text" ></p>
                        </div>

                    </div>
                </div>
            </div>  
            <%}%>
        </div>
    </body>
</html>
