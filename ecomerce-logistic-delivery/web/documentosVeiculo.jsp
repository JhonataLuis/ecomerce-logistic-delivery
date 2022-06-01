<%-- 
    Document   : documetosVeículo
    Created on : 31/01/2019, 12:57:49
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanParceiroServicoLogin"%>
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
    %>
    <body>
       
        <div class="container">

            <div class="card shadow-lg">
                <div class="container">
                    <h2><b>Box in Box</b></h2>
                <div class="card-body">
                    <h3 class="card-title">Documentos</h3>
                    <div class="card shadow p-3 bg-white rounded">
                    <h4 class="card-header">Faça upload dos seus documentos pessoais.</h4>
                    <form class="was-validated" action="ServletParceDocumentos" method="POST" enctype="multipart/form-data">
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" name="file1" id="validatedCustomFile" lang="es">
                        <label class="custom-file-label" for="validatedCustomFile">Carteira Nacional de Habilitação com EAR - CNH</label>
                        
                      </div>
                    <br>
                    
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" name="file2" id="validatedCustomFile" required>
                        <label class="custom-file-label" for="validatedCustomFile">Foto de Perfil</label>
                      </div>
                    
                    <h4 class="card-header">Faça upload dos documentos do seu veículo.</h4>
                    <label>Para dirigir com a Box in Box, sua motocicleta precisa ser modelo 1996 ou mais nova.</label>
                     <div class="custom-file">
                        <input type="file" class="custom-file-input" name="file3" id="validatedCustomFile" lang="es">
                        <label class="custom-file-label" for="validatedCustomFile">Certificado de Registro e Licenciamento de Veículo - CRLV</label>
                      </div>
                    <input type="text" name="codParceServ_codParceServ" value="<%=usuValidado.getCodParceServ()%>">
                </div>    
                </div>
                <button type="submit" class="btn btn- btn-primary">FINALIZAR <i class="fas fa-check"></i></button>
                </div>
               </form> 
            </div>
        </div>
    </body>
</html>
