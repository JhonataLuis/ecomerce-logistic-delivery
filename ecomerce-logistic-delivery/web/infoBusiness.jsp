<%-- 
    Document   : infoBusiness
    Created on : 27 de abr de 2019, 18:16:14
    Author     : user
--%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@page import="br.com.javabean.bean.BeanParceCadEmpresa"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informações da Empresa | Box in Box</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </head>

    <body>
         <%
         BeanLogin beanLog = (BeanLogin) session.getAttribute("usuario");
                     ParceCadEmpresa beanParceEmp = (ParceCadEmpresa) session.getAttribute("empUsu");
         %>


        <nav class="navbar navbar-expand-lg navbar-light" style="background: #29558C">
            <div class="container">
                <a class="navbar-brand" href="testTable.jsp" style="color: #F6F3EE"><b>Box in</b> Box</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <!--<li class="nav-item">
                            <a class="nav-link" href="#"> <i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">  Lista Produtos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="far fa-money-bill-alt"></i> Pricing</a>
                        </li>-->
                    </ul>

                    <ul class="nav justify-content-end">
                       <!-- Example single danger button -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                             <i class="far fa-user"></i> <%=beanParceEmp.getNomeRepre()%>
                          </button>
                          <div class="dropdown-menu">
                            <a class="dropdown-item" href="#"><i class="fas fa-database"></i> Meus Dados</a>
                            <a class="dropdown-item" href="pedidos.jsp"><i class="fas fa-retweet"></i> Pedidos Realizados</a>
                            <a class="dropdown-item" href="#"></a>
                            <a class="dropdown-item" href="#"><i class="fas fa-building"></i> Info Business</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                            <a class="dropdown-item" href=Logout><i class="fas fa-sign-out-alt"></i> Sair</a>
                          </div>
                        </div>
                        <li>
                           
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-sm btn-success" href="#" title="<%=beanParceEmp.getNomeEmp()%>"> <i class="far fa-building"></i> <%=beanParceEmp.getNomeEmp()%></a>
                        </li>
                         <li class="nav-item">
                            <a class="btn btn-sm btn-success" href="products?action=lista&user=<%=beanLog.getUsuLogin()%>" title="Lista de Produtos">
                                <div class="">
                                    <i class="fas fa-list-ul"></i> Lista
                                </div>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

                                <div class="container">
                                    <h3>Informações da Empresa</h3>
                                    
                                    <%if(request.getAttribute("message") != null){%>
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <strong>Sucesso! </strong> <c:out value="message"/>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                              <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    <%}%>
                                    
                                    <div class="">
                                        <img src="<%=beanParceEmp.getFilePart()%>" class="rounded float-left" alt="..." width="100px" height="100px">
                                    </div>
                                </div>
        
    </body>
</html>
