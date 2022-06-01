<%-- 
    Document   : pedidos
    Created on : 08/02/2019, 10:50:17
    Author     : rayss
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
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
                      <c:if test="Em Preparo">
                          <a href="#" class="btn btn-sm btn-danger">${listar.statusPedido}</a>
                      </c:if>
                      <a href="#" class="btn btn-sm btn-primary">${listar.statusPedido}</a>
                    </div>
                    </a>
                  </div>
                </c:forEach>
                
            </div>
            
                </div>
            
            <div class="col-sm">
                <div class="card breadcrumb table-responsive shadow-sm">
                    <div class="card-body">
                        <table class="table table-sm">
                            <thead class="table-sm">
                            <tr>
                                <td> #7894</td>
                                <td>Almeida</td>
                                <td colspan="2" align="right"><button class="btn btn-sm btn-primary">Em Preparo</button></td>
                            </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-muted">17:03</td>
                                    <td class="text-muted">email@teste.com.br</td>
                                    <td class="text-muted">(1 Pedido)</td>
                                    <td>Previsto: 17:33</td>
                                </tr>
                                <tr>
                                    <td class="text-muted">CEP</td>
                                    <td colspan="2" class="text-muted">Endereço</td>
                                </tr>
                                <tr>
                                    <td>89654178</td>
                                    <td colspan="3">Rua Hylceia Gobetti Schell - Guatupe - São josé dos Pinhais - Pr</td>
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
                                  <td scope="col">1</td>
                                  <td>Hamburger duplo cheder</td>
                                  <td align="right">R$ 13,20</td>
                              </tr>
                          </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                
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
