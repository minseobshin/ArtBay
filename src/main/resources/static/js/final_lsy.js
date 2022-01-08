/**
 * 
 */

 $(function(){
	
	//위탁신청 취소
	
	$('#delConsignBtn').click(function(){
		confirm("선택한 위탁 신청을 취소하시겠습니까?");
			if(confirm){
				alert("취소되었습니다.");
			}
			location.href='/';
	})
	
	//위탁신청 클릭
	$('#consignBtn').click(function(){
			location.href='/';
	})
	
	$('#btnFind').click(function(){
		location.href='/Result';

	})
	
	$('#btnDetail').click(function(){
		
	})
	
	
	
});
