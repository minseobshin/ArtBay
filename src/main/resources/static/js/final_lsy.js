/**
 * 
 */

 $(function(){
	let frm = document.frm_auction;
	let url = 'index.jsp?sub=./imsi/';
	//위탁신청 취소
	if(frm.delConsignBtn){
		frm.delConsignBtn.onclick = function(){
			confirm("선택한 위탁 신청을 취소하시겠습니까?");
			if(confirm){
				alert("취소되었습니다.");
			}
				location.href='/';
		}
	}
	//위탁신청 클릭
	if(frm.consignBtn){
		frm.consignBtn.onclick = function(){
			location.href='/';
		}
	}
	
	if(frm.btnFind){
		frm.btnFind.onclick=function(){
			frm.nowPage.value=1;
			location.href='/Result';

		}
	}
	if(frm.btnDetail){
		//은정씨 페이지
	}
	
	
	
});
