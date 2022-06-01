<%-- 
    Document   : cadastroParceEntrega
    Created on : 30/01/2019, 18:05:53
    Author     : rayss
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Time Logistic | Cadastre para serviços de entregas</title>

    </head>
    <c:import url="cabecalho.jsp"/>
    <body>

        <div class="container">
         
                <div class="card-body shadow">
                <h3>Cadastre-se agora</h3>
                <form action="cadastro-parceiroServico" method="POST">
                    <div class="col-6">
                        <input type="email" class="form-control is-valid" id="email" name="emailParceServ" required placeholder="Email">
                        <div class="valid-feedback">
                            Looks good!
                          </div>
                    </div>
                
                        <div class="col-6">
                            <label>Nome</label>
                            <input type="text" class="form-control" name="nomeParceServ" required placeholder="Nome ">
                        </div>
                        <div class="col-6">
                            <label>Sobrenome</label>
                            <input type="text" class="form-control" name="sobreNomeParceServ" required placeholder="Sobrenome">
                        </div>
                    

                    <div class="col-6">
                        <label for="inputAddress">Telefone</label>
                        <input type="text" class="form-control" id="inputAddress" name="teleParceServ" required placeholder="Telefone">
                    </div>
                    <div class="col-6">
                        <label for="inputAddress">Criar Senha</label>
                        <input type="password" class="form-control" id="inputAddress" name="passwordParceServ" required placeholder="Criar senha">
                    </div>
                    <div class="col-6">
                        <label for="inputAddress">Cidade</label>
                        <!--<input type="text" class="form-control" id="inputAddress" name="cidadeParceServ" required placeholder="Cidade">-->
                        <select class="form-control" name="cidadeParceServ">
                            <option  value="1">Curitiba</option>
                             <option value="2">São José dos Pinhais</option>
                              <option value="3">Pinhais</option>
                               <option value="4">Colombo</option>
                                <option value="cidadeParceServ">....</option>
                          </select>
                    </div>
                    <div class="col-6">
                        <label for="inputAddress">Código de indicação (opcional) </label>
                        <input type="text" class="form-control" id="inputAddress" name="codigoIndcParceServ" placeholder="Código de indicação (opcional) ">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-md btn-primary">AVANÇAR <i class="fas fa-arrow-right"></i></button>
                   
                </form>
              <label class="form-group">Tem uma Conta?<a href="authenticar.jsp" class="nav-link"> Entrar</a></label>
            </div>
        
        </div>
    </body>
</html>
<c:import url="rodape.jsp"/>