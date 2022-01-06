/**
 * 
 */
 
 $(function(){
	$("#modalOffBtn").click(function(){
		$(this).parent().parent().hide();
	})
})

function modalOn(modal){
	modal.show();
}

function modalOff(modal){
	modal.parent().hide();
}