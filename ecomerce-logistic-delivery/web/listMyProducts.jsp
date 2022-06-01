<%-- 
    Document   : listMyProducts
    Created on : 14/03/2019, 10:09:22
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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Meus Produtos | Box in Box</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <style type="text/css">
            div, #div1 {
                   
                   /* text-overflow:ellipsis;*/
                   
            }
        </style>
    </head>
    <body>
        <%
        BeanLogin beanLog = (BeanLogin) session.getAttribute("usuario");
                    ParceCadEmpresa beanParceEmp = (ParceCadEmpresa) session.getAttribute("empUsu");
                    //BeanProducts beanProd = (BeanProducts) request.getAttribute("consultUpdate");
        %>


        <nav class="navbar navbar-expand-lg navbar-light" style="background: #29558C">
            <div class="container">
              <h3><a class="navbar-brand" href="testTable.jsp" style="color: #F6F3EE"><b>Box in</b> Box</a></h3>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <img src="<%=beanParceEmp.getFilePart()%>" class="img-responsive img-thumbnail img-fluid" width="80px" height="80px">
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
                            <a class="dropdown-item" href="pedidos.jsp"><i class="fas fa-retweet"></i> Pedidos Realizados</a>
                            <a class="dropdown-item" href="#"></a>
                             <a class="dropdown-item" href="#">Separated link</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><i class="fas fa-building"></i> Info Business</a>
                            <a class="dropdown-item" href=Logout><i class="fas fa-sign-out-alt"></i> Sair</a>
                          </div>
                        </div>
                        
                        <li class="nav-item">
                            <a href="#" class="btn btn-sm btn-success"> <i class="far fa-building"></i> <%=beanParceEmp.getNomeEmp()%></a>
                        </li>
                        <li class="nav-item">
                            <a href="cadProduct.jsp" class="btn btn-sm btn-success" title="Novo Produduto"> <i class="far fa-plus-square"></i> NOVO</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
        <div class="container">
            <div class="breadcrumb">
                <h2>Meus Produtos</h2>
            </div>

           
            <div class="card">
                <div class="">
                    <table class="table table-borderless table-hover table-responsive">
                        <thead style="background: #81A0AA; color: #F6F3EE">
                            <tr style="color: white">
                                <th scope="col">Código</th>
                                <th scope="col">Produto</th>
                                <th scope="col">Nome</th>
                                <th scope="col">Descrição</th>
                                <th scope="col">Categoria</th>
                                <th scope="col">Preço</th>
                                <th scope="col" colspan="2">Ações</th>
                            </tr>
                        </thead>
                        <c:forEach var="linha" items="${listaProducts}">
                            <tbody>
                                <tr>
                                    <th scope="row">00${linha.idProduct}</th>
                                    <td><img class="rounded border" src="${linha.imgProduct}" width="80" height="80" title="${linha.imgProduct}"></td>
                                    <td>${linha.nomeProduct}</td>
                                    <td id="div1">${linha.descProduct}</td>
                                    <td>${linha.catProduct}</td>
                                    <td><fmt:formatNumber value="${linha.precoProduct}" type="currency"></fmt:formatNumber></td>
                                    <td><a href="products?action=consultaUpdate&codProduct=${linha.idProduct}" class="btn btn-sm btn-outline-warning" data-toggle="modal" data-target="#exampleModal${linha.idProduct}" title="Atualizar produto"><i class="far fa-edit"></i></a></td>
                                    <td><a href="products?action=delete&codProduct=${linha.idProduct}" class="btn btn-sm btn-outline-danger" title="Excluir produto"><i class="far fa-trash-alt"></i></a></td>
                                </tr>
                            </tbody>
                          
                            <!-- Inicio Modal -->
                            <div class="modal fade bd-example-modal-lg" id="exampleModal${linha.idProduct}" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-scrollable" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-center" id="exampleModalScrollableTitle">Atualizar Produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="card-body">
                                                <div class="container">
                                                    <form action="products_acao" method="GET">
                                                        <div class="form-group">
                                                            <div class="form-group">
                                                                <label for="inputEmail4">Código Produto</label>
                                                                <input type="text" class="form-control" name="idProduct" value="${linha.idProduct}" required placeholder="Nome do Produto">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="inputEmail4">Nome do Produto</label>
                                                                <input type="text" class="form-control" name="nomeProduct" value="${linha.nomeProduct}" required placeholder="Nome do Produto">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleFormControlTextarea1">Descrição</label>
                                                                <textarea class="form-control" name="descProduct" required rows="3" placeholder="Descrição dos Produtos">${linha.descProduct}</textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="inputState">Categoria</label>
                                                                <select id="inputState" class="form-control" name="catProduct" required>
                                                                    <option value="${linha.catProduct}"  selected>Selecione a categoria...</option>
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
                                                            <input type="text" class="form-control" name="precoProduct" value="${linha.precoProduct}" id="inputAddress" placeholder="R$ preço do prodtuto">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleFormControlTextarea1">Detalhes</label>
                                                            <textarea class="form-control" name="detalProduct" id="exampleFormControlTextarea1" rows="3" placeholder="Detalhes dos Produtos">${linha.detalProduct}</textarea>
                                                        </div>
                                                        
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-eraser"></i> Close</button>
                                            <button type="submit" class="btn btn-success"> <i class="fas fa-edit"></i> Salvar Atualização</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                                                            <!--FIM DO MODAL-->
                        </c:forEach>
                    </table>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#"  class="sr-only">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>


           <%
           List<Products> listar = (List<Products>) request.getAttribute("listaProducts");
                           if(listar.size() <= 0){
           %>
             <div class="col-md-6 col-xs-6">
                <div class="card mb-3  shadow" style="max-width: 540px;">
                    <div class="row no-gutters">

                        <div class="card-body text-center">
                            <h1><i class="far fa-trash-alt" style="color: #F4841A"></i><i class="fas fa-box-open" style="color: #004C56"></i></h1>
                            <h5 class="card-title text-muted">Não há Produtos cadastrados, quando estivem disponiveis apareceram aqui!</h5>
                            <p class="card-text text-muted"></p>
                            <p class="card-text text-muted" style="color: #004C56">Para adicionar Produtos click <a href="cadProduct.jsp" class="nav-item">aqui</a></p>
                        </div>

                    </div>
                </div>
            </div>  
            <%}%>

        </div>
            
            
    </body>
</html>
