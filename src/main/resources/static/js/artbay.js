/**
 * 2021-01. 곽은정
 */
function artbay(){}

//목록에서 작품 클릭 시 작품 상세 조회 페이지로 전환
artbay.view = function(lot){
	$frm = $("#frm_list")[0];
	$frm.lot.value = lot;
	$param = $("#frm_list").serialize();
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

//작품 상세 조회 하단에서 작가의 다른 작품 이미지 클릭 시 클릭한 작품 상세 조회 화면으로 페이지 전환
artbay.othersView = function(lot){
	$frm = $("#frm_view")[0];
	$("#othersLot").val(lot);
	$param = $("#frm_view").serialize();
	$.ajax({
		cache: false,
		type: "POST",
		data: $param,
		success: function(){
			window.location.href = "bidView?lot="+lot+"&nowPage="+$frm.nowPage.value;
		}
	})
}

//목록에서 페이지 전환
artbay.page = function(nowPage){
	$frm = $("#frm_list")[0];
	$frm.nowPage.value = nowPage;
	$frm.action = "bidList";
	$frm.submit();
}

//목록에서 카테고리별 작품 조회
function category(ctgr){	
	$frm = $("#frm_list")[0];
	$frm.findStr.value=ctgr;
	$param = $("#frm_list").serialize();
	const cnt = $(".page_combo2").val();
	$.ajax({
		url: "/bidList?cnt="+cnt,
		type: "POST",
		cache: false,
		async: true,
		data: $param,
		success: function(){
		}
	})
}

//목록에서 작품명 또는 작가명으로 작품 검색
function search(){
	$frm = $("#frm_list")[0];
	$param = $("#frm_list").serialize();
	const sort = $(".page_combo1").val();
	const cnt = $(".page_combo2").val();
	const findStr = $("#findStr").val()
	$.post({
		url: "/bidList",
		data: $param,
		type: "POST",
		cache: false,
		async: true,
		success: function(){
			window.location.href = "/bidList?cnt="+cnt+"&findStr="+$frm.findStr.value+"&nowPage="+$frm.nowPage.value+"&sort="+sort;
			if(findStr=="") {
				$(".selected_option_area").hide();
				$(".idle_selected_option_area").show();
			}
			$(this).parent().parent().parent().hide();
			var findStrAttach = $(`<div><span style="margin: 0;"> ${findStr} </span> <input class="btnSearchX" type="button" value="X" style="border: none; background-color: transparent;" /></div>`);
			$("#selected_findStr").html(findStrAttach);
		}
	})
	
	/*
	$frm = $("#frm_list")[0];
	$frm.nowPage.value = 1;
	const cnt = $(".page_combo2").val();
	$frm.action="/bidList?cnt="+cnt;
	$frm.submit();
	if($("#findStr").val() !="" ){
		var findStr = $("#findStr").val()
		var findStrAttach = $(`<div><span style="margin: 0;"> ${findStr} </span> <input type="button" value="X" style="border: none; background-color: transparent;" onclick="$(this).parent().remove()"/></div>`);
		$("#selected_findStr").html(findStrAttach);
	}else{
		$("#selected_findStr").html("");
	}
	*/
}

/*
function off(){
	//모달을 띄웠을 때 반투명 바탕을 눌렀을 때 모달이 사라지도록
	$(window).on("click", function(event) {
		console.log(event.target.class)
		if (event.target.class != "thumbnailHiddenDiv") {
          $(".thumbnailHidden").hide();
       }
    });
}
*/

 $(function(){
	if($(".btnSearchX")){
	$.ajax({
			url:"/bidList",
			success: $(".btnSearchX").on("click", function(){
				$("#findStr").val("")
				window.location.href = "/bidList";
				$(this).parent().parent().parent().remove();
				$("#selected_findStr").html("");
		})
		})
	}
	
	//오른쪽 응찰내역 div 위치가 일정 위치에 다다르면 scroll을 멈추도록
	if($(window).width()>1300){
	$(window).scroll(function(){
   		$(".view_right").css("top", Math.max(0, 150 - $(this).scrollTop()));

   		if ($(window).scrollTop() > 900) {
            $(".view_right").css({
                position: 'fixed',
                top: Math.max(900-$(this).scrollTop())
            });
        } else {
		if($(window).width()<1300){
	            $(".view_right").css({
	                display: 'block',
	                position: 'static'
	            });
	        }
		}
	});
		
	}

	$frm = $("#frm_list")[0];

	
	$("#navAll").on("click", function(){
		search();
		$("#navAll").addClass("orangeLi");
		$("#navPaint").removeClass("orangeLi");
		$("#navPottery").removeClass("orangeLi");
		$(".selected_option_area").hide();
		$(".idle_selected_option_area").show();
	})
	
	$("#navPaint").on("click", function(){
		search();
		$("#findStr").val("");
		$("#navAll").removeClass("orangeLi");
		$("#navPaint").addClass("orangeLi");
		$("#navPottery").removeClass("orangeLi");
		$(".selected_option_area").hide();
		$(".idle_selected_option_area").show();
	})
	
	$("#navPottery").on("click", function(){
		search();
		$("#findStr").val("");
		$("#navAll").removeClass("orangeLi");
		$("#navPaint").removeClass("orangeLi");
		$("#navPottery").addClass("orangeLi");
		$(".selected_option_area").hide();
		$(".idle_selected_option_area").show();
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
	
	//창의 width가 1300px 이상이 되면 특정 div들이 사라지도록
	$(window).resize(function(){
		if($(window).width()>=1300){
			$(".btnBidList ul").remove();
			$(".bidList .bidHistory").remove();
		}
		location.reload();
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
	
	$(".selected_findStr input").on("click", function(){
		$(this).parent().parent().parent().hide();
		$(".idle_selected_option_area").show();
		search();
	})
	
	
})
//버튼을 누르면 url 복사. 아직 완벽히 구현되지 않음.
function clip(modal){
	var url = window.document.location.href;
	$(".pastedUrl").val(url);
	modal.show();
}

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

//대표 이미지 변경
function thumbnailChange(src){
	$("#thumbnail_img").attr("src", src);
	$("#thumbnailHiddenImg").attr("src", src);
}

//이미지 확대
function thumbnailMagnify(src, div){
	div.show();
	$(".thumbnailHiddenImg").attr("src", src);
	/*
	if($(".thumbnailHidden").css("display")=="none"){
		console.log("뭔데")
	}else{
		console.log("됨")
		$(window).on("click", function(event) {
			console.log("됨!!")
			console.log(event.target.attr("class"))
	    });
	}*/
}