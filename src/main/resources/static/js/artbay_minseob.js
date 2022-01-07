/**
 * 
 */

$(function(){
	var frm = document.frm_join;
	
	$('#btnJoin').click(function(){
		
	})

	//우편번호 팝업
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
	
	//탈퇴 모달창
	$('#btnOut').click(function(){
		$('#out_chk').fadeIn();
	})
	//탈퇴 모달창 취소
	$('#btnOutCancel').click(function(){
		$('#out_chk').fadeOut();
	})
	
})

