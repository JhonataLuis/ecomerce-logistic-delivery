<%-- 
    Document   : editProduct
    Created on : 18/03/2019, 11:58:26
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanProducts"%>
<%@page import="br.com.javabean.bean.BeanParceCadEmpresa"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar Produto | Box in Box</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
    </head>
    <%
    BeanLogin beanLog = (BeanLogin) session.getAttribute("usuario");
                    ParceCadEmpresa beanParceEmp = (ParceCadEmpresa) session.getAttribute("empUsu");
                    Products beanProd = (Products) request.getAttribute("consultUpdate");
    %>
    <body>
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="testTable.jsp"><b>Box in</b> Box</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#"> <i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"> <i class="fas fa-list-ul"></i> Lista de Produtos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pricing</a>
                        </li>
                    </ul>

                    <ul class="nav justify-content-end">
                        <li>
                            <a href="#" class="dropdown-toggle btn btn-sm btn-outline-success" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-user"></i> <%=beanParceEmp.getNomeRepre()%> 
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#"><i class="fas fa-database"></i> Meus Dados</a>
                                    <a class="dropdown-item" href="pedidos.jsp"><i class="fas fa-retweet"></i> Pedidos Realizados</a>
                                    <a class="dropdown-item" href="#"></a>
                                    <a class="dropdown-item" href=Logout><i class="fas fa-sign-out-alt"></i> Sair</a>
                                </div>

                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="cadProduct.jsp" class="btn btn-sm btn-outline-success">CADASTRAR</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
                                <div class="container">
                                    <div class="breadcrumb">
                                        <h3>Atualizar Produto</h3>
                                    </div>
                                    <div class="card">
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
                                    <input type="text" class="form-control" name="nomeProduct" id="inputEmail4" value="<%=beanProd.getNomeProduct()%>" required placeholder="Nome do Produto">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Descrição</label>
                                    <textarea class="form-control" name="descProduct"  id="exampleFormControlTextarea1" value="<%=beanProd.getDescProduct()%>" required rows="3" placeholder="Descrição dos Produtos"></textarea>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputState">Categoria</label>
                                    <select id="inputState" class="form-control" name="catProduct"  required>
                                        <option  selected>Selecione a categoria...</option>
                                        <option>Alimentos</option>
                                        <option>Saúde e Beleza</option>
                                        <option>Eletronicos</option>
                                        <option>Ferramentas</option>
                                        <option>Parafusos e etc.</option>
                                        <option>Móveis Planejados</option>
                                        <option>Construtoras</option>
                                        <option>Aluguel de Equipamentos</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Preço</label>
                                <input type="text" class="form-control" name="precoProduct" value="<%=beanProd.getPrecoProduct()%>" id="inputAddress" placeholder="R$ preço do prodtuto">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Detalhes</label>
                                <textarea class="form-control" name="detalProduct" id="exampleFormControlTextarea1" rows="3" placeholder="Detalhes dos Produtos"></textarea>
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
