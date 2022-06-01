<%-- 
    Document   : cabecalhoParceiro
    Created on : 07/02/2019, 16:49:40
    Author     : rayss
--%>

<%@page import="br.com.javabean.bean.BeanParceCadEmpresa"%>
<%@page import="br.com.javabean.bean.BeanLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Área do Parceiro Empresa | Box in Box</title>
		<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
                <link rel="stylesheet" href="css/main.css">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>


		<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
                <script src="js/main.js"></script>

		<style>
			.ad {
				position: absolute;
				width: 300px;
				height: 250px;
				border: 1px solid #ddd;
				left: 50%;
				transform: translateX(-50%);
				top: 250px;
				z-index: 10;
			}
			.ad .close {
				position: absolute;
				font-family: 'ionicons';
				width: 20px;
				height: 20px;
				color: #fff;
				background-color: #999;
				font-size: 20px;
				left: -20px;
				top: -1px;
				display: table-cell;
				vertical-align: middle;
				cursor: pointer;
				text-align: center;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				$('.close').click(function() {
					$('.ad').css('display', 'none');
				})
			})
		</script>

	</head>
        <%
        BeanLogin beanLog = (BeanLogin) session.getAttribute("usuario");
                    ParceCadEmpresa beanParceEmp = (ParceCadEmpresa) session.getAttribute("empUsu");
        %>
	<body>
		<div class="header">
			<div class="logo">
				<i class="fas fa-tachometer-alt"></i>
				<span>Box in Box</span>
			</div>
                  	<a href="#" class="nav-trigger"><span></span></a>
		</div>
		<div class="side-nav">
			<div class="logo">
				<i class="fas fa-tachometer-alt"></i>
				<span>Box in Box</span>
			</div>
			<nav>
				<ul>
					<li>
						<a href="#">
							<span title="<%=beanParceEmp.getNomeEmp()%>"><i class="fas fa-building"></i></span>
                                                        <span title="<%=beanParceEmp.getNomeEmp()%>"><b><%=beanParceEmp.getNomeEmp()%></b></span>
						</a>
					</li>
                                        <li>
						<a href="ServletPedido?action=pedidos&codParceVend=<%=beanParceEmp.getCodParceVend()%>">

                                                    <span title="Pedidos Realizados"><i class="fa fa-envelope"></i></span>
							<span title="Pedidos Realizados">Pedidos</span>
						</a>
					</li>
					<li>
						<a href="#">

                                                    <span title="Mensagens"><i class="fa fa-envelope"></i></span>
                                                        <span title="Mensagens">Messages</span>
						</a>
					</li>
                                        <li>
						<a href="cadProduct.jsp">

							<span title="Novo Produto"><i class="fas fa-box"></i></span>
                                                        <span title="Novo Produto">Produtos</span>
						</a>
					</li>
                                        <li>
						<a href="products?action=lista&user=<%=beanLog.getUsuLogin()%>">
                                                    <span title="Lista de Produtos"><i class="far fa-list-alt"></i></span>
                                                    <span title="Lista de Produtos">Order List</span>
						</a>
					</li>
					<li class="active">
						<a href="#">
                                                    <span title="Analytics"><i class="fa fa-bar-chart"></i></span>
                                                    <span title="Analytics">Analytics</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span><i class="fas fa-credit-card"></i></span>
							<span>Payments</span>
						</a>
					</li>
                                        <li>
                                                            <div class="dropdown">
                                                                <a class="btn btn-sm btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                    <i class="far fa-user"></i> <span title="<%=beanLog.getUsuLogin()%>"><%=beanParceEmp.getNomeRepre()%></span>
                                                                </a>

                                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                                  <a class="dropdown-item" href="#" style="color: #F4841A"><i class="fas fa-align-justify"></i> Meus Dados</a>
                                                                  <a class="dropdown-item" href="infoBusiness.jsp" style="color: #F4841A"><i class="fas fa-building"></i> Info Business</a>
                                                         
                                                                   <div class="dropdown-divider"></div>
                                                                  <a class="dropdown-item" href="Logout" style="color: #F4841A"><i class="fas fa-sign-out-alt"> Logout</i></a>
                                                                </div>
                                                              </div>
					</li>
				</ul>
			</nav>
                    
                    
		 </div>
            
            
		
