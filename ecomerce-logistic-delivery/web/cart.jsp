<%-- 
    Document   : cart
    Created on : 19/03/2019, 17:19:41
    Author     : rayss
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.javabean.bean.BeanUsuarioCliente"%>
<%@page import="java.util.List"%>
<%@page import="br.com.model.dao.DaoProducts"%>
<%@page import="br.com.javabean.bean.BeanProducts"%>
<%@page import="br.com.javabean.bean.BeanArticulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Carrinho de Compras | Box in Box</title>
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
         <script src="js/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <%
        HttpSession sessioncart = request.getSession(true);
        ArrayList<BeanArticulo> articulos = sessioncart.getAttribute("carrito") == null ? null : (ArrayList) sessioncart.getAttribute("carrito");
       
        BeanUsuarioCliente consultDatos = (BeanUsuarioCliente) session.getAttribute("datos");
        BeanLogin beanLogin = (BeanLogin) session.getAttribute("usuariocomum");
    %>
    <body >
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
                    <span class="navbar-toggler-icon" style="color: white"></span>
                </button>
                
                 <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        
                    </ul>
                    <%if(beanLogin != null){%>
                    <ul class="nav justify-content-end">
                       
                     <div class="dropdown">
                    <button class="btn dropdown-toggle" style="color: #ffffff" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                          <li class="nav-item">
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i> 0 </a>
                        </li> 
                   
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
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i> 0 </a>
                        </li> 
                     </ul>
                     <%}%>
                </div>

            </div>
        </nav>
<!--FIM DO NAVA MENU DO SISTEMA-->
<%
    if(articulos != null){
%>
        <div class="container-fluid">
           
            <div class="breadcrumb">
                <h3 style="color: #5F5CCE"><b><i class="fas fa-shopping-cart"></i> Carrinho de Compras</b></h3>
            </div>
       
             <div class="row">
                  <div class="col-md-6 col-xs-6">
            <div class="card table-responsive shadow">
                    <div class="card-body" id="cart-container">
                      <table class="table table-sm" id="shop-table">
                          <thead>
                              <tr>
                                  <th colspan="2" scope="scope">Item Produto</th>
                                   <th>Preços</th>
                                  <th>Quantidade</th>
                                  <th>Subtotal</th>
                                  <th></th>
                              </tr>
                          </thead>
                          <tbody>
                              <%
                              DaoProducts daoProd = new DaoProducts();
                                                                Products beanProduct = new Products();
                                                                double total = 0;
                                                                
                                                                if(articulos != null){
                                                                for(BeanArticulo a : articulos){
                                                                    
                                                                    //OBTEM PRODUTO PELO ID DO PRODUTO
                                                                    beanProduct = daoProd.consultaProduto(a.getIdProduct());
                                                                    total += a.getQuantidade() * beanProduct.getPrecoProduct();
                              %>
                              <tr>
                                  <td><img src="<%=beanProduct.getImgProduct()%>" class="img-fluid img-responsive img-thumbnail"></td>
                                  <td><%=beanProduct.getNomeProduct()%><p class="card-text"><small class="text-muted">#<%=beanProduct.getIdProduct()%></small></p></td>
                                  <td><fmt:formatNumber type="currency" currencySymbol="R$" value="<%=beanProduct.getPrecoProduct()%>"></fmt:formatNumber></td>
                                  <td align="center">
                                      <button type="button" class="btn btn-info">
                                        <span class="badge badge-light"><%=a.getQuantidade()%></span>
                                        <span class="sr-only">unread messages</span>
                                       </button>
                                  </td>
                                  <td>R$ <%= Math.round(beanProduct.getPrecoProduct() * a.getQuantidade() * 100.0) / 100.0%></td>
                                  <td>
                                      <span class="text-small" id="idarticulo" style="display: none"><%=beanProduct.getIdProduct()%></span>
                                      <a class="btn btn-light text-muted" href="" title="remove produto do carrinho" id="delete-item-cart">remove <i class="fas fa-times"></i></a>
                                  </td>
                              </tr>
                              <%}}%>
                          </tbody>
                      </table>
                              <%if(articulos == null || articulos.isEmpty()){%>
                              <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                    <strong><i class="fas fa-exclamation-triangle"></i> </strong> Não há itens no seu carrinho.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                <span style="color: #235D3A"><i class="fas fa-exclamation-triangle"></i> Não há itens no seu carrinho</span>
                              <%}%>
                    </div>
                  </div>
         
            <div class="btn-block">
                <button class="btn btn-success">Finalizar Compra</button>
                <a href="javascript:window.history.go(-2);" class="btn btn-primary">Continuar Comprando</a>
            </div>
                </div>
       <!--FIM DO CARD 1-->
       
                            <div class="col">
                               <div class="card shadow">
                                    <div class="card-body">
                                        <form action="FimPedido" method="POST">
                                      <table class="table table-sm">
                                          <thead style="background: #435892; color: #fff">
                                              <tr>
                                                  <div colspan="3" class="btn-block">
                                                    <a class="btn btn-success">FINALIZAR A COMPRA <i class="fas fa-chevron-right"></i></a>
                                                </div>
                                              </tr>
                                          </thead>
                                          <tbody>
                                              <tr>
                                                  <td>SubTotal Itens(2)</td>
                                                  <td align="right" id="txt-subtotal"><fmt:formatNumber type="currency" value="<%= Math.round(total * 100.0) / 100.0%>" currencySymbol="R$"></fmt:formatNumber></td>
                                              </tr>
                                               <tr>
                                                  <td>Frete</td>
                                                  <td align="right">Grátis</td>
                                              </tr>
                                              <tr>
                                                  <td>Taxa de Entrega</td>
                                                  <td align="right">R$ 8,20</td>
                                              </tr>
                                              <tr>
                                                  <td><b>TOTAL</b></td>
                                                  <td align="right" style="color: green" id="txt-total"><b><fmt:formatNumber type="currency" value="<%= Math.round(total * 100.0) / 100.0%>" currencySymbol="R$"></fmt:formatNumber></b></td>
                                              </tr>
                                              <tr>
                                                  <%
                                                      if(beanLogin != null){
                                                      //FOR PARA FINALIZAR A COMPRA DOS ITENS DO CARRINHO
                                                      for(BeanArticulo a : articulos ){
                                                          beanProduct = daoProd.consultaProduto(a.getIdProduct());
                                                          total += a.getQuantidade() * beanProduct.getPrecoProduct();
                                                          //int quantTotal = a.getQuantidade() + a.getQuantidade();
                                                    %>
                                                    <td><input type="text" name="idProduct" value="<%=beanProduct.getIdProduct()%>"></td>
                                                    <td><input type="text" name="codParceVend" value="<%=beanProduct.getCodParceVend()%>"></td>
                                                    <td><input type="text" name="precoProduct" value="<%=beanProduct.getPrecoProduct()%>"></td>
                                                    <td><input type="text" name="quantidade" value="<%=a.getQuantidade()%>"></td>
                                                    <td><input type="text" name="datosUsuCli" value="<%=consultDatos.getIdUsu_cliente()%>"></td>
                                                    <td><input name="statusPedido" value="Pedido em Andamento"></td>
                                                         
                                                           <%
                                                                  Date dataStatusPedido = new Date();
                                                                  SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                                                  String dataPedido = sdf.format(dataStatusPedido);
                                                              %>
                                                          <td><input type="text" name="dataPedido" value="<%=dataPedido%>"></td>
                                                          <td>R$ <input type="text" name="valueTotal" value="<%=Math.round(total * 100.0)/ 100.0%>>"</td>
                                                          <td><%=a.getQuantidade()%></td>
                                                  <%}}%>
                                              </tr>
                                          </tbody>
                                      </table>
                                         <div class="btn-block">
                                             <button type="submit" class="btn btn-success">FINALIZAR A COMPRA <i class="fas fa-chevron-right"></i></button>
                                         </div>
                                        </form>
                                    </div>
                                  </div>
                            </div>
       <!--Fim do CARD 2 -->
       
        </div>
                                              
                   <div class="card">
                                           
                                            <div class="card-body">
                                                  <h5 class="card-title" style="color: #5F5CCE">Escolha sua Melhor forma de Entrega</h5>
                                                <span><i class="fas fa-truck" style="color: #5F5CCE"></i></span>
                                                <div class="row">
                                                    <div class="col">
                                                        <a href="#">
                                                    <div class="card" style="width: 10rem;">
                                                        <img src="imagens/246x0w.jpg" alt="..." class="card-img-top img-fluid" width="100" height="100">
                                                    <div class="card-body">
                                                           
                                                                
                                                                <span><i class="fas fa-money-bill-wave"></i></span>
                                                                <p class="nav-item nav-link">R$ 25,90</p>
                                                          
                                                    </div>
                                                </div>
                                                        </a>  
                                                </div>
                                                     <div class="col">
                                                          <a href="#">
                                                 <div class="card" style="width: 10rem;">
                                                     <img src="imagens/OudaB0Js_400x400.jpg" alt="..." class="card-img-top" width="100" height="100">
                                                    <div class="card-body">
                                                                <span><i class="fas fa-money-bill-wave"></i></span>
                                                                <p class="nav-item nav-link">R$ 25,90</p>
                                                         
                                                    </div>
                                                </div>
                                                          </a>
                                                    </div>
                                                    <div class="col">
                                                <div class="card" style="width: 10rem;">
                                                    <img src="imagens/índice.png" alt="..." class="card-img-top" width="100" height="100">
                                                    <div class="card-body">
                                                            <a href="#" class="">
                                                               
                                                                <span><i class="fas fa-money-bill-wave"></i></span>
                                                                <p class="nav-item nav-link">R$ 25,90</p>
                                                            </a>
                                                    </div>
                                                </div>
                                                    </div>
                                                    <div class="col">
                                                        <a href="#">
                                                    <div class="card" style="width: 10rem;">
                                                        <img src="imagens/246x0w.jpg" alt="..." class="card-img-top" width="100" height="100">
                                                    <div class="card-body">
                                                           
                                                                
                                                                <span><i class="fas fa-money-bill-wave"></i></span>
                                                                <p class="nav-item nav-link">R$ 25,90</p>
                                                          
                                                    </div>
                                                </div>
                                                        </a>  
                                                </div>
                                                      <div class="col">
                                                          <a href="#">
                                                 <div class="card" style="width: 10rem;">
                                                     <img src="imagens/OudaB0Js_400x400.jpg" alt="..." class="card-img-top" width="100" height="100">
                                                    <div class="card-body">
                                                                <span><i class="fas fa-money-bill-wave"></i></span>
                                                                <p class="nav-item nav-link">R$ 25,90</p>
                                                         
                                                    </div>
                                                </div>
                                                          </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                              
                                              
                          <%}else{%>
                          <div class="card show">
                              <div class="card-body">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                    <strong><i class="fas fa-exclamation-triangle"></i> </strong> Não há itens no seu carrinho.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                              </div>
                          </div>
                                <span style="color: #235D3A"><i class="fas fa-exclamation-triangle"></i> Não há itens no seu carrinho</span>
                          <%}%>
        </div>
                         
                          <!--script para o carrinho-->
                          <script src="js/carrinho.js"></script>
    </body>
</html>
