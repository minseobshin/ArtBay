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
			location.href='/home';
	})
	
	//위탁신청 클릭
	$('#consignBtn').click(function(){
			location.href='/application';
	})
	
	$('#btnFind').click(function(){
		location.href='/Result';

	})
	//result창에서 상세보기
	$('.detail').click(function(){
		location.href='/list';
	})
	
	$('.desc01').show();
	$('.desc02').hide();
	$('.desc03').hide();
	$('.desc04').hide();
	$('#consign_step1').click(function(){
		$('.desc01').show();
		$('.desc02').hide();
		$('.desc03').hide();
		$('.desc04').hide();
		return false;
	});
	$('#consign_step2').click(function(){
		$('.desc01').hide();
		$('.desc03').hide();
		$('.desc04').hide();
		$('.desc02').show();
		return false;
	});
	$('#consign_step3').click(function(){
		$('.desc01').hide();
		$('.desc02').hide();
		$('.desc04').hide();
		$('.desc03').show();
		return false;
	});
	$('#consign_step4').click(function(){
		$('.desc01').hide();
		$('.desc02').hide();
		$('.desc03').hide();
		$('.desc04').show();
		return false;
	});
	//클릭하면 배경색 변화
	$('#consign_step1').click(function(){
		$('#consign_step1').css('background-color', '#f60');
		$('#consign_step2').css('background-color', '#ddd');
		$('#consign_step3').css('background-color', '#ddd');
		$('#consign_step4').css('background-color', '#ddd');
	});
	$('#consign_step2').click(function(){
		$('#consign_step1').css('background-color', '#ddd');
		$('#consign_step2').css('background-color', '#f60');
		$('#consign_step3').css('background-color', '#ddd');
		$('#consign_step4').css('background-color', '#ddd');
	});
	$('#consign_step3').click(function(){
		$('#consign_step1').css('background-color', '#ddd');
		$('#consign_step2').css('background-color', '#ddd');
		$('#consign_step3').css('background-color', '#f60');
		$('#consign_step4').css('background-color', '#ddd');
	});
	$('#consign_step4').click(function(){
		$('#consign_step1').css('background-color', '#ddd');
		$('#consign_step2').css('background-color', '#ddd');
		$('#consign_step3').css('background-color', '#ddd');
		$('#consign_step4').css('background-color', '#f60');

	});
	//howto 사이드 메뉴
	$('.howto-subbtn').hide(); 
	$('.howtobtn ul>li').hover(function() {
	$(this).children('div').fadeIn();
	}, function() {
	$(this).children('div').fadeOut('slow');
	});

	$(".howtobtn ul>li>a").attr("style","color:#777");
	
	//공지사항 목록으로 돌아가기
	$('#btnViewList').click(function(){
		location.href='/noticeList'
	})
			
})

