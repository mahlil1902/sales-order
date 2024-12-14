function button_click(objTextBox, objBtnID) {
    if (window.event.keyCode == 13) {
        document.getElementById(objBtnID).focus();
        document.getElementById(objBtnID).click();
    }
}


$(document).ready(function () {
    $('#show_passwordCurrent').hover(function show() {
        $('#txtCurrentPassword').attr('type', 'text');
        $('.icon1').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    },
    function () {
        $('#txtCurrentPassword').attr('type', 'password');
        $('.icon1').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    });
});

$(document).ready(function () {
    $('#show_passwordNew').hover(function show() {
        $('#txtNewPassword').attr('type', 'text');
        $('.icon2').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    },
    function () {
        $('#txtNewPassword').attr('type', 'password');
        $('.icon2').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    });
});
$(document).ready(function () {
    $('#show_passwordNew2').hover(function show() {
        $('#txtNewPassword2').attr('type', 'text');
        $('.icon3').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    },
    function () {
        $('#txtNewPassword2').attr('type', 'password');
        $('.icon3').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    });
});
$(document).ready(function () {
    $('#show_password1').hover(function show() {
        $('#txtPassword').attr('type', 'text');
        $('.icon3').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    },
    function () {
        $('#txtPassword').attr('type', 'password');
        $('.icon3').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    });
});
function myFunctionPass() {
    if ($('#iconPass').hasClass('fa fa-eye-slash')) {
        $('#iconPass').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
        $('#txtPassword').attr('type', 'text');
    }
    else {
        $('#iconPass').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
        $('#txtPassword').attr('type', 'password');
    }
};

$(document).on("hover", ".show_passwordCurrent", function show() {
    $('#txtCurrentPassword').attr('type', 'text');
    $('.icon1').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
},
   function () {
       $('#txtCurrentPassword').attr('type', 'password');
       $('.icon1').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
   });
$("#link").hover(function () {
    document.getElementById("link").style.textDecoration = "underline";
});

