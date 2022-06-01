<%-- 
    Document   : cadBusiness
    Created on : 06/02/2019, 17:21:34
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastro de Parceiro | Box in Box</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body style="background: #EBE9E4">
        <div class="container">
            <%
                BeanLogin beanLog = (BeanLogin) session.getAttribute("usuario");
            %>
            <%if(beanLog != null){%>
                <a class="btn btn-outline-primary" href=""><%=beanLog.getUsuLogin()%></a>
            <%}%>
            <div class="card shadow">
                <div class="container">
                    <h2><b>Box in Box</b></h2>
                    <div class="card-body">
                        <h3 class="card-title">Faça parceria com a Box in Box.</h3>
                        <h5>Dados da Empresa</h5>
                        <form class="needs-validation" action="parceiro-empresa" method="POST" novalidate>
                            <div class="row">
                                
                            <div class="form-row">
                                <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="nomeEmp" id="validationTooltip01" placeholder="Nome do seu Estabelecimento" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                               
                                <div class="col-md-5">

                                    <div class="input-group">
                                        <input type="text" class="form-control" name="teleEmp" id="validationTooltipUsername" placeholder="Telefone do seu Estabelecimento (Apenas numeros)"  required>
                                        <div class="invalid-tooltip">
                                            Please choose a unique and valid username.
                                        </div>
                                    </div>
                                </div>
                                
                                 <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="cnpjEmp" id="validationTooltip01" placeholder="CNPJ do seu Estabelecimento (apenas números)" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                
                                <div class="form-group col-md-3 mb-3">
                                    <select class="custom-select" name="ramoEmp" required>
                                        <option value="">Ramo do Estabelecimento</option>
                                        <option  value="Alimentos">Alimentos</option>
                                        <option value="Metalurgicas">Metalurgicas</option>
                                        <option value="Móveis Planejados">Móveis Planejados</option>
                                        <option value="Construtoras">Construtoras</option>
                                        <option value="HortFrutigranjeira">HortFrutigranjeira</option>
                                        <option value="Tecnologia">Tecnologia</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>

                            </div>
                            
                               
                             <div class="col-md-5 mb-3">
                                  <h5>Endereço do estabelicmento</h5>
                                    <input type="text" class="form-control" name="cepEmp" id="validationTooltip01" placeholder="CEP" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                               
                                <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="estadoEmp" id="validationTooltip01" placeholder="Estado" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="cidadeEmp" id="validationTooltip01" placeholder="Cidade" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="bairroEmp" id="validationTooltip01" placeholder="Bairro" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                 <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="endeEmp" id="validationTooltip01" placeholder="Endereço do seu Estabelecimento" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                 <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="numerEmp" id="validationTooltip01" placeholder="Número" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                 <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="compleEmp" id="validationTooltip01" placeholder="Complemento" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                            
                                <div class="form-row">
                                 <div class="col-md-5 mb-3">
                                  <h5>Contato do representante legal</h5>
                                    <input type="text" class="form-control" name="nomeRepre" id="validationTooltip01" placeholder="Nome do responsável" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                    
                                    <div class="col-md-5 mb-3">               
                                    <input type="text" class="form-control" name="sobrenomeRepre" id="validationTooltip01" placeholder="Sobrenome" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                    
                                    <div class="col-md-5 mb-3">
                                    <input type="email" class="form-control" name="emailRepre" id="validationTooltip01" placeholder="E-mail do Responsável" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                    
                                    <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="celularRepre" id="validationTooltip01" placeholder="Celular do Responsável (apenas números) " value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                    
                                    <div class="col-md-5 mb-3">
                                    <input type="text" class="form-control" name="encontTimeLogistic" id="validationTooltip01" placeholder="Como você conheceu a Time Logistic?" value="" required>
                                    <div class="valid-tooltip">
                                        Looks good!
                                    </div>
                                </div>
                                </div>
                                
                            </div>
                            <button class="btn btn-primary shadow-lg" type="submit">ENVIAR DADOS PARA ANÁLISE <i class="fas fa-arrow-right"></i></button>
                        </form>



                    </div>

                </div>
                <!-- <button class="btn btn- btn-primary">CONTINUAR</button>-->
            </div>
    </body>
</html>
