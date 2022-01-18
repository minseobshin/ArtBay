/**
 * 
 */
$(function(){
	
	
	$('#btn-warning-confirm').click(function(){
		$param = $('#frm_bay_insert').serialize();
		alert($param);
		$.post('insertArtWorSave', $param, function(data){
			var json = JSON.parse(data);
			
			if(json.flag == 'OK'){
					var $fd = $('#test')[0];
					$fd.action = "main";
					$fd.submit();
				}else{
					alert("저장중 오류 발생")
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
	if(artwk_name.value==''){
		$("#modal-common").show();
	}else{
		$("#modal-warning").show();
	}
}
function modalOff(modal){
	modal.hide();
}