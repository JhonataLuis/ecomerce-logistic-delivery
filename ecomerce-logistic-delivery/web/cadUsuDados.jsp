<%-- 
    Document   : cadUsuDados
    Created on : 22/03/2019, 11:43:51
    Author     : rayss
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dados Cadastrais | Box in Box</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <body>
        <%
            BeanLogin beanLogin = (BeanLogin) session.getAttribute("usuariocomum");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #5F5CCE; color: #ffffff">
            <div class="container">
                <a class="navbar-brand" href="index.jsp" style="color: #ffffff"><h3><b>Box in</b> Box</h3></a>
                <div class="dropdown">
                    <button class="btn dropdown-toggle" style="color: #ffffff" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-th-list"></i> Categorias
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">

                    </ul>
                    <%if (beanLogin != null) {%>
                    <ul class="nav justify-content-end">

                        <div class="dropdown">
                            <button class="btn dropdown-toggle" style="color: #ffffff" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-user"></i> <%=beanLogin.getUsuLogin()%>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item primary" href="Dados?action=consultDados&user=<%=beanLogin.getUsuLogin()%>"><i class="fas fa-dice-six"></i> Meus Dados</a>
                                <a class="dropdown-item" href=""><i class="fas fa-hand-holding-usd"></i> Compras</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="fas fa-motorcycle"></i> Motocicletas</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-bicycle"></i> Bicicletas</a>
                                <a class="dropdown-item" href="#"><i class="fab fa-phoenix-squadron"></i> Drones</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Logout"><i class="fas fa-sign-out-alt"></i> Sair </a>
                            </div>
                        </div>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i> <span class="badge badge-primary badge-pill">14</span> </a>
                        </li> 

                    </ul>
                    <%}else{%>
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="cadUsu.jsp" style="color: #ffffff"> <i class="far fa-user"></i> CADASTRAR  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="authenticar.jsp" style="color: #ffffff"> <i class="far fa-user"></i> ENTRAR  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp" style="color: #ffffff"><i class="fas fa-shopping-bag"></i>  <span class="badge badge-primary badge-pill">14</span></a>
                        </li> 
                    </ul>
                    <%}%>
                </div>

            </div>
        </nav>
        <div class="container">
            
            <div class="card shadow">
                <div class="container">
                    <h2 style="color: #424249"><b>Cadastro do dados</b></h2>   

                    <div class="card-body">
                        <form action="Dados" method="POST">
                            <!--<div class="form-group row">
                                <label for="" class="col-sm-2 col-form-label">CODUSULOGIN</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="codUsuCli" readonly="readonly" placeholder="Código">
                                </div>

                            </div>-->
                            <div class="form-group row">
                                <label for="" class="col-sm-2 col-form-label">Código</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="codUsuCli" readonly="readonly" placeholder="Código">
                                </div>

                            </div>
                            <div class="form-group row">
                                <label for="" class="col-sm-2 col-form-label">Nome</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="nomeUsuCli" required placeholder="Nome">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-sm-2 col-form-label">Sobrenome</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="sobreNomeUsuCli" required placeholder="Sobrenome">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Data de Nascimento</label>
                                <div class="col-sm-6">
                                    <%
                                        Date dataCadUserEmp = new Date();
                                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                        String dataStr = sdf.format(dataCadUserEmp);
                                    %>
                                    <input type="text" class="form-control" id="" name="dataNascUsuCli" value="<%=dataStr%>" placeholder="Data">
                                    <%
                                        out.println("Data " + dataCadUserEmp);
                                    %>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 col-form-label">Telefone</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="telefoneUsuCli" required placeholder="(00) 00000-0000">
                                </div>
                            </div>
                                 <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Endereço</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="enderUsuCli" required placeholder="Rua Exemplo">
                                </div>
                            </div>
                                <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Número</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="numeroUsuCli" required placeholder="Número">
                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Cep</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="cepUsuCli" required placeholder="00000-000">
                                </div>
                            </div>
                                 <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Bairro</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="bairroUsuCli" required placeholder="Bairro">
                                </div>
                            </div>
                                   <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Cidade</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="cidadeUsu_cliente" required placeholder="Cidade">
                                </div>
                            </div>
                                
                                  <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Estado</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="estadoUsuCli" required placeholder="Estado">
                                </div>
                            </div>
                                  <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">País</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="" name="paisUsuCli" required placeholder="País">
                                </div>
                            </div>
                            
                                 <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">E-mail</label>
                                <div class="col-sm-6">
                                    <input type="email" class="form-control" id="" name="emailUsuCli" required placeholder="E-mail">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-success">CONFIRMAR <i class="fas fa-chevron-right"></i></button>
                                    <button type="reset" class="btn btn-secondary">LIMPAR <i class="fas fa-broom"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
