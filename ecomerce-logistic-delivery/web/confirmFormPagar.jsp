<%-- 
    Document   : confirmFormPagar
    Created on : 27/03/2019, 10:10:29
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanTipoEntrega"%>
<%@page import="br.com.javabean.bean.BeanEntrega"%>
<%@page import="br.com.javabean.bean.BeanProducts"%>
<%@page import="br.com.model.dao.DaoProducts"%>
<%@page import="br.com.javabean.bean.BeanUsuarioCliente"%>
<%@page import="br.com.javabean.bean.BeanArticulo"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forma de Pagamento | Box in Box</title>
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
         <script src="js/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <%
    DaoProducts daoProd = new DaoProducts();
            Products beanProduct = new Products();
            BeanTipoEntrega beanTipoEnt = new BeanTipoEntrega();
            BeanArticulo beanArt = new BeanArticulo();
            double total = 0;
            
             BeanUsuarioCliente consultDatos = (BeanUsuarioCliente) session.getAttribute("datos");
             BeanUsuarioCliente beanUsuCli = (BeanUsuarioCliente) session.getAttribute("datos");
             
            HttpSession sessioncart = request.getSession(true);
            //sessioncart.setAttribute("enderentrega", entrega);
            ArrayList<BeanArticulo> articulos = sessioncart.getAttribute("carrito") == null ? null : (ArrayList) sessioncart.getAttribute("carrito");
    %>
    <body style="background: #F0F0F0">
         <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #5F5CCE; color: #ffffff">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">BOX in BOX</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul style="background-color: #5F5CCE; color: #ffffff" class="nav justify-content-center">
                        
                    </ul>
                    
                </div>
                         <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: #ffffff">contato</a>
                        </li> 
                            
                          </ul>
            </div>
        </nav>
        <div class="container">
            <div class="breadcrumb">
                <h1>Como você prefere pagar?</h1>
            </div>
        <div class="row">
            <div class="col">
                <%
                if(request.getAttribute("idusucli") != null){
                %>
                 <div class="card">
                     <a href="" class="nav-item nav-link text-muted">
                    <div class="card-body">
                        <div>
                            <i class="fas fa-credit-card" style="color: #FF6535"></i>
                            <h5>Meio sugerido de pagamento</h5>
                            <p><%=beanUsuCli.getIdUsu_cliente()%></p>
                        </div>
                    </div>
                     </a>
                  </div>
                        <%
                        }
                        %>
                 <div class="card">
                     <a href="finalizarPedido.jsp" class="nav-item nav-link text-muted">
                    <div class="card-body">
                        <div>
                            <i class="fas fa-credit-card" style="color: #FF6535"></i>
                            <h5>Meio sugerido de pagamento</h5>
                            <p>VISA</p>
                        </div>
                    </div>
                     </a>
                  </div>
                <div>
                    <h3>Outros meios</h3>
                </div>
              <div class="card">
                  <a href="cadCartao.jsp" class="nav-item nav-link text-muted">  
                    <div class="card-body">
                        <i class="fas fa-credit-card" style="color: #FF6535"></i>
                        <h5>Cartão de Crédito</h5>
                         <p>Em até 12 parcelas sem juros</p>
                    </div>
                  </a>
              </div>
                 <div class="card">
                  <a href="https://www.paypal.com/br/home" class="nav-item nav-link text-muted">
                <div class="card-body">
                    <i class="fas fa-credit-card" style="color: #FF6535"></i>
                    <h5>PayPal Digital</h5>
                     <p>Em até 12 parcelas sem juros</p>
                  <ul class="nav justify-content-end">
                    <li class="nav-item">
                      <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">R$ 20,90</a>
                    </li>
                  </ul>
                </div>
                  </a>
              </div>
                 <div class="card">
                     <a href="ServletGerarBoleto?action=gerarboleto" class="nav-item nav-link text-muted">
                    <div class="card-body">
                        <i class="fas fa-receipt" style="color: #FF6535"></i>
                        <h5>Boleto</h5>
                         <ul class="nav justify-content-end">
                           <li class="nav-item">
                             <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">R$ 29,90</a>
                           </li>
                         </ul>
                    </div>
                     </a>
                  </div>
            </div>
            <div class="col">
              <div class="card">
                <div class="card-body">
                    <div class="text-center">
                       <%
                       //double total = 0;
                                                   if(articulos != null){
                                                       for(BeanArticulo a : articulos){

                                                   beanProduct = daoProd.consultaProduto(a.getIdProduct());
                                                   total += a.getQuantidade() * beanProduct.getPrecoProduct();
                       %>
                        <img src="<%=beanProduct.getImgProduct()%>" class="rounded mx-auto d-block img-circle" alt="..." width="50" height="50">
                        <div class="card-body">
                          <h5 class="card-title"><%=beanProduct.getNomeProduct()%></h5>
                          <p class="card-text"><%=a.getQuantidade()%></p>
                           <div class="dropdown-divider"></div>
                        </div>
                         
                      </div>
                        <h5>Produto</h5>
                         <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true" style="color: #49B462"><b>R$ <%=Math.round(total * 100.00)/ 100.00%></b></a>
                            </li>
                         </ul>
                                <h5>Envio <h3 style="color: #FF6535">(<%=a.getNomeTipoEntrega()%>)</h3></h5>
                         <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">R$ <%=a.getValorEnvioUsuCliEntre()%></a>
                            </li>
                         </ul>
                         <h5>Total</h5>
                         <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true" style="color: #49B462"><b>R$ <fmt:formatNumber value="<%=Math.round(total + a.getValorEnvioUsuCliEntre())%>" currencySymbol="R$"></fmt:formatNumber></b></a>
                            </li>
                         </ul>
                            <%
                            }}
                            %>
                </div>
                            
              </div>
            </div>
          </div>
            
             <div class="">
                <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th scope="col">#Codigo Produto</th>
                        <th scope="col">Cod Parce</th>
                        <th scope="col">Preço Produto</th>
                        <th scope="col">Quant</th>
                        <th scope="col">Dados UsuCli</th>
                        <th scope="col">Status</th>l
                        <th scope="co">Endereço</th>
                      </tr>
                    </thead>
                    <%
                    daoProd = new DaoProducts();
                                              beanProduct = new Products();
                                              //double total = 0;
                                                      
                                              if(articulos != null){
                                                 for(BeanArticulo a : articulos){
                                                          
                                                   beanProduct = daoProd.consultaProduto(a.getIdProduct());
                                                   total += a.getQuantidade() * beanProduct.getPrecoProduct();
                    %>
                    <tbody>
                      <tr>
                          <th scope="row"><%=beanProduct.getIdProduct()%></th>
                        <td><%=beanProduct.getCodParceVend()%></td>
                        <td>R$ <%=beanProduct.getPrecoProduct()%></td>
                        <td><%=a.getQuantidade()%></td>
                        <td><%=consultDatos.getIdUsu_cliente()%></td>
                        <td>Status</td>
                        <td><%=beanUsuCli.getEnderUsu_cliente()%>, <%=beanUsuCli.getBairroUsu_cliente()%>,<%=beanUsuCli.getCepUsu_cliente()%></td>
                      </tr>
                    </tbody>
                    <%}}%>
                    <thead>
                        <tr>
                            <th class="text-right" colspan="7" scope="col">Total: R$ <%=Math.round(total * 100.00)/ 100.00%></th>
                        </tr>
                    </thead>
                  </table>
            </div>
                        
        </div>
    </body>
</html>