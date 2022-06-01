<%-- 
    Document   : confirmEndereco
    Created on : 26/03/2019, 17:55:22
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanTipoEntrega"%>
<%@page import="br.com.javabean.bean.BeanEntrega"%>
<%@page import="br.com.javabean.bean.BeanUsuarioCliente"%>
<%@page import="br.com.javabean.bean.BeanProducts"%>
<%@page import="br.com.model.dao.DaoProducts"%>
<%@page import="br.com.javabean.bean.BeanArticulo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Confirmar Local de Entrega | Box in Box</title>
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

            BeanUsuarioCliente consultDatos = (BeanUsuarioCliente) session.getAttribute("datos");
            BeanUsuarioCliente beanUsuCli = (BeanUsuarioCliente) session.getAttribute("datos");

            HttpSession sessioncart = request.getSession(true);
            //sessioncart.getAttribute("tipoentrega");
            BeanEntrega beanEndEntre = (BeanEntrega) sessioncart.getAttribute("entrega");
            ArrayList<BeanArticulo> articulos = sessioncart.getAttribute("carrito") == null ? null : (ArrayList) sessioncart.getAttribute("carrito");
    %>
    <body style="background: #F0F0F0">
        <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #5F5CCE; color: #ffffff">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">BOX in BOX</a>

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
                <h2>Onde quer recebê-lo?</h2>
            </div>

            <div class="row">
                <div class="col">
                    <%
                    if (beanEndEntre != null) {
                    %>
                    <div class="card">
                        <a href="" class="nav-link text-muted">
                            <div class="card-body">
                                <div class="img-circle">
                                    <i class="fas fa-map-marker-alt" style="color: #FF6535"></i>
                                </div>
                                <h5><%=beanEndEntre.getEnderUsuCliEntre()%> <%=beanEndEntre.getNumUsuCliEntre()%></h5>
                                <p><%=beanEndEntre.getCompleUsuCliEntre()%> <%=beanEndEntre.getCodCidadeUsuCliEntre()%> <%=beanEndEntre.getCodEstadoUsuCliEntre()%> <%=beanEndEntre.getCepUsuCliEntre()%></p>
                                <ul class="nav justify-content-end">
                                    <li class="nav-item">
                                        <a href="" class="nav-link">Enviar para outro endereço <i class="fas fa-long-arrow-alt-right"></i></a>
                                    </li>
                                </ul>
                            </div>    
                        </a>
                    </div>
                    <%
                    }
                    %>
                    <%
                    if (beanEndEntre == null) {
                                                if (beanUsuCli != null) {
                    %>
                    <div class="card">
                        <a href="#" class="nav-link text-muted">
                            <div class="card-body">
                                <div class="img-circle">
                                    <i class="fas fa-map-marker-alt" style="color: #FF6535"></i>
                                </div>
                                <h5><%=beanUsuCli.getEnderUsu_cliente()%>, <%=beanUsuCli.getNumeroUsu_cliente()%></h5>
                                <p>Complemento, <%=beanUsuCli.getCidadeUsu_cliente()%>, <%=beanUsuCli.getEstadoUsu_cliente()%> Cep-<%=beanUsuCli.getCepUsu_cliente()%></p>
                                <ul class="nav justify-content-end">
                                    <li class="nav-item">
                                        <a href="" class="nav-link">Enviar para outro endereço <i class="fas fa-long-arrow-alt-right"></i></a>
                                    </li>
                                </ul>
                            </div>    
                        </a>
                    </div>
                    <%
                    }
                                                    }
                    %>
                    <div>
                        <h3>Qual envio prefere</h3>
                    </div>
                    <div class="card">
                        <form action="FormPayment" method="POST">
                            <div class="card-body">
                                <i class="fas fa-motorcycle"  style="color: #FF6535"></i>
                                <h5>Normal</h5>
                                <input type="hidden" name="quantidade" value="1">
                                <input type="text" name="tipoEnvioUsuCliEntre" value="Normal">
                                <input type="text" name="valorEnvioUsuCliEntre" value="20.9">
                                <input type="text" name="idUsuCli" value="<%=beanUsuCli.getIdUsu_cliente()%>">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                    <label class="form-check-label" for="inlineRadio1">1</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-light text-muted text-right">R$ 20,90</button>
                        </form>
                    </div>
                    <div class="card">
                        <form action="FormPayment" method="POST">
                            <div class="card-body">
                                <i class="fas fa-motorcycle"  style="color: #FF6535"></i>
                                <h5>Expresso</h5>
                                <input type="hidden" name="tipoEnvioUsuCliEntre" value="Expresso">
                                <input type="hidden" name="valorEnvioUsuCliEntre" value="29.9">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="" id="inlineRadio1" value="option1">
                                    <label class="form-check-label" for="inlineRadio1">2</label>
                                </div>
                                <ul class="nav justify-content-end">
                                    <li class="nav-item">
                                        <a class="btn btn-light text-muted" href="#" tabindex="-1" aria-disabled="true">R$ 29,90</a>
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>

                </div>

                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <%
                                double total = 0;
                                                                    if (articulos != null) {
                                                                        for (BeanArticulo a : articulos) {

                                                                            beanProduct = daoProd.consultaProduto(a.getIdProduct());
                                                                            total += a.getQuantidade() * beanProduct.getPrecoProduct();
                                %>
                                <img src="<%=beanProduct.getImgProduct()%>" class="rounded mx-auto d-block img-circle" alt="..." width="50" height="50">
                                <div class="card-body">
                                    <h5 class="card-title"><%=beanProduct.getNomeProduct()%></h5>
                                    <p class="card-text"><%=a.getQuantidade()%></p>
                                    <div class="dropdown-divider"></div>
                                </div>
                                <%
                                }
                                                              }
                                %>
                            </div>
                            <h5>Produto</h5>
                            <ul class="nav justify-content-end">
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">R$ <%=Math.round(total * 100.00) / 100.00%></a>
                                </li>
                            </ul>
                            <h5>Envio</h5>
                            <ul class="nav justify-content-end">
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">---</a>
                                </li>
                            </ul>
                            <div class="dropdown-divider"></div>
                            <h5>Total</h5>
                            <ul class="nav justify-content-end">
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">---</a>
                                </li>
                            </ul>
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

                                            if (articulos != null) {
                                                for (BeanArticulo a : articulos) {

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
                    <%}
                        }%>
                    <thead>
                        <tr>
                            <th class="text-right" colspan="7" scope="col">Total: R$ <%=Math.round(total * 100.00) / 100.00%></th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </body>
</html>
