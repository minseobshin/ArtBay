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
	$frm_faq.action='customerFaq';
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
	/*//howto 사이드 메뉴
	$('.howto-subbtn').hide(); 
	$('.howtobtn ul>li').hover(function() {
	$(this).children('div').fadeIn();
	}, function() {
	$(this).children('div').fadeOut('slow');
	});

	$(".howtobtn ul>li>a").attr("style","color:#777");
	*/
	//공지사항 목록으로 돌아가기
	$('#btnViewList').click(function(){
		location.href='/customerNoticeList'
	})
			
	$('#btnWriteNotice').click(function(){
		location.href='/customerWriteNotice'
	})
	
	$('#btnSaveNotice').click(function(){
		alert("작성한 공지가 저장되었습니다.");
		location.href='/customerNoticeList';
	})
	$('#btnDeleteNotice').click(function(){
		alert("선택한 공지가 삭제되었습니다.");
	})
	
	//응찰내역에서 응찰신청
	$('#btnRequestApplication').click(function(){
		location.href='./bidApplication';
	})
	
	//FAQ 카테고리 선택하면 아래에 그 faq만 보이기

	
	$('.faq_desc ul').each(function(index, item){
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
	
	
	//공지작성
	$('#btnSaveNotice').click(function(){
		$param = $('#frm_board').serialize(); //입력된 새 글
		$.post('saveNotice', $param, function(data){ 
			var json = JSON.parse(data);	
		})
	})
	
	// 공지 작성 summernote 
function summer() {

	var fonts = [
		"맑은 고딕", "고딕", "돋음", "바탕", "바탕체", "굴림", "굴림체", "궁서체"
	]
	fonts.sort();
	
	$('#summernote').summernote({
		height: 300,
		fontNames: fonts,
		callbacks: { //이미지를 첨부하는 부분
			onImageUpload: function(files) {
				loadInterval.length = files.length;
				for (var i = files.length-1; i >= 0; i--) {
					sendFile(i, files[i]);
				}
			},
			onMediaDelete : function(target){ //서머노트에서 삭제를 누르면
				
				var file = decodeURI(target[0].src);
				
				$.ajax({
					data : { target : file}, //file을 맵구조로 전달
					type : 'POST',
					url  : 'summerUpDelete', //summerUploadController와 연결 summerUp?flag=delete
					cache : false,
					success : function(msg){
						console.log("delete ok....")
					}
				})
			}
		}
	});
}

function sendFile(intervalPos, file) {
	
	var form_data = new FormData();// form tag 생성
	form_data.append('file', file);
	$.ajax({
		data: form_data,
		type: 'POST',
		url: 'summerUp',
		enctype: 'multipart/form-data',
		cache: false,
		contentType: false,
		processData: false,
		success: function(img) {
			loadInterval[intervalPos] = 
				setInterval(loadCheck.bind(null, intervalPos, img), 1000);
		}
	})
}
function loadCheck(pos, img) {
	
	var target = new Image(); //업로드가 될 이미지
	target.onload = function() {// 이미지가 모두 서버에 저장된 상태 
		clearInterval(loadInterval[pos]);
		$('#summernote').summernote('editor.insertImage', img);
		$('#board').removeClass('spinner');
	}
	target.src = img;
	
}
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
})

