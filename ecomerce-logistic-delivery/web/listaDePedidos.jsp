<%-- 
    Document   : listaDePedidos.jsp
    Created on : 20/06/2019, 12:44:41
    Author     : user
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Box in Box | Dashboard administrador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    
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
  <body class="bg-light">
      
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
  <a class="navbar-brand mr-auto mr-lg-0" href="#">Box in Box</a>
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
             <a class="dropdown-item" href="cadastroUsuEmp?action=listausuariosempresa"><i class="fas fa-user-tie"></i> Cadastro Usuário da Empresa </a>
          <a class="dropdown-item" href="lista-entregadores?action=listaentregadores"><i class="fas fa-shipping-fast"></i> Todos Entregadores</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
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
   
  </nav>
</div>

<main role="main" class="container">
  <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
    <img class="mr-3" src="/docs/4.3/assets/brand/bootstrap-outline.svg" alt="" width="48" height="48">
    <div class="lh-100">
      <h6 class="mb-0 text-white lh-100">Box in Box</h6>
      <small>Since 2011</small>
    </div>
  </div>

  

  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h6 class="border-bottom border-gray pb-2 mb-0">Pedidos de Compras</h6>
    
    <c:forEach var="listar" items="${listartodospedidos}" varStatus="st">
    <div class="media text-muted pt-3">
      <!--<button class="btn-primary bd-placeholder-img mr-2 rounded" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32" fill="#6f42c1"><img src="" class="img-rounded" width="32" height="32" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"></button>-->
      <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>
      <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
        <div class="d-flex justify-content-between align-items-center w-100">
          <strong class="text-gray-dark">${listar.nomeUsuCli}</strong>
          <strong class="text-gray-dark">#${listar.idPedido}</strong>
          <strong class="text-gray-dark">${listar.idProduct}</strong>
          <strong class="text-gray-dark">${listar.nomeEmp}</strong>
         
          <strong class="text-gray-dark">
              <div class="">
                   <!--<select class="alert alert-warning" name="statusPedido">-->
                       <c:choose>
                           <c:when test="${listar.statusPedido == 'Retirar Pedido'}">
                               <button type="button" class="btn btn-sm btn-success">${listar.statusPedido} <i class="fas fa-truck"></i></button>
                           </c:when>
                               <c:when test="${listar.statusPedido == 'Pedido em Andamento'}">
                               <button type="button" class="btn btn-sm btn-info">${listar.statusPedido} <i class="fas fa-archive"></i></button>
                           </c:when>
                               <c:when test="${listar.statusPedido == 'Em Preparo'}">
                                  <button type="button" class="btn btn-sm btn-secondary">${listar.statusPedido} <i class="fas fa-luggage-cart"></i></button>
                           </c:when>
                           <c:when test="${listar.statusPedido == 'Em Separação'}">
                                <button type="button" class="btn btn-sm btn-primary">${listar.statusPedido} <i class="fas fa-people-carry"></i></button>
                           </c:when>
                           <c:when test="${listar.statusPedido == 'Produgo Pronto'}">
                                <button type="button" class="btn btn-sm btn-primary">${listar.statusPedido} <i class="fas fa-boxes"></i></button>
                           </c:when>
                       </c:choose>
                      <!--<option value="">${listar.statusPedido}</option>-->
             <!--</select>-->
              </div>
          </strong>
          <strong class="text-gray-dark"><fmt:formatDate value="${listar.dataPedido}"></fmt:formatDate></strong>
          <strong class="text-gray-dark"><fmt:formatNumber type="currency" value="${listar.valorPedido}" currencySymbol="R$"></fmt:formatNumber></strong>
         
          <!-- Button trigger modal -->
             <a href="#" class="" data-toggle="modal" data-target="#exampleModalScrollable">Detail</a>
             
        </div>
        <span class="d-block">${st.count}@username</span>
      </div>
    </div>
    </c:forEach>
    
                <!-- Modal -->
            <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalScrollableTitle">Detalhes do Pedido</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    ...
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div>
                </div>
              </div>
            </div>
                
    <small class="d-block text-right mt-3">
      <a href="#">All suggestions</a>
    </small>
  </div>
    <%
        int quantidadePagina = Integer.parseInt(request.getParameter("quantidadePagina"));
        int numeroPagina = Integer.parseInt(request.getParameter("numeroPagina"));
    %>
    <br>
     <nav aria-label="...">
         <ul class="pagination justify-content-center">             
    <%
        if(quantidadePagina > 0){
            for(int i = 1; i <= quantidadePagina; i++){
                if(i == numeroPagina){
                    out.println("<li class='page-item active'><a class='page-link'>" + i + "<span class='sr-only'>(current)</span></a></li>");
                }
                else{
                    out.println("<li class='page-item'><a class='page-link' href=lista-entregadores?action=listartodospedidos&numeroPagina="+ i +"> "+ i +" <span class='sr-only'>(current)</span> </a></li>");
                }
            }
        }
        else{
            out.println("<li class='page-link'><a class='page-link' href=lista-entregadores?action=listartodospedidos&numeroPagina=1>"+ 1 +"<span class='sr-only'>(current)</span></a></li>");
        }
    %>
    
          <%
        if(numeroPagina <= quantidadePagina && (numeroPagina - 1) > 0){
            out.println("<li class='page-item'><a class='page-link' href=lista-entregadores?action=listartodospedidos&numeroPagina="+(numeroPagina -1)+">Anterior</a></li>");
        }
        //out.println("<b>"+numeroPagina+"</b>");
        
        if(quantidadePagina > numeroPagina){
            out.println("<li class='page-item'><a class='page-link' href=lista-entregadores?action=listartodospedidos&numeroPagina="+(numeroPagina + 1)+">Próxima</a></li>");
        }
    %>
  
    </ul>
    </nav>
    
   
    
</main>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
      <script src="js/offcanvas.js"></script>
  </body>
</html>


