/**
 * 
 */

function post(path, params, method) {
    method = method || "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
        }
    }

    document.body.appendChild(form);
    form.submit();
};


function init() {
		  gapi.load('auth2', function() { // Ready. 
			  }); }
		
		
function signOut() {
	gapi.auth2.init({
		  client_id: '922252162446-9djl5kksq5beha2m35a0aoo5vshj398e.apps.googleusercontent.com'
	})
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut();
    auth2.disconnect();
    //windows.location.href = 'Login.jsp';
  };

function onSignIn(googleUser) {
// window.location.href='success.jsp';

	
	 window.location.href = 'index.html?email='+email+'&name='+name;
	  var profile = googleUser.getBasicProfile();
	  var imagurl=profile.getImageUrl();
	  var name=profile.getName();
	  var email=profile.getEmail();
	  
	  //document.getElementById("myImg").src = imagurl;
	  //document.getElementById("name").innerHTML = name;

	  //document.getElementById("myP").style.visibility = "hidden";
	  
	  window.location.href = 'index.html?email='+email+'&name='+name;
	  

	  //document.getElementById("status").innerHTML = 'Welcome '+name+'!<a href=success.jsp?email='+email+'&name='+name+'/>Continue with Google login</a></p>'

	   
	   
 };