<%-- 
    Document   : cadCartao
    Created on : 14/06/2019, 22:17:20
    Author     : user
--%>

<%@page import="br.com.javabean.bean.BeanUsuarioCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastrar Cartão | Box in Box</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    </head>
    <%
         BeanUsuarioCliente beanUsuCli = (BeanUsuarioCliente) session.getAttribute("datos");
    %>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #5F5CCE; color: #ffffff">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">BOX in BOX</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul style="background-color: #5F5CCE; color: #ffffff" class="nav justify-content-center">

                    </ul>

                </div>
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color: #ffffff">contato</a>
                    </li> 

                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="breadcrumb">
                <h1>Registrar Cartão</h1>
            </div>
            <div class="col">
                <div class="card shadow">
                    <div class="card-body">
                        <form class="was-validated" action="cartao" method="POST">
                        <div class="row">
                        <div class="col-sm-2">
                            <img src="imagens/mastercard.png" class="rounded mx-auto d-block img-circle" alt="..." width="50" height="50">
                            <div class="custom-control custom-radio text-center">
                            <input type="radio" class="custom-control-input" id="customControlValidation1" name="bandeiraCartao" value="Mastercard" required>
                            <label class="custom-control-label" for="customControlValidation1">Mastercard</label>
                          </div>
                        </div>
                            <div class="custom-control custom-radio mb-3">
                        <div class="col-sm-2">
                            <img src="imagens/visa.png" class="mx-auto d-block img-circle" alt="..." width="50" height="50">
                             <div class="custom-control custom-radio mb-3 text-center">
                                <input type="radio" class="custom-control-input" id="customControlValidation2" name="bandeiraCartao" required>
                                <label class="custom-control-label" for="customControlValidation2">Visa</label>
                              </div>
                        </div>
                            </div>
                              <div class="col-sm-2">
                             <img src="imagens/cartaoElo.jpg" class="rounded mx-auto d-block img-circle" alt="..." width="50" height="50">
                                <div class="custom-control custom-radio text-center">
                            <input type="radio" class="custom-control-input" id="customControlValidation3" name="bandeiraCartao" required>
                            <label class="custom-control-label" for="customControlValidation3">Elo</label>
                          </div>
                        </div>
                            <div class="col-sm-2">
                               <img src="imagens/americanexpress.png" class="rounded mx-auto d-block img-circle" alt="..." width="50" height="50">
                              <div class="custom-control custom-radio mb-3 text-center">
                                <input type="radio" class="custom-control-input" id="customControlValidation4" name="bandeiraCartao" value="American Express" required>
                                <label class="custom-control-label" for="customControlValidation4">American Express</label>
                                <div class="invalid-feedback">Marque um item</div>
                              </div>
                            </div>
                        </div>
                             <div class="dropdown-divider"></div> 
                        <div class="form-row">
                         <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Meu ID</label>
                            <input type="text" class="form-control" id="validationTooltip01" name="idUsu_cliente" value="<%=beanUsuCli.getIdUsu_cliente()%>" size="16" maxlength="16" readonly="readonly">
                            <div class="valid-tooltip">
                              Looks good!
                            </div>
                          </div>
                          <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Número do Cartão</label>
                            <input type="number" class="form-control" id="validationTooltip01" name="numeroCartao" placeholder="First name" size="16" maxlength="16" required>
                            <div class="valid-tooltip">
                              Looks good!
                            </div>
                          </div>
                            <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Código de Segurança</label>
                            <input type="text" class="form-control" id="validationTooltip01" name="cvcCartao" placeholder="First name" size="3" maxlength="3" required>
                            <div class="valid-tooltip">
                              Looks good!
                            </div>
                          </div>
                        </div>
                             <div class="form-row">
                                  <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Data de Validade Cartão</label>
                            <input type="date" class="form-control" name="validCartao" placeholder="First name"  required>
                            <div class="valid-tooltip">
                              Looks good!
                            </div>
                          </div>
                           <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">CPF/CNPJ</label>
                            <input type="number" class="form-control" id="validationTooltip01" name="cpfPropriCartao" placeholder="First name"  required>
                            <div class="valid-tooltip">
                              Looks good!
                            </div>
                          </div>
                             </div>
                             <div class="form-row">
                                 <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Nome no Cartão</label>
                            <input type="text" class="form-control" id="validationTooltip01" name="nomePropriCartao" placeholder="First name"  required>
                            <div class="valid-tooltip">
                              Looks good!
                            </div>
                          </div>
                                
                             </div>
                            <div class="btn-group-vertical">
                                <button type="submit" class="btn btn-md btn-success">Registrar Cartão <i class="fas fa-angle-right"></i></button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
</body>
</html>
