/**
 * 
 */

$(function(){
	var frm = document.frm_join;
	
	$('#btnJoin').click(function(){
		
	})

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
	
})

