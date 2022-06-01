<%-- 
    Document   : testDashboard
    Created on : 07/02/2019, 16:28:46
    Author     : rayss
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Usuário da Epresa Parceira | Box in Box</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/4jquery.dataTables.min.js"></script>
        <script src="js/dataTables.bootstrap4.min.js"></script>

        <link href="css/dataTables.bootstrap4.min.css">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/offcanvas/">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="css/offcanvas.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
            <a class="navbar-brand mr-auto mr-lg-0" href="#"><b>Box in Box</b></a>
            <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Dashboard <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Notifications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Switch account</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="lista-entregadores?action=listartodospedidos&numeroPagina=1"><i class="fas fa-list-ul"></i> Todas as compras</a>
                            <a class="dropdown-item" href="#"><i class="fas fa-users"></i> Usuários comun na Plataforma</a>
                            <a class="dropdown-item" href="cadUsuEmpresa.jsp"><i class="fas fa-user-tie"></i> Cadastro Usuário da Empresa </a>
                            <a class="dropdown-item" href="lista-entregadores?action=listaentregadores"><i class="fas fa-shipping-fast"></i> Todos Entregadores</a>
                        </div>
                    </li>


                    <!-- Example single danger button -->
                    <li class="btn-group">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bell"></i>
                            <span id="listado" class="badge badge-light"></span>
                        </a>
                        <c:if test="notifi != null">
                            <div class="border-info m-3 dropdown-menu">
                                <div>
                                    <table class="table table-sm table-hover">
                                        <thead>
                                            <tr>
                                                <th>Notifications</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="notifi" items="${listarnotification}">
                                            <tr>
                                                <td>${notifi.titleNotifi}</td>  
                                                <td><a id="deletar" class="nav-item" href="ServletNotification?action=excluir&idNotifi=${notifi.idNotifi}" title="Excluir Notificação">...</a></td>
                                            </tr>
                                            <tr>
                                                <td>${notifi.descNotifi}</td>
                                            </tr>
                                        </c:forEach> 
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </li>

                </ul>

                <form class="form-inline my-2 my-lg-0">
                    <button class="btn btn-sm btn-outline-success my-2 my-sm-0" type="submit"><i class="fas fa-user-alt"></i></button>
                </form>
            </div>
        </nav>

        <div class="nav-scroller bg-white shadow-sm">
            <nav class="nav nav-underline">
                <a class="nav-link active" href="#">Dashboard</a>
                <a class="nav-link" href="#">
                    Friends
                    <span class="badge badge-pill bg-light align-text-bottom">27</span>
                </a>
                <a class="nav-link" href="#">Explore</a>
                <a class="nav-link" href="#">Suggestions</a>
                <a class="nav-link" href="#">Link</a>
                <a class="nav-link" href="#">Link</a>
                <a class="nav-link" href="#">Link</a>
                <a class="nav-link" href="#">Link</a>
                <a class="nav-link" href="#">Link</a>
                <a class="nav-link" href="#">
                    Clientes
                    <span id="contador" class="badge badge-success bg-purple align-text-bottom"></span>
                    <div id="listado"></div>

                </a>
            </nav>
        </div>
        <main role="main" class="container">
            <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                <img class="mr-3" src="/docs/4.3/assets/brand/bootstrap-outline.svg" alt="" width="48" height="48">
                <div class="lh-100">
                    <h6 class="mb-0 text-white lh-100">Bootstrap</h6>
                    <small>Since 2011</small>
                </div>
            </div>


            <div class="container">
                <div class="">
                    <%if (request.getAttribute("sucess") != null) {%>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Parabéns!</strong> <c:out value="${sucess}"/>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%}%>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="card-title">
                                    <h3 style="color: #424249"><b>Cadastro de Acesso da Empresa</b></h3>   
                                </div>

                                <form id="usuarioEmpresa" action="cadastroUsuEmp" method="POST">
                                    <div class="form-group row">
                                        <label for="" class="col-sm-4 col-form-label">Código</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="" name="usuCodigo" readonly="readonly" placeholder="Código">
                                        </div>

                                    </div>
                                    <div class="form-group row">
                                        <label for="" class="col-sm-4 col-form-label">Login</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="" name="loginUserEmp" required placeholder="Login">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="" class="col-sm-4 col-form-label">Nome</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="" name="nomeUserEmp" required placeholder="Nome usuário">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="" class="col-sm-4 col-form-label">Telefone</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="" name="telefone" required placeholder="Telefone () ---- ----">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword3" class="col-sm-4 col-form-label">Password</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="" name="senhaUserEmp" required placeholder="Password">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword3" class="col-sm-4 col-form-label">Data</label>
                                        <div class="col-sm-8">
                                            <%
                                                Date dataCadUserEmp = new Date();
                                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                                String dataStr = sdf.format(dataCadUserEmp);
                                            %>
                                            <input type="text" class="form-control" id="" name="dataCadUserEmp" value="<%=dataStr%>" placeholder="Data">
                                            <%
                                                out.println("Data " + dataCadUserEmp);
                                            %>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-10">
                                            <button onclick="agregar()" type="submit" class="btn btn-primary">CONFIRMAR <i class="fas fa-arrow-right"></i></button>
                                            <button type="reset" class="btn btn-secondary">LIMPAR <i class="fas fa-broom"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>


                        </div>

                    </div>
                    <div class="col">

                        <table id="example" class="table table-hover table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Login</th>
                                    <th>Fone</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <c:forEach var="listausuemp" items="${listarusuarioempresa}">
                            <tbody>
                                <tr>
                                    <td>0${listausuemp.codUserEmp}</td>
                                    <td>${listausuemp.nomeUserEmp}</td>
                                    <td>System Architect</td>
                                    <td>${listausuemp.loginUserEmp}</td>
                                    <td>${listausuemp.telefone}</td>
                                    <td><fmt:formatDate value="${listausuemp.dataCadUserEmp}"></fmt:formatDate></td>
                                </tr>
                            </tbody>
                            </c:forEach>
                            <tfoot>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Login</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>


                </div>

            </div>
        </main>
        <script src="js/controlador.js"></script>
        <script type="text/javascript">

                                                $(document).ready(function () {
                                                    $('#example').DataTable();
                                                });
        </script>

    </body>

</html>
