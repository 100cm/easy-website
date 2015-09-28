/**
 * Created by icepoint on 9/10/15.
 */
var color='rgb(22, 160, 133)';
function move() {

$("#main-container").animate({top:"190px"});

}
//下拉菜单
window.onload = function(){

    function e(obj){return document.getElementById(obj)};
    $(".append_optionsbox").click(function(event){
        var dropmenu=$(".append_optionsbox_layer")
    if($(".append_options").css('backgroundColor')=='rgb(22, 160, 133)'){
        $(".append_options").css('color','black');
        $(".append_options").css('backgroundColor','white');
        dropmenu.css('display','none');

    }
     else{
        $(".append_options").css('backgroundColor','#16a085');
        $(".append_options").css('color','white');
        dropmenu.css('display','block');
    }
     stopBubble(event);
     document.onclick=function(){
         $(".append_options").css('backgroundColor','white');
         $(".append_options").css('color','black');
         dropmenu.css('display','none');


     }
 });

    var menu=$(".append_optionsbox_layer ul li").each(function(){
        $(this).click(function(event){
                var id=$(this).attr("id");
                $(".append_optionsbox i:eq(0)").attr("class",id);
            }

        )
    });

    $(".work-options").mouseover(function(){
        $(".work-options").css("color",color);

    })
    $(".style-options").mouseover(function(){
        $(".style-options").css("color",color);

    })
    $(".study-options").mouseover(function(){
        $(".study-options").css("color",color);

    })
    $(".work-options").mouseout(function(){
        $(".work-options").css("color",'white');

    })
    $(".style-options").mouseout(function(){
        $(".style-options").css("color",'white');

    })
    $(".study-options").mouseout(function(){
        $(".study-options").css("color",'white');

    })
    $(".location-options").mouseover(function(){
        $(".location-options").css("color",color);

    })
    $(".location-options").mouseout(function(){
        $(".location-options").css("color",'white');

    })
    $(".location-options").click(function(){
        $("#location-modal").modal("show");

    })
    $(".work-options").click(function(){
        $("#work-modal").modal("show");

    })
    $("#more-options").click(function(){
        $("#more-search-bar").slideToggle(300,function(){
            if($("#more-options i").attr("class")=="fa fa-angle-down"){
                $("#more-options i").attr("class","fa fa-angle-up" )
            }else{
                $("#more-options i").attr("class","fa fa-angle-down" )
            }


        })
    });

click_navbar(".navbar-left");
click_class(".style-options",".style-down-menu");

    click_class(".study-options",".study-down-menu");



}

function click_class(class_name,show_class_name){
var dropmenu=$(show_class_name);
    var menu=$(class_name);
    var li=$(show_class_name+' ul li');

    $(class_name).click(function(event){
        if($(show_class_name).is(":hidden")){
            $(show_class_name).show();
        }
        else{
            $(show_class_name).hide();
        }

     stopBubble(event);
        document.onclick=function(){

            dropmenu.css("display",'none');
        }
    });
    li.each(function(){

        $(this).click(function(){
            menu.html('<p style="float:left ">'+  $(this).find('a').find('p').html()+'</p>'+'<p style="float: right"><i class="fa fa-angle-down"></i></p>');

            console.log($(this).find('a').html());

        })
    })


}
function click_navbar(class_name){
console.log(class_name);
    var li=$(class_name+' li');

    li.each(function(){
     $(this).click(function(){
         $(this).siblings().attr('class','not-active');

      $(this).attr('class' ,'active');
     })

    })



}



function stopBubble(e){
    if(e && e.stopPropagation){
        e.stopPropagation();    //w3c
    }else{
        window.event.cancelBubble=true; //IE
    }
}