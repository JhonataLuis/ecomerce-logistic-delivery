<%-- 
    Document   : salvaImgBusin
    Created on : 27 de abr de 2019, 19:47:18
    Author     : user
--%>

<%@page import="br.com.javabean.bean.BeanParceCadEmpresa"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <title>Conta da Box in Box | Seu Perfil | Alterar Imagem</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
    </head>
    
    <body>
         <%
         BeanLogin beanLog = (BeanLogin) session.getAttribute("usuario");
                     ParceCadEmpresa beanParceEmp = (ParceCadEmpresa) session.getAttribute("empUsu");
         %>


        <nav class="navbar navbar-expand-lg navbar-light" style="background: #29558C">
            <div class="container">
                <h3><a class="navbar-brand" href="testTable.jsp" style="color: #F6F3EE"><b>Box in</b> Box</a></h3>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                     <ul class="navbar-nav mr-auto">
                        <img src="<%=beanParceEmp.getFilePart()%>" class="img-responsive img-thumbnail img-fluid" width="80px" height="80px">
                    </ul>
                    <ul class="nav justify-content-end">
                       <!-- Example single danger button -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                             <i class="far fa-user"></i> <%=beanParceEmp.getNomeRepre()%>
                          </button>
                          <div class="dropdown-menu">
                            <a class="dropdown-item" href="#"><i class="fas fa-database"></i> Meus Dados</a>
                            <a class="dropdown-item" href="pedidos.jsp"><i class="fas fa-retweet"></i> Pedidos Realizados</a>
                            <a class="dropdown-item" href="#"></a>
                            <a class="dropdown-item" href="#"><i class="fas fa-building"></i> Info Business</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                            <a class="dropdown-item" href=Logout><i class="fas fa-sign-out-alt"></i> Sair</a>
                          </div>
                        </div>
                        <li>
                           
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-sm btn-success" href="#" title="<%=beanParceEmp.getNomeEmp()%>"> <i class="far fa-building"></i> <%=beanParceEmp.getNomeEmp()%></a>
                        </li>
                         <li class="nav-item">
                            <a class="btn btn-sm btn-success" href="products?action=lista&user=<%=beanLog.getUsuLogin()%>" title="Lista de Produtos">
                                <div class="">
                                    <i class="fas fa-list-ul"></i> Lista
                                </div>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
                                
        <div class="container"> 
        <h1>Adicionar uma Imagem</h1>
        <div class="text-center">
            <i class="far fa-user"></i><img class="rounded border" alt="Imagem" src="" id="target" width="300" height="300">
        </div>
        
        <form action="ServletImagemParceEmpresa" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="exampleInputEmail1">Adicione um título</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="codParceVend" value="<%=beanParceEmp.getCodParceVend()%>" aria-describedby="emailHelp" placeholder="Digite um titulo">
                </div>
                <input type="file" id="file" name="filePart" onchange="uploadFile();">
            </div>
            <div class="">
                <button class="btn btn-primary" type="submit">Salvar a Imagem</button>
                <button class="btn btn-secondary">Close</button>
            </div>
        </form>
        </div>
    </body>
    <script type="text/javascript">
        
        function uploadFile(){
            
        var target = document.querySelector("img");
        var filePart = document.querySelector("input[type=file]").files[0];
        var reader = new FileReader();
        
        reader.onloadend = function(){
            
            target.src = reader.result;
        };
        
        if(filePart){
            reader.readAsDataURL(filePart);
            //alert("Deseja alterar a imagem?")
        }else{
            target.src = "";
        }
    }
    </script>
</html>

