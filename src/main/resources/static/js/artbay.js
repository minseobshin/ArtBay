/**
 * 
 */
 
 $(function(){
	
	
	$("#modalOffBtn").click(function(){
		$(this).parent().parent().hide();
	})
	
	$(".btnBid").click(function(){
		$(".bid_price").show();
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