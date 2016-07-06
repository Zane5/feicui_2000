$(function() {
    var action;
    $(".product_amount button").mousedown(function () {
        btn = $(this);
        input = btn.closest('.product_amount').find('input');
        btn.closest('.product_amount').find('button').prop("disabled", false);
        clearInterval(action);

      if (btn.attr('data-dir') == 'up') {
            action = setInterval(function(){
                if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                    input.val(parseInt(input.val())+1);
                }else{
                    btn.prop("disabled", true);
                    clearInterval(action);
                }
            }, 70);
      } else if(btn.attr('data-dir') == 'dwn'){
            action = setInterval(function(){
                if ( input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min')) ) {
                    input.val(parseInt(input.val())-1);
                }else{
                    btn.prop("disabled", true);
                    clearInterval(action);
                }
            }, 70);
      } else if(btn.attr('data-dir') == 'up10'){
            action = setInterval(function(){
                if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                    input.val(parseInt(input.val())+10);
                }else{
                    btn.prop("disabled", true);
                    clearInterval(action);
                }
            }, 70);
      } else if(btn.attr('data-dir') == 'up50'){
            action = setInterval(function(){
                if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                    input.val(parseInt(input.val())+50);
                }else{
                    btn.prop("disabled", true);
                    clearInterval(action);
                }
            }, 70);
      } else if(btn.attr('data-dir') == 'up100'){
            action = setInterval(function(){
                if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                    input.val(parseInt(input.val())+100);
                }else{
                    btn.prop("disabled", true);
                    clearInterval(action);
                }
            }, 70);
      } else if(btn.attr('data-dir') == 'up200'){
            action = setInterval(function(){
                if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                    input.val(parseInt(input.val())+200);
                }else{
                    btn.prop("disabled", true);
                    clearInterval(action);
                }
            }, 70);
      }
    }).mouseup(function(){
        clearInterval(action);
    });
});





