<%-- 
    Document   : cadParceFormTrabalho
    Created on : 31/01/2019, 12:07:24
    Author     : rayss
--%>
<%@page import="br.com.javabean.bean.BeanParceiroServicoLogin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bem vindo a Box in Box</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
<%
   BeanParceiroServicoLogin usuValidado = (BeanParceiroServicoLogin)session.getAttribute("sessaocadusuentrega");
   //int id = beanLogin.getCodParceServ();
%>
    <body>

        
        <div class="container">

            <div class="card">
                <div class="container">
                <h2>Box in Box</h2>
                <div class="card-body">
                    <h3 class="card-title">Escolha como você quer fazer parceria com a Box in Box.</h3>
                    
                    <form action="veiculo" method="POST">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-header"> <h4 class="card-title">Quero fazer entregas e tenho um Caminhão</h4></div>
                        <div class="card-body">
                            <p class="card-text">Tenho um caminhão e quero usá-lo apenas para fazer entregas com a Box in Box</p>
                            <input type="text" name="codParceServ_codParceServ" value="<%=usuValidado.getCodParceServ()%>">
                            <input type="text" name="codParceServ_codParceServ" value="<%=usuValidado.getNomeParceServ()%>">
                            <input type="text" name="tipoVeiculo" value="Caminhão Pequeno">
                            <button type="submit" class="btn btn-primary">AVANÇAR <i class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    </form>
                    
                    <form action="veiculo" method="POST">
                     <div class="card bg-light mb-3">
                        <div class="card-header"> <h4 class="card-title">Quero fazer entregas e tenho um carro</h4></div>
                        <div class="card-body">
                            <p class="card-text">Tenho um carro e quero usá-lo apenas para fazer entregas com a Box in Box</p>
                             <input type="text" name="codParceServ_codParceServ" value="<%=usuValidado.getCodParceServ()%>">
                            <input type="" name="tipoVeiculo" value="Carro">
                              <button type="submit" class="btn btn-outline-primary">AVANÇAR <i class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    </form>

                    <form action="veiculo" method="POST">
                     <div class="card bg-light mb-3">
                        <div class="card-header"> <h4 class="card-title">Quero fazer entregas e tenho uma bicicleta</h4></div>
                        <div class="card-body">
                            <p class="card-text">Tenho uma bicicleta e no mínimo 18 anos para realizar entregas com a Box in Box</p>
                            <input type="text" name="codParceServ_codParceServ" value="<%=usuValidado.getCodParceServ()%>">
                            <input type="" name="tipoVeiculo" value="Bicicleta">
                              <button type="submit" class="btn btn-outline-primary">AVANÇAR <i class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    </form>

                    <form action="veiculo" method="POST">
                     <div class="card bg-light mb-3 shadow p-3 mb-5 bg-white rounded">
                        <div class="card-header"> <h4 class="card-title">Quero fazer entregas e tenho uma moto</h4></div>
                        <div class="card-body">
                            <p class="card-text">Tenho uma moto para fazer entregas com a Box in Box</p>
                             <input type="text" name="codParceServ_codParceServ" value="<%=usuValidado.getCodParceServ()%>">
                            <input type="" name="tipoVeiculo" value="Moto">
                              <button type="submit" class="btn btn-outline-primary">AVANÇAR <i class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    </form>
                    
                </div>
                
                </div>
               <!-- <button class="btn btn- btn-primary">CONTINUAR</button>-->
            </div>
    </body>
</html>
