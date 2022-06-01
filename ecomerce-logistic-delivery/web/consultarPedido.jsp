<%-- 
    Document   : consultarPedido
    Created on : 20/06/2019, 17:23:58
    Author     : user
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos | Box in Box</title>
    </head>
    <c:import url="cabecalhoParceiro.jsp"/>
    <body>
        <div class="container">
            <h1>Hello World!</h1>
            <div class="row">
                <div class="bloco">
                    <div class="col-sm-6">

                        <c:forEach var="listar" items="${listadepedidos}">
                            <div class="card shadow text-right" style="width: 25rem;">
                                <a class="nav-item nav-link" href="ServletPedido?action=consultarpedido&codPedido=${listar.idPedido}&codParceVend=${listar.idParceVend}">
                                    <div class="card-body">
                                        <h5 class="card-title">Almeida</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">código #${listar.idPedido}<p class="card-text-muted"><fmt:formatDate value="${listar.dataPedido}"></fmt:formatDate></p></h6>
                                            <p class="card-text">Previsto 17:50</p>
                                            <a href="#" class="btn btn-sm btn-primary">${listar.statusPedido}</a>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        
                    </div>
                </div>

                <div class="col-sm">

                    <c:choose>
                        <c:when test="${not empty consultarpedido.idPedido}">
                            <div class="card breadcrumb table-responsive shadow-sm">
                                <div class="card-body">
                                    <table class="table table-sm">
                                        <thead class="table-sm">
                                            <tr>
                                                <td> #${consultarpedido.idPedido}</td>
                                                <td>${consultarpedido.nomeUsuCli} ${consultarpedido.sobrenomeUsuCli}</td>
                                                <td>

                                                    <!-- Example split danger button -->
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-sm btn-primary">${consultarpedido.statusPedido}</button>
                                                        <button type="button" class="btn btn-sm btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <span class="sr-only">Toggle Dropdown</span>
                                                        </button>
                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item" href="ServletPedido?action=updatestatuspedido&statusPedido=Em Preparo&codPedido=${consultarpedido.idPedido}">Em Preparo</a>
                                                            <a class="dropdown-item" href="ServletPedido?action=updatestatuspedido&statusPedido=Em Separação&codPedido=${consultarpedido.idPedido}">Em Separação</a>
                                                            <a class="dropdown-item" href="ServletPedido?action=updatestatuspedido&statusPedido=Produgo Pronto&codPedido=${consultarpedido.idPedido}">Produto Pronto</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="ServletPedido?action=updatestatuspedido&statusPedido=Retirar Pedido&codPedido=${consultarpedido.idPedido}">Retirar Pedido</a>
                                                        </div>
                                                    </div>

                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-muted">17:03</td>
                                                <td class="text-muted">${consultarpedido.emailUsuCli}</td>
                                                <td class="text-muted">(1 Pedido)</td>
                                                <td>Previsto: 17:33</td>
                                            </tr>
                                            <tr>
                                                <td class="text-muted">CEP</td>
                                                <td colspan="2" class="text-muted">Endereço</td>
                                            </tr>
                                            <tr>
                                                <td>${consultarpedido.cepUsuCli}</td>
                                                <td colspan="3">${consultarpedido.enderUsuCli}, ${consultarpedido.numeroUsuCli} - ${consultarpedido.bairroUsuCli} - ${consultarpedido.cidadeUsuCli} - ${consultarpedido.estadoUsuCli}</td>
                                            </tr>
                                            <tr>
                                                <td class="text-muted">Complemento</td>
                                                <td class="text-muted">Referência</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">apto 703 bloco 2</td>
                                                <td colspan="2">em frente da afr</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="col-sm">
                                <div class="card table-responsive shadow-sm">
                                    <div class="card-body">
                                        <table class="table table-sm">
                                            <thead>
                                                <tr>
                                                    <td>Quant</td>
                                                    <td>Itens</td>
                                                    <td align="right">Preço</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td scope="col">${consultarpedido.quantPedido}</td>
                                                    <td>${consultarpedido.idProduct}, ${consultarpedido.nomeProduto}</td>
                                                    <td align="right">${consultarpedido.valorPedido}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>



                    <div class="col-sm">
                        <div class="card shadow">
                            <div class="card-body">
                                <table class="table table-sm">
                                    <thead>
                                        <tr>
                                            <td>Forma de pagamento</td>
                                            <td class="text-muted" align="right">Martercard</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>SubTotal</td>
                                            <td align="right">R$ 40,00</td>
                                        </tr>
                                        <tr>
                                            <td>Taxa de Entrega</td>
                                            <td align="right">R$ 8,20</td>
                                        </tr>
                                        <tr>
                                            <td><b>TOTAL</b></td>
                                            <td align="right" style="color: green"><b>R$ 70,00</b></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>


            </div>

        </div>
    </body>
</html>
