/**
 * 
 */

window.onload = function(){
	var frm = document.getElementById('frm_join');
	
	if(frm.btnZip){
		frm.btnZip.onclick = function(){
			new daum.Postcode({
				oncomplete : function(data){
					frm.zip.value = data.zonecode;
					frm.address.value = data.address;
				}
			}).open();
		}
	}
	
	//이메일인증 메일전송
	const btn = document.getElementById('btnEmailCheck');
	const btn2 = document.getElementById('btnEmailCheck2');
	
	document.getElementById('frm_emailCheck')
	 .addEventListener('submit', function(event) {
	   event.preventDefault();
		
	   btn.value = '보내는 중...';
	   btn2.value = '보내는 중...';
	
	   const serviceID = 'default_service';
	   const templateID = 'template_rlaotob';
	
	   emailjs.sendForm(serviceID, templateID, this)
	    .then(() => {
	      btn.value = '완료';
	      btn2.value = '완료';
	      $(".emailCheck").fadeOut();
	    }, (err) => {
	      btn.value = '완료';
	      btn2.value = '완료';
	      alert(JSON.stringify(err));
	    });
	});
	
}