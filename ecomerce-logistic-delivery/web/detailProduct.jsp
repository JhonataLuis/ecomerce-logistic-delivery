<%-- 
    Document   : detalilProduct
    Created on : 17/03/2019, 20:28:59
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@page import="br.com.javabean.bean.BeanProducts"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Detalhes do Produto | Box in Box</title>

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

        <div class="container">
            <div class="breadcrumb border">
                <h3>Detalhes do Produto!</h3>
            </div>
            <%
            Products consultProduct = (Products) request.getAttribute("consulta");
            %>
            
        
                        <div class="row">
                            <div class="col-md-6 col-xs-6">
                              <div class="card">
                                  <div class="card-body">
                                  <img src="<%=consultProduct.getImgProduct()%>" class="img-fluid img-responsive img-rounded">
                                  </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card">
                              <div class="card-body">
                                            <h5 class="card-title"><%=consultProduct.getNomeProduct()%></h5>
                                            <p class="card-text"><%=consultProduct.getDescProduct()%></p>
                                            <form action="agregarproduto" method="POST">
                                                <h3 class="text"><fmt:formatNumber currencySymbol="R$" value="<%=consultProduct.getPrecoProduct()%>" type="currency"></fmt:formatNumber></h3>
                                                <div class="card">
                                                    <div class="card-body">
                                                        <p class="card-text">Formas de Pagamento</p>
                                                        <span><i class="far fa-credit-card" style="color: #5F5CCE"></i></span>
                                                           <span><i class="fas fa-barcode" style="color: #5F5CCE"></i></span>
                                                    </div>
                                                </div>
                                            <div class="btn-block">
                                                <div class="form-group">
                                                <label class="text-muted">Quantidade:</label>
                                                <select class="form-control" name="quantidade" id="txt-quantidade">
                                                    <%for(int i = 1; i <= 6; i++){%>
                                                    <option value="<%=i%>"><%=i%> unidade</option>
                                                    <%}%>
                                                </select>
                                                </div>
                                                    <input class="text-muted" name="idProduct" value="<%=consultProduct.getIdProduct()%>">
                                                <input value="<%=consultProduct.getPrecoProduct()%>">
                                            </div>
                                            <button type="submit" class="btn btn-success">Adicionar ao carrinho <i class="fas fa-cart-plus"></i> <fmt:formatNumber type="currency" value="<%=consultProduct.getPrecoProduct()%>" currencySymbol="R$"></fmt:formatNumber></button>
                                        </form>
                                        </div>
                            </div>
                            </div>
                                    
                          </div>
                                       <div class="card">
                                           
                                            <div class="card-body">
                                                  <h5 class="card-title" style="color: #5F5CCE">Escolha sua Melhor forma de Entrega</h5>
                                                <span><i class="fas fa-truck" style="color: #5F5CCE"></i></span>
                                                <div class="row">
                                                    <div class="col">
                                                <div class="card" style="width: 10rem;">
                                                    <img src="imagens/246x0w.jpg" alt="..." class="card-img-top" width="100" height="100">
                                                    <div class="card-body">
                                                            <a href="#" class="">
                                                              
                                                                <span><i class="fas fa-money-bill-wave"></i></span>
                                                                <p class="nav-item nav-link">R$ 25,90</p>
                                                            </a>
                                                    </div>
                                                </div>
                                                    </div>
                                                    <div class="col">
                                                 <div class="card" style="width: 10rem;">
                                                     <img src="imagens/OudaB0Js_400x400.jpg" alt="..." class="card-img-top" width="100" height="100">
                                                    <div class="card-body">
                                                            <a href="#" class="text-center">
                                                               
                                                                <span><i class="fas fa-money-bill-wave"></i></span>
                                                                <p class="nav-item nav-link">R$ 25,90</p>
                                                            </a>
                                                    </div>
                                                </div>
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
   
            <div class="card">
                <div class="card-body">
                    <h3 class="text-muted">Detalhes</h3>
                    <p class="card-text"><%=consultProduct.getDetalProduct()%></p> 
                </div>
            </div> 
                
                
        </div>
    </body>
</html>
