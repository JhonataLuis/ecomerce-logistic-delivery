<%-- 
    Document   : driverEmp
    Created on : 06/02/2019, 17:12:04
    Author     : rayss
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realize entregas com a Box in Box</title>
    </head>
    <c:import url="cabecalho.jsp"/>
    <body>

        <div class="container">
            <div>
                <h2><b>Box in Box</b></h2>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card shadow">
                        <div class="card-body">
                            <h4 class="card-title">Aumente a entrega dos seus produtos com a Box in Box</h4>
                            <p class="card-text">Os parceiros Box in Box tem até 50% de crescimento com entregas de produtos.</p>
                     
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                SEJA PARCEIRO AGORA <i class="fas fa-arrow-right"></i>
                            </button>
                                        </div>
                    </div>


                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <img src="imagens/caixas.jpg" class="img-fluid float-right">
                    </div>
                </div>
            </div>

            

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Pré-Requisitos</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Para se empresa parceiro, você deve concordar com os termos:</p>
                            
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                           <label class="form-check-label" for="inlineRadio1">Meu estabelecimento possui um computador com windows e acesso a internet</label>
                            </div>
                            
                           
                           <div class="custom-control custom-checkbox">
    <input type="checkbox" class="custom-control-input" id="customControlInline">
    <label class="custom-control-label" for="customControlInline">Tenho CNPJ regularizado</label>
  </div>
                           
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a href="cadBusiness.jsp" class="btn btn-primary">ENVIAR <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<c:import url="rodape.jsp"/>
