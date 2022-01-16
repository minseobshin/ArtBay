/**
 * 
 */
function bid(){};
bid.view = function(lot){
	$frm=$('#frm_auction')[0];
	$frm.lot.value = lot;
	$frm.action = 'mypageListView'
	$frm.submit();
}
bid.page = function(nowPage) {
	$frm = $('#frm_search')[0];
	$frm.nowPage.value = nowPage;
	$frm.action = 'mypageBid';
	$frm.submit();
}
bid.category = function(ctgr){
	$frm_faq = $('#frm_faq')[0];
	$frm_faq.ctgr.value=ctgr;
	$frm_faq.action='faqList';
	$frm_faq.submit();
} 

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
	//customer 위탁안내 부분 
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
	
	//공지사항 목록으로 돌아가기
	$('#btnViewList').click(function(){
		location.href='/customerNoticeList'
	})
			
	$('#btnWriteNotice').click(function(){
		$frm = $('#frm_notice')[0];
		$frm.nowPage.value=1;
		$frm.action = "noticeInsert";
		$frm.submit();
	})
	
	$('#btnSaveNotice').click(function(){
		$frm = $('#frm_writeNotice');
		$param = $frm.serialize();
		if($frm.doc.value != null || $frm.subject.value != null){
			$.post('noticeSave', $param, function(data){
				var json = JSON.parse(data);
				
				if(json.flag=='OK'){
					alert("공지가 저장되었습니다.")
				}else{
					alert("저장 중 오류 발생");
				}
			})
		}else{
			alert("모든 항목을 입력하세요");
		}
	})
	$('#btnDeleteNotice').click(function(){
		alert("선택한 공지가 삭제되었습니다.");
	})
	
	//응찰내역에서 응찰신청
	$('#btnRequestApplication').click(function(){
		location.href='./bidApplication';
	})
	
	//FAQ 카테고리 선택하면 아래에 그 faq만 보이기	
	/*$('.faq_desc ul').each(function(index, item){
		$(item).hide();	
	})
	
	$('.faq_desc ul').eq(0).show();
	//faq 카테고리 별 리스트 변경
	$('.active').each(function(index, item){
		
		$(this).click(function(){
			var i = $(item).index();
			var selectedFaq = $('.faq_desc ul').eq(i);
			$('.faq_desc ul').not(selectedFaq).hide();
			selectedFaq.show();
			
				
		})
	})
	$('.active').eq(0).addClass('clicked_menu');
		
	$('.active').each(function(index, item){
		$(this).attr('menu-index',index);	
	}).click(function(){
		var index = $(this).attr('menu-index');
		$('.active[menu-index=' + index +']').addClass('clicked_menu');
		$('.active[menu-index !=' + index + ']').removeClass('clicked_menu');
	});
	*/
	
	

	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
})

