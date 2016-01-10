/**
 * Created by icepoint on 9/10/15.
 */
var color='rgb(22, 160, 133)';
function move() {

$("#main-container").animate({marginTop:"0px"});

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

// Custom checkbox and radios
function setupLabel() {
    // Checkbox
    var checkBox = ".checkbox";
    var checkBoxInput = checkBox + " input[type='checkbox']";
    var checkBoxChecked = "checked";
    var checkBoxDisabled = "disabled";

    // Radio
    var radio = ".radio";
    var radioInput = radio + " input[type='radio']";
    var radioOn = "checked";
    var radioDisabled = "disabled";

    // Checkboxes
    if ($(checkBoxInput).length) {
        $(checkBox).each(function(){
            $(this).removeClass(checkBoxChecked);
        });
        $(checkBoxInput + ":checked").each(function(){
            $(this).parent(checkBox).addClass(checkBoxChecked);
        });
        $(checkBoxInput + ":disabled").each(function(){
            $(this).parent(checkBox).addClass(checkBoxDisabled);
        });
    };

    // Radios
    if ($(radioInput).length) {
        $(radio).each(function(){
            $(this).removeClass(radioOn);
        });
        $(radioInput + ":checked").each(function(){
            $(this).parent(radio).addClass(radioOn);
        });
        $(radioInput + ":disabled").each(function(){
            $(this).parent(radio).addClass(radioDisabled);
        });
    };
};
var toggleHandler = function(toggle) {
    var toggle = toggle;
    var radio = $(toggle).find("input");

    var checkToggleState = function() {
        if (radio.eq(0).is(":checked")) {
            $(toggle).removeClass("toggle-off");
        } else {
            $(toggle).addClass("toggle-off");
        }
    };

    checkToggleState();

    radio.eq(0).click(function() {
        $(toggle).toggleClass("toggle-off");
    });

    radio.eq(1).click(function() {
        $(toggle).toggleClass("toggle-off");
    });
};

$(document).ready(function() {
    $(".toggle").each(function(index, toggle) {
        toggleHandler(toggle);
    });
});


$(document).ready(function(){
    $("html").addClass("has-js");

    // First let's prepend icons (needed for effects)
    $(".checkbox, .radio").prepend("<span class='icon'></span><span class='icon-to-fade'></span>");

    $(".checkbox, .radio").click(function(){
        setupLabel();
    });
    setupLabel();
});



$(document).ready(function() {

    $("#tagsinput").tagsInput();

    $("#p-tagsinput").tagsInput();

    $("#choose-file").click(function(){

        $("#doc").trigger('click');

    });

    $("button[name='saveButton']").click(function(){

        console.log(1);
        $(this).closest('form').submit();
        $(this).closest('.info-list-form').css("display","none");
        $(this).closest('.info-list-form').prev().css("display","");


    })

    $("button[name='cancelButton']").click(function(){

        $("a[name='edit-a']").css("display","");
        $(this).closest('.info-list-form').css("display","none");
        $(this).closest('.info-list-form').prev().css("display","");


    })

    $("a[name='edit-a']").click(function(){

        $("a[name='edit-a']").css("display","none");
        $(this).css("display","");
        $(this).closest('.panel-header').next().css("display","none");
        $(this).closest('.panel-header').next().next().css("display","");


    })



})



