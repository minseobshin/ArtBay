/**
 * 2021-01. 곽은정
 */
function artbay(){}

artbay.view = function(lot){
	$frm = $("#frm_list")[0];
	$frm.lot.value = lot;
	console.log($("#lot").val())
	$frm.action = "bidView";
	$frm.submit();
}

artbay.page = function(nowPage){
	$frm = $("#frm_list")[0];
	$frm.nowPage.value = nowPage;
	$frm.action = "bidList";
	$frm.submit();
}



	
function category(ctgr){
	$frm = $("#frm_list")[0];
	$param = $("#frm_list").serialize();
	$.ajax({
		url: "/bidList",
		type: "POST",
		data: $param,
		success: function(){
			$frm.findStr.value = ctgr;
			$frm.submit();
		},
		error: function(){
			alert("오류")
		}
	})
	/*
	$frm = $("#frm_list")[0];
	$frm.findStr.value=ctgr;
	$frm.action="bidList";
	$frm.submit();
	*/
}

 $(function(){
	$frm = $("#frm_list")[0];
	//$("form[name='frm_view']").attr({'min':0.5000, 'max':1.5000});
	/* 리스트 화면 작동 */
		
	$(".search_box #btnSearch").on("click", function(){
		$frm = $("#frm_list")[0];
		$frm.nowPage.value = 1;
		$frm.action="bidList";
		$frm.submit();
		if($("#findStr").val() !="" ){
			var findStr = $("#findStr").val()
			var findStrAttach = $(`<div><span style="margin: 0;"> ${findStr} </span> <input type="button" value="X" style="border: none; background-color: transparent;" onclick="$(this).parent().remove()"/></div>`);
			$("#selected_findStr").html(findStrAttach);
		}else{
			$("#selected_findStr").html("");
			alert("검색어를 입력하세요.");
		}
	});
	
	$("#navAll").on("click", function(){
		$("#navAll").css("color", "rgb(244, 113, 4)");
		$("#navAll").css("border-bottom", "5px solid rgb(244, 113, 4)");
		$("#navPaint").css("color", "rgb(0, 0, 0)");
		$("#navPaint").css("border-bottom", "none");
		$("#navPottery").css("color", "rgb(0, 0, 0)");
		$("#navPottery").css("border-bottom", "none");
	})
	
	$("#navPaint").on("click", function(){
		$("#navAll").css("color", "rgb(0, 0, 0)");
		$("#navAll").css("border-bottom", "none");
		$("#navPaint").css("color", "rgb(244, 113, 4)");
		$("#navPaint").css("border-bottom", "5px solid rgb(244, 113, 4)");
		$("#navPottery").css("color", "rgb(0, 0, 0)");
		$("#navPottery").css("border-bottom", "none");
	})
	
	$("#navPottery").on("click", function(){
		$("#navAll").css("color", "rgb(0, 0, 0)");
		$("#navAll").css("border-bottom", "none");
		$("#navPaint").css("color", "rgb(0, 0, 0)");
		$("#navPaint").css("border-bottom", "none");
		$("#navPottery").css("color", "rgb(244, 113, 4)");
		$("#navPottery").css("border-bottom", "5px solid rgb(244, 113, 4)");
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
	
	$(".selected_findStr input").on("click", function(){
		$(this).parent().parent().parent().hide();
		$(".idle_selected_option_area").show();
		$frm = $("#frm_list")[0];
		$frm.findStr.value="";
		$frm.action="bidList";
		$frm.submit();
	})
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

function thumbnailChange(src1){
	$("#thumbnail_img").attr("src", src1);
}