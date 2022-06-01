<%-- 
    Document   : telaInicial
    Created on : 25/01/2019, 10:31:24
    Author     : rayss
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CADASTRO DE USUÁRIOS | Box in Box</title>
    </head>
    <c:import url="cabecalho.jsp"/>
    <body style="background: #AAC9CE">
        <div class="container">
            <div class="">
             <%if(request.getAttribute("sucess") != null){%>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong><i class="far fa-check-circle"></i> Parabéns!</strong> <c:out value="${sucess}"/>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            <%}%>
            </div>
        <div class="card shadow">
             <div class="container">
                    <h2 style="color: #424249"><b>Cadastro de usuarios</b></h2>   
           
                <div class="card-body">
                    <form action="cadastro" method="POST">
                        <div class="form-group row">
                            <div class="col-sm-6">
                                <input type="hidden" class="form-control" id="" name="usuCodigo" readonly="readonly" placeholder="Código">
                            </div>

                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-2 col-form-label">Login</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="" name="usuLogin" required placeholder="Login">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-2 col-form-label">Nome</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="" name="usuNome" required placeholder="Nome usuário">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-2 col-form-label">Telefone</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="" name="usuTele" required placeholder="Telefone (00) 00000-0000">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="" name="usuSenha" required placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-2 col-form-label">Data</label>
                            <div class="col-sm-6">
                                <%
                                    Date dateAtual = new Date();
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                    String dataStr = sdf.format(dateAtual);
                                %>
                                <input type="text" class="form-control" id="" name="dateAtual" value="<%=dataStr%>" placeholder="Data">
                                <%
                                    out.println("Data " +dateAtual);
                                %>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">CONFIRMAR <i class="fas fa-arrow-right"></i></button>
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
