<%-- 
    Document   : listaProdutos
    Created on : 07/07/2019, 17:45:07
    Author     : user
--%>

<%@tag import="br.com.javabean.bean.BeanProducts"%>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<jsp:useBean id="daoProducts" class="br.com.model.dao.DaoProducts"></jsp:useBean>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="message"%>
<%
    //int idProduct = 0;
    BeanProducts listaProduct =  daoProducts.consultProductPedidos();
     for(java.util.Iterator iterator = listaProduct.iterator(); iterator.hasNext();){
        br.com.javabean.bean.BeanProducts products = (br.com.javabean.bean.BeanProducts) iterator;
        int idProduct = products.getIdProduct();
        String nomeProduto = products.getNomeProduct();
        out.println("<span value="+idProduct+">"+nomeProduto+"</span>");
    }
%>

