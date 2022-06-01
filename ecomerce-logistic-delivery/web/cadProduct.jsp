<%-- 
    Document   : cadProduct
    Created on : 18/02/2019, 16:24:09
    Author     : rayss
--%>
<%@page import="br.com.javabean.bean.BeanParceCadEmpresa"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastro de produtos</title>
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
               <h3><a class="navbar-brand" href="testTable.jsp" style="color: #F6F3EE"><b>Box in</b> Box</a></h3>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <img src="<%=beanParceEmp.getFilePart()%>" class="img-responsive img-thumbnail img-fluid" width="80px" height="10px">
                    </ul>

                    <ul class="nav justify-content-end">
                       <!-- Example single danger button -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                             <i class="far fa-user"></i> <%=beanParceEmp.getNomeRepre()%>
                          </button>
                          <div class="dropdown-menu">
                               <a class="dropdown-item" href="salvaImgBusin.jsp" title="Alterar ou Adicionar imagem"><i class="far fa-user"></i> <%=beanLog.getUsuLogin()%></a>
                            <a class="dropdown-item" href="#"><i class="fas fa-database"></i> Meus Dados</a>
                            <a class="dropdown-item" href="ServletPedido?action=pedidos&codParceVend=<%=beanParceEmp.getCodParceVend()%>"><i class="fas fa-retweet"></i> Pedidos Realizados</a>
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
            <%if (request.getAttribute("sucess") != null) {%>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong><i class="far fa-check-circle"></i> Parabéns! </strong> <c:out value="${sucess}"/>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%}%>
            <%if(request.getAttribute("msgUpdateProduct") != null){%>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong><i class="far fa-check-circle"></i> Parabéns!</strong> <c:out value="${msgUpdateProduct}"/>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
                <%}%>
                <%if(request.getAttribute("msgExcProduct") != null){%>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong><i class="fas fa-exclamation-triangle"></i> Atenção!</strong> <c:out value="${msgExcProduct}"/>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
                <%}%>
            <div class="breadcrumb">
                <h2>Cadastro de Produtos</h2>
            </div>
            <div class="card shadow">
                <div class="card-body">
                    <div class="container">
                        <form action="products" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">ID USUÁRIO LOGADO</label>
                                    <input type="text" class="form-control" name="loginUsuEmp" value="<%=beanLog.getUsuLogin()%>" id="inputEmail4" required placeholder="Nome do Produto">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">EMPRESA DO PARCEIRO <i class="far fa-building"></i></label>
                                    <input type="text" class="form-control" name="codParceVend" value="<%=beanParceEmp.getCodParceVend()%>" id="inputEmail4" required placeholder="Nome do Produto">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Nome do Produto</label>
                                    <input type="text" class="form-control" name="nomeProduct" id="inputEmail4" required placeholder="Nome do Produto">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Descrição</label>
                                    <textarea class="form-control" name="descProduct" id="exampleFormControlTextarea1" required rows="3" placeholder="Descrição dos Produtos"></textarea>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputState">Categoria</label>
                                    <select id="inputState" class="form-control" name="catProduct" required>
                                        <option selected>Selecione a categoria...</option>
                                        <option> Alimentos</option>
                                        <option>Automação</option>
                                        <option> Saúde e Beleza</option>
                                        <option> Eletronicos</option>
                                        <option>Ferramentas</option>
                                        <option>Parafusos e etc.</option>
                                        <option>Robótica</option>
                                        <option> Móveis Planejados</option>
                                        <option>Construtoras</option>
                                        <option>Aluguel de Equipamentos</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Preço</label>
                                <input type="text" class="form-control" name="precoProduct" id="inputAddress" required placeholder="R$ preço do prodtuto">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Detalhes</label>
                                <textarea class="form-control" name="detalProduct" id="exampleFormControlTextarea1" rows="3" placeholder="Detalhes dos Produtos" required></textarea>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" name="imgProduct" id="customFile">
                                <label class="custom-file-label" for="customFile">Imagem do Produto</label>
                            </div>
                    </div>
                </div>
                <br>
                <button type="submit" class="btn btn-success">CADASTRAR <i class="fas fa-arrow-right"></i></button>
                </form>

            </div>
        </div>
    </body>
</html>

