<%-- 
    Document   : salvaImgem
    Created on : 27 de abr de 2019, 18:33:39
    Author     : user
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <title>Conta da Box in Box | Seu Perfil | Alterar Imagem</title>
    </head>
    <c:import url="cabecalho.jsp"/>
    <body style="background: #EBE9E4">
        <div class="container"> 
        <h1>Adicionar uma Imagem</h1>
        <div class="text-center">
            <i class="far fa-user"></i><img class="rounded border" alt="Imagem" src="" id="target" width="300" height="300">
        </div>
        <input type="file" id="file" name="file" onchange="uploadFile();">
        <div class="">
            <button class="btn btn-primary">Salvar a Imagem</button>
            <button class="btn btn-secondary">Close</button>
        </div>
        </div>
    </body>
    <script type="text/javascript">
        
        function uploadFile(){
            
        var target = document.querySelector("img");
        var file = document.querySelector("input[type=file]").files[0];
        var reader = new FileReader();
        
        reader.onloadend = function(){
            
            target.src = reader.result;
        };
        
        if(file){
            reader.readAsDataURL(file);
            //alert("Deseja alterar a imagem?")
        }else{
            target.src = "";
        }
    }
    </script>
</html>
