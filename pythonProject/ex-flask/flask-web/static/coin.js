$(document).ready(function(){
    $(document).on('click', 'tr', function(){
        alert($(this).find('td').eq(2).text())
        let code =$(this).find('td').eq(2).text();
        let subUrl = "http://192.168.0.23:5555/coin";
        $.ajax({
            url: subUrl
           ,type: 'POST'
           ,data: JSON.stringify({'market':code})
           ,dataType : 'json'
           ,success: function(res){
            console.log(res);
            alert(res[0]['high_price']);
           }
           ,error(e){
                console.log(e);
           }
        })
    });
});