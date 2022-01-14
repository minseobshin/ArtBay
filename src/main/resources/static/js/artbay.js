/**
 * 2021-01. 곽은정
 */
 function artbay(){
	
}
 artbay.view = function(lot){
	$frm = $("#frm_list")[0];
	$frm.lot.value = lot;
	console.log($("#lot").val())
	$frm.action = "bidView";
	$frm.submit();
}
 $(function(){
	//$("form[name='frm_view']").attr({'min':0.5000, 'max':1.5000});
	/* 리스트 화면 작동 */
	$(".search_box #btnSearch").click(function(){
		if($("#findStr").val() !="" ){
			const findStr = $("#findStr").val()
			const findStrAttach = $(`<div><span style="margin: 0;"> ${findStr} </span> <input type="button" value="X" style="border: none; background-color: transparent;" onclick="$(this).parent().remove()"/></div>`);
			$(".selected_findStr").append(findStrAttach);			
		}else{
			alert("검색어를 입력하세요.");
		}
	})
	
	$("#modalOffBtn").click(function(){
		$(this).parent().parent().hide();
	})
	
	$(".btnBidCancel").click(function(){
		$(".btnBidCancel").parent().parent().parent().hide();
	})
	
	 if(matchMedia("screen and (max-width: 1300px)").matches){
		$(".btnBidList ul").remove();
		$(".bidList .bidHistory").remove();
	}
	
	$(window).resize(function(){
		if($(window).width()>=1300){
			$(".btnBidList ul").remove();
			$(".bidList .bidHistory").remove();
		}
	})
	
	if($(window).width()<1300){
		$(window).on("resize", function(){
			$(".bid_price").hide();
		})
	}
	
	$('.howtobtn>ul>li').hover(function() {
		$(this).children('div').css("display", "block");
		$(this).children('div').fadeIn();
	}, function() {
		$(this).children('div').fadeOut('slow');
	});			
})

/*howto화면 버튼 누르면 하위 메뉴 등장*/
function subMenuOn(e){
	e.preventDefault();
	$(".howtobtn .active div ul").stop().slideDown();
}

function modalOn(modal){
	modal.show();
}

function modalOff(modal){
	modal.parent().parent().hide();
}