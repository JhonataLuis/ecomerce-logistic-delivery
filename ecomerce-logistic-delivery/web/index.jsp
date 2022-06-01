<%-- 
    Document   : index
    Created on : 25/01/2019, 10:25:26
    Author     : rayss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestão de Entregas - Gerênciamento de Entregas Sustentaveis | BOX IN BOX</title>
</head>
<c:import url="cabecalho.jsp"/>
<body>
    <div class="container">
        
        <br>
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        
       
             <div class="card shadow-sm">
                <img src="imagens/entregas.jpg" class="img-fluid float-right" alt="...">
            </div>      
        <br>
        <div class="row">
            <div class="col-sm-6">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">Tem encomendas?</h5>
                        <p class="card-text">Seja parceiro do Time Logistic e descubra uma nova forma de levar suas encomendas até mais pessoas, para conquistar mais clientes e aumentar suas entregas.</p>
                        <a href="driverEmp.jsp" class="btn btn-primary">Comece agora <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">Que tal fazer entregas?</h5>
                        <p class="card-text">Ganhe dinheiro fazendo entregas com a Time Logistic. Dependendo da cidade, você pode fazer entregas de moto, carro ou bicicleta e Drones.</p>
                        <a href="driverDelivery.jsp" class="btn btn-primary">Comece agora <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<c:import url="rodape.jsp"/>
