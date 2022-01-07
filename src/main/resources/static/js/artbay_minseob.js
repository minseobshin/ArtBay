/**
 * 
 */

$(function(){
	var frm = document.frm_join;

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
	
	//결과창 팝업
	$('#btnJoin').click(function(){
		window.open('memberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	$('#btnModify').click(function(){
		window.open('memberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	$('#btnOutChk').click(function(){
		window.open('memberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	$('#btnOk').click(function(){
		opener.window.location = 'memberResult';
		close();
	})
	
	
})

