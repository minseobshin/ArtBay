/**
 * 
 */
 $(function(){
	
})
function bid(){};
bid.view = function(num){
	
	let frm = document.frm_page;
	frm.action = 'Bid.jsp?sub=./view.jsp';
	frm.num.value = num;
	frm.submit();
}
bid.move = function(nowPage){
	let url = 'Bid.jsp?sub=./lsy/';
	let frm = document.frm_member;

	frm.action ='Bid.jsp?sub=./Bid.jsp';
	frm.nowPage.value = nowPage;
	frm.submit();
}	