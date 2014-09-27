function show_post(path){
    $.ajax({
        url: path,
        success: function(data){
            console.log(data)
            $(" #popup_pg .main_text").html(data);
        }
    });
}

// popup close and show functions for topic and comments actions
function close_popup(){
    $("#popup_pg").modal("hide");
}

function show_common_popup(path, header_text){
    $(".modal #action_click").attr('onclick','').unbind('click');

    $(".modal .button_text").show();
    if(header_text!='' && header_text != undefined)
        $(".modal .header_text").html(header_text);
    else
        $(".modal .header_text").html('');

    show_post(path)

    $(".modal #action_click").click(function(){close_popup()});
    $(".modal .button_primary").html('Close');

    // Show the dialog/popup
    $(" #popup_pg").modal({backdrop: true});
}

function disable_click(){
    $(".modal #action_click").attr('onclick','').unbind('click');
    $(".modal #action_click").click(function(e){e.preventDefault();});
}