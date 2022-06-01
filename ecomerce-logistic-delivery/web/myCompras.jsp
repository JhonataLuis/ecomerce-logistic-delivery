<%-- 
    Document   : myCompras
    Created on : 03/08/2019, 14:55:19
    Author     : user
--%>

<%@page import="br.com.javabean.bean.BeanUsuarioCliente"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas Compras | Box in Box</title>
    </head>
    <c:import url="cabecalho.jsp"/>
    <%
        BeanUsuarioCliente datos = (BeanUsuarioCliente) session.getAttribute("datos");
    %>
    <body>
        <div class="container">
            <div class="breadcrumb">
                <h2><b>Minhas Compras</b></h2>
            </div>
            <table class="table table-hover table-responsive-md">
            <thead>
              <tr class="table-active">
                <th scope="col">Pedido</th>
                <th scope="col">Produto</th>
                <th scope="col">Valor</th>
                <th scope="col">Data</th>
                <th scope="col">Comprador</th>
                <th scope="col">Empresa</th>
                <th scope="col">Status</th>
                <th scope="col">Detalhes</th>
              </tr>
            </thead>
            <c:forEach var="listcomp" items="${listacomprausu}">
            <tbody>
              <tr>
                <th scope="row">#00${listcomp.idPedido}</th>
                <td><img src="${listcomp.imageProduct}" width="50" height="50" title=""></td>
                <td><fmt:formatNumber type="currency" currencySymbol="R$" value="${listcomp.valorPedido}"></fmt:formatNumber></td>
                <td><fmt:formatDate value="${listcomp.dataPedido}"></fmt:formatDate></td>
                <td>${listcomp.emailUsuCli}</td>
                <td>${listcomp.nomeEmp}</td>
                <td>
                 <c:choose>
                           <c:when test="${listcomp.statusPedido == 'Retirar Pedido'}">
                               <button type="button" class="btn btn-sm btn-success">${listcomp.statusPedido} <i class="fas fa-truck"></i></button>
                           </c:when>
                               <c:when test="${listcomp.statusPedido == 'Pedido em Andamento'}">
                               <button type="button" class="btn btn-sm btn-info">${listcomp.statusPedido} <i class="fas fa-archive"></i></button>
                           </c:when>
                               <c:when test="${listcomp.statusPedido == 'Em Preparo'}">
                                  <button type="button" class="btn btn-sm btn-secondary">${listcomp.statusPedido} <i class="fas fa-luggage-cart"></i></button>
                           </c:when>
                           <c:when test="${listcomp.statusPedido == 'Em Separação'}">
                                <button type="button" class="btn btn-sm btn-primary">${listcomp.statusPedido} <i class="fas fa-people-carry"></i></button>
                           </c:when>
                           <c:when test="${listar.statusPedido == 'Produgo Pronto'}">
                                <button type="button" class="btn btn-sm btn-primary">${listcomp.statusPedido} <i class="fas fa-boxes"></i></button>
                           </c:when>
                       </c:choose>
                </td>
                <td><a href="">details</a></td>
              </tr>
            </tbody>
            </c:forEach>
          </table>
            
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
                    out.println("<li class='page-item'><a class='page-link' href=ServletPedido?action=listarPedidosUsuario&codUser="+datos.getIdUsu_cliente()+"&numeroPagina="+ i +"> "+ i +" <span class='sr-only'>(current)</span> </a></li>");
                }
            }
        }
        else{
            out.println("<li class='page-link'><a class='page-link' href=ServletPedido?action=listarPedidosUsuario&codUser="+datos.getIdUsu_cliente()+"&numeroPagina=1>"+ 1 +"<span class='sr-only'>(current)</span></a></li>");
        }
    %>
    
          <%
        if(numeroPagina <= quantidadePagina && (numeroPagina - 1) > 0){
            out.println("<li class='page-item'><a class='page-link' href=ServletPedido?action=listarPedidosUsuario&codUser="+datos.getIdUsu_cliente()+"&numeroPagina="+(numeroPagina -1)+">Anterior</a></li>");
        }
        //out.println("<b>"+numeroPagina+"</b>");
        
        if(quantidadePagina > numeroPagina){
            out.println("<li class='page-item'><a class='page-link' href=ServletPedido?action=listarPedidosUsuario&codUser="+datos.getIdUsu_cliente()+"&numeroPagina="+(numeroPagina + 1)+">Próxima</a></li>");
        }
    %>
  
    </ul>
    </nav>
    
        </div>
    </body>
</html>
