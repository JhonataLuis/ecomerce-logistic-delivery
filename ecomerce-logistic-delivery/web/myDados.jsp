<%-- 
    Document   : myDados
    Created on : 22/03/2019, 10:45:49
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanUsuarioCliente"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dados Cadastrais | Box in Box</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <body>
        <%
            BeanLogin beanLogin = (BeanLogin) session.getAttribute("usuariocomum");
            BeanUsuarioCliente beanUsuCli = (BeanUsuarioCliente) request.getAttribute("consultar");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #5F5CCE; color: #ffffff">
            <div class="container">
                <a class="navbar-brand" href="index.jsp" style="color: #ffffff"><h3><b>Box in</b> Box</h3></a>
                <div class="dropdown">
                    <button class="btn dropdown-toggle" style="color: #ffffff" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-th-list"></i> Categorias
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
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
                            <button class="btn dropdown-toggle justify-content-end" style="color: #ffffff" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-user"></i> <%=beanLogin.getUsuLogin()%>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item primary" href="Dados?action=consultDados&user=<%=beanLogin.getUsuLogin()%>"><i class="fas fa-dice-six"></i> Meus Dados</a>
                                <a class="dropdown-item" href=""><i class="fas fa-hand-holding-usd"></i> Compras</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="fas fa-motorcycle"></i> Motocicletas</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-bicycle"></i> Bicicletas</a>
                                <a class="dropdown-item" href="#"><i class="fab fa-phoenix-squadron"></i> Drones</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Logout"><i class="fas fa-sign-out-alt"></i> Sair </a>
                            </div>
                        </div>
                        <!--<li class="nav-item">
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i> 0 </a>
                        </li> -->

                    </ul>
                    <%}else{%>
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="cadUsu.jsp" style="color: #ffffff"> <i class="far fa-user"></i> CADASTRAR  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="authenticar.jsp" style="color: #ffffff"> <i class="far fa-user"></i> ENTRAR  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i>  <span class="badge badge-primary badge-pill">14</span></a>
                        </li> 
                    </ul>
                    <%}%>
                </div>

            </div>
        </nav>
        <div class="container-fluid">
            <div class="container">
                <div class="breadcrumb">
                    <h4>Dados da Conta</h4>
                </div>
                <%if(beanUsuCli != null){%>
                <ul class="list-group-flush">
                    <li class="list-group-item">
                        <h5 class="mb-1">Nome e Sobrenome</h5>
                        <p><%=beanUsuCli.getNomeUsu_cliente()%> <%=beanUsuCli.getSobreNomeUsu_cliente()%></p>
                    </li>
                    <li class="list-group-item">
                        <h5 class="mb-1">Usuário</h5>
                        <small><%=beanUsuCli.getEmailUsu_cliente()%></small>
                    </li>
                    <li class="list-group-item">
                        <h5 class="mb-1">E-mail</h5>
                        <small><%=beanUsuCli.getEmailUsu_cliente()%></small>
                    </li>
                    <li class="list-group-item">
                        <h5 class="mb-1">Telefone</h5>
                        <small><%=beanUsuCli.getTelefoneUsu_cliente()%></small>
                    </li>
                </ul>
            </div>
           
            <div class="container">
                <div class="breadcrumb">
                    <h4>Endereços</h4>
                </div>
                <ul class="list-group-flush">
                    <li class="list-group-item">
                        <h5 class="mb-1"><%=beanUsuCli.getEnderUsu_cliente()%> , <%=beanUsuCli.getNumeroUsu_cliente()%></h5>
                        <small><%=beanUsuCli.getCepUsu_cliente()%> - <%=beanUsuCli.getCidadeUsu_cliente()%></small>
                    </li>
                    <li class="list-group-item">
                        <h5 class="mb-1">Usuário</h5>
                        <small>3 days ago</small>
                    </li>
                </ul>
            </div>
                <%}else{%> 
                    <div class="col-md-6 col-xs-6">
                <div class="card mb-3  shadow" style="max-width: 540px;">
                    <div class="row no-gutters">

                        <div class="card-body text-center">
                            <h1><i class="far fa-trash-alt" style="color: #F4841A"></i><i class="fas fa-box-open" style="color: #004C56"></i></h1>
                            <h5 class="card-title text-muted">Não há nenhuma informação de dados informativos!</h5>
                            <p class="card-text text-muted"></p>
                            <p class="card-text text-muted" style="color: #004C56">É preciso cadastrar os dados informativos para aparecer aqui e realizar compras click <a href="cadUsuDados.jsp" class="nav-item">aqui</a></p>
                        </div>

                    </div>
                </div>
            </div>  
                <%}%>
            <div class="container">
                <div class="breadcrumb">
                    <h4>Cartões de crédito</h4>
                </div>
                <ul class="list-group-flush">
                    <li class="list-group-item">
                        <h5 class="mb-1">Rua marrocos 208</h5>
                        <small>3 days ago</small>
                    </li>
                    <li class="list-group-item">
                        <h5 class="mb-1">Usuário</h5>
                        <small>3 days ago</small>
                    </li>
                </ul>
            </div>

        </div>

    </body>
</html>
