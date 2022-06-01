<%-- 
    Document   : login
    Created on : 06/02/2019, 15:43:31
    Author     : rayss
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Jekyll v3.8.5">
        <title>BOX IN BOX | IDENTIFICAÇÃO</title>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="css/floating-labels.css" rel="stylesheet">
    </head>
    <body style="background: #B9D4DB">

        <div class="container mt-5 col-lg-5">
            <div class="card col-sm-10">
                <div class="card-body">
                    <form class="form-signin" action="Autenticar" method="POST">
                        <div class="text-center mb-4">
                            <img class="mb-4" src="imagens/box.png" alt="" width="72" height="72">
                            <h1 class="h3 mb-3 font-weight-normal"><label ><b>Box in</b></label> Box</h1>
                            <h1 class="h3 mb-3 font-weight-normal">Bem-vindo(a) de volta</h1>
                            <p>Entre com seu endereço de e-mail</p>
                            <%if (request.getAttribute("msgErroLogin") != null) {%>
                            <div class="alert alert-danger fade show" role="alert">
                                <strong>Atenção! </strong> <c:out value="${msgErroLogin}"/>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <%}%>
                            <%if (request.getAttribute("endSession") != null) {%>
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong><c:out value="${endSession}"/> </strong> <p>Obrigado por acessar a <b>Box in Box</b></p>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <%}%>
                        </div>

                        <div class="form-label-group">
                            <input type="email" id="inputEmail" class="form-control" name="login" placeholder="Email ou usuário" required autofocus>
                            <label for="inputEmail"><i class="far fa-user"></i> Email address</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required>
                            <label for="inputPassword"><i class="fas fa-key"></i> Password</label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">ENTRAR <i class="fas fa-arrow-right"></i></button>
                        <p>Novo na BOX IN BOX? <a href="index.jsp">Crie uma conta</p></a>
                        <hr>
                        <p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2019</p>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
