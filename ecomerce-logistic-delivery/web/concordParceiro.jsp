<%-- 
    Document   : concordParceiro
    Created on : 31/01/2019, 14:22:48
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanParceiroServicoLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bem vindo a Time Logistic</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <%
       BeanParceiroServicoLogin usuValidado = (BeanParceiroServicoLogin)session.getAttribute("sessaocadusuentrega");
    %>
    <body>
        <div class="container">
            <div class="card shadow-lg" style="width: 50rem">
                <h2><b>Box in Box</b></h2>
                <div class="card-body">
            <h2>Termos e condições</h2>
            <form action="politica-privacidade" method="POST">
                <input type="text" name="descPoliticPrivac" value="Sim">
                <input type="text" name="codParceServ_codParceServ_descPoliticPrivac" value="<%=usuValidado.getCodParceServ()%>">
                <div class="form-group">
                     <h6 class="card-subtitle mb-2 text-muted">POR FAVOR, LEIA COM ATENÇÃO ESTES TERMOS ANTES DE ACESSAR OU USAR OS SERVIÇOS.</h6>
                    <p class="card-text">Ao acessar e usar os Serviços você concorda com os presentes termos e condições, que estabelecem o
                        relacionamento contratual entre você e a Uber. Se você não concorda com estes Termos, você não pode acessar nem usar os Serviços.
                        Mediante referido acesso e uso, estes Termos imediatamente encerram, substituem e superam todos os acordos, Termos e acertos anteriores entre você e qualquer Afiliada da Uber.
                        A Uber poderá imediatamente encerrar estes Termos ou quaisquer Serviços em relação a você ou, de modo geral, 
                        deixar de oferecer ou negar acesso aos Serviços ou a qualquer parte deles, a qualquer momento e por qualquer motivo.</p>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck">
                        <label class="form-check-label" for="gridCheck">
                            Concordar
                        </label>
                    </div>
                </div>
                <div class="card-footer">
                <button type="submit" class="btn btn-primary">ACEITAR <i class="fas fa-arrow-right"></i></button>
                </div>
            </form>
                </div>
            </div>
        </div>
    </body>
</html>
