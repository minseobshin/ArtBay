/**
 * 
 */
$(function(){
	
	/*$("btnCancle").click(function(){ //취소 클릭시 전페이지 이동
	})*/
	
	$('#btn-warning-confirm').click(function(){
		
		$param = $('#frm_bay_insert').serialize();
		$.post('insertArtWorSave', $param, function(data){
			var json = JSON.parse(data);
			if(json.flag == "OK") {
				$frm = $("#frm_upload")[0];
			/*	$frm.serial.value = json.serial;	//시리얼 번호
				$frm.enctype = "multipart/form-data";*/
				$frm.action = "main"; 
				$frm.submit();
				console.log(json.serial);						
			}
			else {
				alert("저장중 오류가 발생하였습니다.");
			}		
		})
	})
})



//숫자만 입력 가능
$(document).on("keyup", "input:text[numberOnly]", function() {
    $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
});
//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}

function validate(){
	if(artwork_name.value==''){
		$('#frm_bay_insert')[0].start_price.value = removeCommas($('#start_price').val());
		if($('#direct_price').val()==''){
			$('#frm_bay_insert')[0].direct_price.value = removeCommas($('#direct_price').val());
		}
		$("#modal-common").show();
	}else{
		$("#modal-warning").show();
	}
}
function modalOff(modal){
	modal.hide();
}