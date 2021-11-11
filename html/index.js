$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })


    //
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post('http://fivemac-blackmarket/exit', JSON.stringify({}));
            return
        }
    };

    $("#esya1").click(function() {
        $.post('http://fivemac-blackmarket/esya1', JSON.stringify({}));
        return
    })

    $("#esya2").click(function() {
        $.post('http://fivemac-blackmarket/esya2', JSON.stringify({}));
        return
    })

    $("#esya3").click(function() {
        $.post('http://fivemac-blackmarket/esya3', JSON.stringify({}));
        return
    })


    $("#esya4").click(function() {
        $.post('http://fivemac-blackmarket/esya4', JSON.stringify({}));
        return
    })

    $("#esya5").click(function() {
        $.post('http://fivemac-blackmarket/esya5', JSON.stringify({}));
        return
    })

    $("#esya6").click(function() {
        $.post('http://fivemac-blackmarket/esya6', JSON.stringify({}));
        return
    })

    $("#esya7").click(function() {
        $.post('http://fivemac-blackmarket/esya7', JSON.stringify({}));
        return
    })



    $("#close").click(function() {
        $.post('http://fivemac-blackmarket/exit', JSON.stringify({}));
        return
    })

})