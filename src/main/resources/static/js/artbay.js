/**
 * 
 */
 
 $(function(){
	
	
	$("#modalOffBtn").click(function(){
		$(this).parent().parent().hide();
	})
	
	$(".btnBidCancel").click(function(){
		$(".btnBidCancel").parent().parent().parent().hide();
	})
})

function modalOn(modal){
	modal.show();
}

function modalOff(modal){
	modal.parent().parent().hide();
}