/**
 * 
 */
function bid(){};
/*Result*/
bid.page = function(nowPage){
	$frm = $('#frm_auction')[0];
	$frm.nowPage.value = nowPage;
	$frm.action = 'bidResult';
	$frm.submit();
}
/*FAQ*/
bid.category = function(ctgr){
	$frm_faq = $('#frm_faq')[0];
	$frm_faq.ctgr.value=ctgr;
	$frm_faq.action='faqList';
	$frm_faq.submit();
} 
bid.viewDetail = function(winMonth){
	$frm = $('#frm_auction')[0];
	$frm.winMonth.value=winMonth;
}
//result창에서 상세보기
	$('.detail').click(function(){
		location.href='/bidList';
	})
/*notice*/
function ntc(){};
ntc.noticePage = function(nowPage){
	$frm = $('#frm_notice')[0];
	$frm.nowPage.value = nowPage;
	$frm.action = 'customerNoticeList';
	$frm.submit();
}
ntc.noticeView = function(serial){
	$frm = $('#frm_notice')[0];
	$frm.serial.value = serial;
	$frm.action = 'noticeView'; 
	$frm.submit();
}
/*bidView 응찰내역 상세보기*/
function mBid(){};

mBid.view = function(lot){
	$frm = $("#frm_page")[0];
	$frm.lot.value = lot;
	$param = $("#frm_page").serialize();
	$.ajax({
		url: "/bidView",
		cache: false,
		type: "POST",
		data: $param,
		success: function(){
			window.location.href = "bidView?lot="+lot+"&nowPage="+$frm.nowPage.value;
		}
	})
}

mBid.page = function(nowPage) {
	$frm = $('#frm_page')[0];
	$frm.action = 'mypageBid';
	$frm.submit();
}

function rBid(){};
rBid.page = function(nowPage){
	$frm = $('#frm_auction')[0];
	$frm.nowPage.value = nowPage;
	$frm.action = 'bidResult';
	$frm.submit();
}
	
 $(function(){
	
	
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
	
	//공지작성->공지사항 목록으로 돌아가기===============================writeNotice==================
	$('#btnNoticeList').click(function(){
		$frm = $('#frm_notice')[0];
		$frm.action = "customerNoticeList";
		$frm.submit();
	})
			
	$('#btnWriteNotice').click(function(){
		$frm = $('#frm_notice')[0];
		$frm.nowPage.value=1;
		$frm.action = "noticeInsert";
		$frm.submit();
	})


	//공지 검색====================================noticeList===================
	$('#btnNoticeSearch').click(function(){
		$frm = $('#frm_notice')[0];
		$frm.nowPage.value = 1;
		$frm.action = "customerNoticeList";
		$frm.submit();
	})
	
	
	//선택공지 삭제 버튼
	$('#btnDeleteNotice').click(function(){
		var countChk = 0;
		var chk_Value = [];

		if($('input:checkbox[name=delNotice]:checked').length != 0){
			$('#deleteNotice_alert').show();
			$('input:checkbox[name=delNotice]:checked').each(function(){
				countChk++; //선택한 체크박스 갯수
				chk_Value.push($(this).val());
			});
		}else{
			alert("선택된 공지가 없습니다.");
		}
		$('#countChk').val(countChk);
		$('#hiddenChk').val(chk_Value);	
		
		
	})
	
	//선택한 공지 삭제 모달창 확인버튼
	$('#btnConfirmDelete').click(function(){

		$frm = $('#frm_notice')[0];
		$frm.action='./deleteNotice';
		$frm.submit();
		
	})

	//선택한 공지 삭제 모달창 취소버튼
	$('#btnConfirmCancel').click(function(){
		$('#deleteNotice_alert').hide();
	})
	//선택한 공지 삭제 모달창 X 
	$('#close-area').click(function(){
		$('#deleteNotice_alert').hide();
	})

	
	
	//응찰내역에서 응찰신청=============================================================
	$('#btnRequestApplication').click(function(){
		location.href='./bidApplication';
	})
	
		//공지 저장 버튼
	$('#btnSaveNotice').click(function(){
		
			$param = $('#frm_notice').serialize();
			$.post('noticeSave', $param, function(data){
				alert($param);
				var json = JSON.parse(data);
				if(json.flag=='OK'){ //공지 vo가 저장 성공했을 때
					var $fd = $('#frm_noticeUpload')[0];
					$fd.grp.value = json.grp;
					$fd.enctype = "multipart/form-data";
					$fd.action = "ntcFileUp";
					$fd.submit();
				}else{
					alert("공지 저장 중 오류 발생");
				}
			})
		}
	)
	
	//경매결과 창에서 검색
	$('#btnWinFind').click(function(){	
	$frm = $('#frm_auction')[0];
	$param = $('#frm_auction').serialize();
	alert($param);
	$frm.action="/bidResult";
	$frm.submit();	
	})
		
})	

//경매결과 정렬	
function selectOrder(obj){
	$frm = $('#frm_auction')[0];
	$param = $('#frm_auction').serialize();
	var rSort = $(obj).val();
	$frm.nowPage.value=1;
	$frm.action="/bidResult";
	$frm.submit();	

}

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
	
	

//공지작성summernote
// summernote 
var loadInterval = [];// 이미지가 서버에 upload 되었는지 체크하는 기능

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
				$('#writeNotice').addClass('spinner');
				for (var i = files.length-1; i >= 0; i--) {
					sendFile(i, files[i]);
				}
			},
			onMediaDelete : function(target){ //서머노트에서 삭제를 누르면
				
				var file = decodeURI(target[0].src);
				
				$.ajax({
					data : { target : file}, //file을 맵구조로 전달
					type : 'POST',
					url  : 'ntcSummerDelete', //summerUploadController와 연결 summerUp?flag=delete
					cache : false,
					success : function(msg){
						console.log(msg);
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
		url: 'ntcSummerUp',
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
		$('#writeNotice').removeClass('spinner');
	}
	target.src = img;
	
}	




	
	
	
	
	
	
	


