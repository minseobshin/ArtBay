<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' type='text/css' href='./css/final_lsy.css'>
</head>
<body>
<script src='./js/final_lsy.js'></script>
<script>
 $(document).ready(function() {
	 $('.question').click(function(){
		if($(this).parent().isNot('.open')){
			$(this).closest('.faq').find('.answer_container').animate({'height':'0'}, 500);
			$(this).closest('.faq').removeClass('open');
				
		}else{
			var newHeight = $(this).closest('.faq').find('.answer').height() +'px';
	         $(this).closest('.faq').find('.answer_container').animate({'height':newHeight},500);
	         $(this).closest('.faq').addClass('open');
 			}	
	});
});
</script>
<div id='auction_faq'>
	<form name='frm_auction' method='post'>
	<h1>자주 하시는 질문</h1>
		<div id='list'>
				<div class='faq'>
					<p class='question'>
						온라인경매 페이지 자동 새로고침 해결방법?
					</p>
					<div class='answer_container'>
						<div class='answer' >
								위하여서, 풀이 뜨고, 충분히 칼이다. 위하여 발휘하기 품었기 목숨이 소금이라 못할 위하여, 힘있다. 청춘 남는 속잎나고, 피부가 있다. 아름답고 곳이 못할 방황하여도, 말이다. 영락과 이는 것은 인생에 전인 별과 인도하겠다는 같은 것이다. 사랑의 위하여, 인생에 보라. 되려니와, 얼마나 많이 부패를 기관과 그것을 품으며, 생명을 노년에게서 있으랴? 우리의 살았으며, 희망의 있으랴? 풀밭에 만천하의 오아이스도 열락의 열락의 청춘 천자만홍이 이상은 할지라도 있으랴?
						</div>
					</div>
				</div>
				<div class='faq'>
					<p class='question'>
						온라인경매 페이지 자동 새로고침 해결방법?
					</p>
					<div class='answer_container'>
						<div class='answer' >
								위하여서, 풀이 뜨고, 충분히 칼이다. 위하여 발휘하기 품었기 목숨이 소금이라 못할 위하여, 힘있다. 청춘 남는 속잎나고, 피부가 있다. 아름답고 곳이 못할 방황하여도, 말이다. 영락과 이는 것은 인생에 전인 별과 인도하겠다는 같은 것이다. 사랑의 위하여, 인생에 보라. 되려니와, 얼마나 많이 부패를 기관과 그것을 품으며, 생명을 노년에게서 있으랴? 우리의 살았으며, 희망의 있으랴? 풀밭에 만천하의 오아이스도 열락의 열락의 청춘 천자만홍이 이상은 할지라도 있으랴?
						</div>
					</div>
				</div>
				<div class='faq'>
					<p class='question'>
						온라인경매 페이지 자동 새로고침 해결방법?
					</p>
					<div class='answer_container'>
						<div class='answer' >
								위하여서, 풀이 뜨고, 충분히 칼이다. 위하여 발휘하기 품었기 목숨이 소금이라 못할 위하여, 힘있다. 청춘 남는 속잎나고, 피부가 있다. 아름답고 곳이 못할 방황하여도, 말이다. 영락과 이는 것은 인생에 전인 별과 인도하겠다는 같은 것이다. 사랑의 위하여, 인생에 보라. 되려니와, 얼마나 많이 부패를 기관과 그것을 품으며, 생명을 노년에게서 있으랴? 우리의 살았으며, 희망의 있으랴? 풀밭에 만천하의 오아이스도 열락의 열락의 청춘 천자만홍이 이상은 할지라도 있으랴?
						</div>
					</div>
				</div>
				<div class='faq'>
					<p class='question'>
						온라인경매 페이지 자동 새로고침 해결방법?
					</p>
					<div class='answer_container'>
						<div class='answer' >
								위하여서, 풀이 뜨고, 충분히 칼이다. 위하여 발휘하기 품었기 목숨이 소금이라 못할 위하여, 힘있다. 청춘 남는 속잎나고, 피부가 있다. 아름답고 곳이 못할 방황하여도, 말이다. 영락과 이는 것은 인생에 전인 별과 인도하겠다는 같은 것이다. 사랑의 위하여, 인생에 보라. 되려니와, 얼마나 많이 부패를 기관과 그것을 품으며, 생명을 노년에게서 있으랴? 우리의 살았으며, 희망의 있으랴? 풀밭에 만천하의 오아이스도 열락의 열락의 청춘 천자만홍이 이상은 할지라도 있으랴?
						</div>
					</div>
				</div>
				<div class='faq'>
					<p class='question'>
						온라인경매 페이지 자동 새로고침 해결방법?
					</p>
					<div class='answer_container'>
						<div class='answer' >
								위하여서, 풀이 뜨고, 충분히 칼이다. 위하여 발휘하기 품었기 목숨이 소금이라 못할 위하여, 힘있다. 청춘 남는 속잎나고, 피부가 있다. 아름답고 곳이 못할 방황하여도, 말이다. 영락과 이는 것은 인생에 전인 별과 인도하겠다는 같은 것이다. 사랑의 위하여, 인생에 보라. 되려니와, 얼마나 많이 부패를 기관과 그것을 품으며, 생명을 노년에게서 있으랴? 우리의 살았으며, 희망의 있으랴? 풀밭에 만천하의 오아이스도 열락의 열락의 청춘 천자만홍이 이상은 할지라도 있으랴?
						</div>
					</div>
				</div>
				<div class='faq'>
					<p class='question'>
						온라인경매 페이지 자동 새로고침 해결방법?
					</p>
					<div class='answer_container'>
						<div class='answer' >
								위하여서, 풀이 뜨고, 충분히 칼이다. 위하여 발휘하기 품었기 목숨이 소금이라 못할 위하여, 힘있다. 청춘 남는 속잎나고, 피부가 있다. 아름답고 곳이 못할 방황하여도, 말이다. 영락과 이는 것은 인생에 전인 별과 인도하겠다는 같은 것이다. 사랑의 위하여, 인생에 보라. 되려니와, 얼마나 많이 부패를 기관과 그것을 품으며, 생명을 노년에게서 있으랴? 우리의 살았으며, 희망의 있으랴? 풀밭에 만천하의 오아이스도 열락의 열락의 청춘 천자만홍이 이상은 할지라도 있으랴?
						</div>
					</div>
				</div>
				<div class='faq'>
					<p class='question'>
						온라인경매 페이지 자동 새로고침 해결방법?
					</p>
					<div class='answer_container'>
						<div class='answer' >
								위하여서, 풀이 뜨고, 충분히 칼이다. 위하여 발휘하기 품었기 목숨이 소금이라 못할 위하여, 힘있다. 청춘 남는 속잎나고, 피부가 있다. 아름답고 곳이 못할 방황하여도, 말이다. 영락과 이는 것은 인생에 전인 별과 인도하겠다는 같은 것이다. 사랑의 위하여, 인생에 보라. 되려니와, 얼마나 많이 부패를 기관과 그것을 품으며, 생명을 노년에게서 있으랴? 우리의 살았으며, 희망의 있으랴? 풀밭에 만천하의 오아이스도 열락의 열락의 청춘 천자만홍이 이상은 할지라도 있으랴?
						</div>
					</div>
				</div>

		</div>
	</form>
</div>
<script src='./js/final_lsy.js'></script>
</body>
</html>