/**
 * 
 */

window.onload = function(){
	//아이디찾기
	document.getElementById('frm_findId9')
	 .addEventListener('submit', function(event) {
	   event.preventDefault();
	
	   const serviceID = 'default_service';
	   const templateID = 'template_findId';
	
	   emailjs.sendForm(serviceID, templateID, this)
	    .then(() => {
	    }, (err) => {
	      alert(JSON.stringify(err));
	    });
	});
	
	//임시비번발급
	document.getElementById('frm_findPwd9')
	 .addEventListener('submit', function(event) {
	   event.preventDefault();
	
	   const serviceID = 'default_service';
	   const templateID = 'template_findId';
	
	   emailjs.sendForm(serviceID, templateID, this)
	    .then(() => {
	    }, (err) => {
	      alert(JSON.stringify(err));
	    });
	});
	
}