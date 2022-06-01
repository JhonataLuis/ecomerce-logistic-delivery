/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*CRIA FUNCTION JQUERY JAVASCRIPT PARA EXCLUIR ITENS QUE FORAM ADICIONADOS NOS CARRINHOS*/

$(function(){
   $('tr #delete-item-cart').click(function(e){
       e.preventDefault();
       var elemento = $(this);
       var idproducto = elemento.parent().find('#idarticulo').text();
       
       $.ajax({
            url: 'ExcItemCart',
            type: 'POST',
            data: {idproducto : idproducto},
            success: function (r){
                
                elemento.parent().parent().remove();
                var elementostabla = $('#shop-table tr');
                if(elementostabla.length <= 1){
                    $('cart-container').append("<p>Não há itens no seu carrinho</p>");
                }
                $('#txt-subtotal').text(r);
                $('#txt-total').text(r);
            }
       });
       
   });
   
});