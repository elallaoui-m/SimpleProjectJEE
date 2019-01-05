
(function ($) {
    "use strict";
    var input = $('.validate-input .input1000');

    $('.validate-form').on('submit',function(){
                           var check = true;
     
        var password_regex1=/([a-z].*[a-z])([0-9])+([!,%,&,@,#,$,^,*,.,?,_,~])/;
                           var password_regex2=/([0-9])/;
                           var password_regex4=/([A-Z])/;
                           var password_regex3=/([!,%,&,@,#,$,^,*,.,?,_,~])/;
                           var pass=$("#password").val();
                           var confirm=$("#confirm").val();
                           
                           
                           if(pass.trim()!=0)
                           {
                       if(pass.length<8 || password_regex1.test(pass)==false || password_regex2.test(pass)==false || password_regex3.test(pass)==false)
                           {
                    	 $('#invalid-pass').html( "<i class='ion-close-circled'></i>"+"  "+"enter strong password" );
                    	  // var article = document.getElementById('electriccars');
                    	 //  alert(article.getAttribute("data-columns"));
                           check= false;
                           }
                       else
                    	   {
                    	   if(password_regex4.test(pass)==true)
                    		   {
                    		   $('#invalid-pass').html( "<i class='ion-close-circled'></i>"+"  " +"don t use upper letteres");
                               check= false;
                    		   }
                    	   else{
                    	   if(pass!=confirm)
                           {
                    		   $('#invalid-pass').html( "<i class='ion-close-circled'></i>"+"  " +"not match");
                           check= false;
                           }
                    	   }
                    	   }
                           }
                           else{
                        	   $('#invalid-pass').html( "<i class='ion-close-circled'></i>"+"  " +"enter password");
                           check=false;
                           }
            var day=$('#day').val();
            var month=$('#month').val();
            var year=$('#year').val();
                    if(day.trim()!=" " && year.trim()!=" " && month.trim()!=" ")
                           {
                           var SelectedDate = new Date(day+"/"+month+"/"+year);
                       
                           var CurrentDate = new Date();
                           
                           if (isValidDate(day+"/"+month+"/"+year)==false || SelectedDate >= CurrentDate )
                            {
                           $('#invalid-date').html( "<i class='ion-close-circled'></i>"+"  " +"invalid date");
                                 check=false;
                           
                            }
                           }
                           else
                           {
                            $('#invalid-date').html("enter date");
                           check=false;
                           }
        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });
    $("#toggle-eye").click(function(){
    	$(this).toggleClass("icon-toggle");
    	var type1 = $('#password').attr("type"); 
     	var type2 = $('#confirm').attr("type"); 
     	if( type1 === 'password' ){
     		$('#password').attr("type","text"); 
         	$('#confirm').attr("type","text"); 
         	  $(this).removeClass("ion-eye-disabled");
         	 $(this).addClass("ion-eye");
     		}else{
     			$('#password').attr("type","password"); 
             	$('#confirm').attr("type","password"); 
             	 
              	 $(this).removeClass("ion-eye");
              	 $(this).addClass("ion-eye-disabled");
     		}
      });

 $('.validate-form .input100').each(function(){
                                    $(this).focus(function(){
                                                  hideValidate(this);
                                                  });
                                    });
    $('.date-').each(function(){
        $(this).focus(function(){
           $('#invalid-date').html(" ");
        });
    });
    $('.pass-').each(function(){
        $(this).focus(function(){
           $('#invalid-pass').html(" ");
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
    if($(input).attr('type') == 'tel' || $(input).attr('name') == 'phonenumber') {
                                                                     
    if(isNaN($(input).val()) || $(input).val().length!= 10 )
                                                                     
 {
    	return false;
     }
     
     }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }

 function isValidDate(s) {
 var bits = s.split('/');
 var d = new Date(bits[2] + '/' + bits[1] + '/' + bits[0]);
return !!(d && (d.getMonth() + 1) == bits[1] && d.getDate() == Number(bits[0]));

                        /*$.validator.addMethod("pwcheck", function(value) {
                   return /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/.test(value)
                   });*/
 }

})(jQuery);
                                                                     

