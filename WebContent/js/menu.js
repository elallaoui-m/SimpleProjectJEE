// function for removing an element
function hide_element(width_change,element_to_remove)
{
		
if( $(window).width() <= width_change )
	  {
		 $(element_to_remove).remove();
	  }
}
 function move_element(element,newparent,width_move,oldparent,element_before)
{
	if( $(window).width() < width_move )
	$(element).detach().appendTo(newparent);
	if( $(window).width() > width_move )
		{
			if(!element_before)
	
		$(element).detach().appendTo(oldparent);
			else
				$(element).detach().insertBefore(element_before);				
				

		}
	
		
}

$(window).resize(function() 
{
                 myWidth = window.innerWidth;
                
	
				if(myWidth > 800)
                 {
                 $("#popup").css("display", "none");
                   $("#under_menu").css("display", "none");
                 
                 }
                 
                                  
                 
	
				 
})	
function toggle_effect(element_toggle)

{
   if($( element_toggle ).css("display")=="none")
$( element_toggle ).show( 'blind',  200 );
    
    else
        $( element_toggle ).hide( 'blind',  200 );
}
golobal_var_s_m=0;
function show_sub_menu()
{
	
element_=$(".button_for_cat_slid");

	
	if(golobal_var_s_m===0)
		
	{
		element_.css("margin-bottom", "-7px").css("transform", "rotate(0deg)");
	++golobal_var_s_m;
	}
	else 
		{
			element_.css("margin-bottom", "5px").css("transform", "rotate(-180deg)");
			golobal_var_s_m=0;
		}
	toggle_effect('#sub_menu');
}
var container_slid=$('#container_popup_menu');
var popup=$('#popup');
function show_slid_menu()
{
	 popup.css('display','block');
	 container_slid.show('slide',500)
}
function hide_slid_menu()
{
	
	popup.hide('fade',500)
	
		 container_slid.hide('slide',200);
}
