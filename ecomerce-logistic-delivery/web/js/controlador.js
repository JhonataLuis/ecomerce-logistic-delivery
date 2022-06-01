/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var cajita = [];

var listado = document.getElementById('listado');
var usuarioEmpresa = document.getElementById('usuarioEmpresa');
var contador = document.getElementById('contador');

if(cajita.length == 0){
    
    listado.innerHTML = "0";
}

function agregar(){
    cajita.push(usuarioEmpresa.value);
    listado.innerHTML = cajita;
    contador.innerHTML = cajita.length;
}

function excluir(){
    
    var deletar = document.getElementById('deletar');
    alert('Deseja deletar?');
}
