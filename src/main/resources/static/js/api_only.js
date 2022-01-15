/**
 * 
 */

window.onload = function(){
	var frm = document.getElementById('frm_join');
	var now = new Date(); //현재시간
	
	if(frm.btnZip){
		frm.btnZip.onclick = function(){
			//우편번호 버튼 누르면 (생년월일 칸 공백이면)"기본정보를 모두 입력해주세요." 출력. (생년월일 썼으면)나이 계산한뒤 히든박스에 넣기.
			if(frm.birth.value == ""){
				alert("기본정보를 모두 입력해주세요.");
			}else{
				frm.age.value = now.getFullYear()-frm.birth.value.split("-")[0]+1;
				//기본정보가 모두 들어있어야 주소 입력 가능
				new daum.Postcode({
					oncomplete : function(data){
						frm.zip.value = data.zonecode;
						frm.address.value = data.address;
					}
				}).open();
			}
		}
	}
	
	//이메일인증 메일전송
	const btn = document.getElementById('btnEmailCheck');
	
	document.getElementById('frm_emailCheck')
	 .addEventListener('submit', function(event) {
	   event.preventDefault();
		
	   btn.value = '보내는 중...';
	
	   const serviceID = 'default_service';
	   const templateID = 'template_rlaotob';
	
	   emailjs.sendForm(serviceID, templateID, this)
	    .then(() => {
	      btn.value = '완료';
	      $(".emailCheck").fadeOut();
	    }, (err) => {
	      btn.value = '완료';
	      alert(JSON.stringify(err));
	    });
	});
	
}