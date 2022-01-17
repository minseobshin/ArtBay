/**
 * 2021-01. 곽은정
 */
function artbay(){}

artbay.view = function(lot){
	$frm = $("#frm_list")[0];
	$frm.lot.value = lot;
	$param = $("#frm_list").serialize();
	$.ajax({
		url: "/bidView",
		cache: false,
		data: $param,
		success: function(){
			window.location.href = "bidView?lot="+lot+"&nowPage="+$frm.nowPage.value;
		}
	})
}

artbay.page = function(nowPage){
	$frm = $("#frm_list")[0];
	$frm.nowPage.value = nowPage;
	$frm.action = "bidList";
	$frm.submit();
}
	
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

function search(){
	$frm = $("#frm_list")[0];
	$param = $("#frm_list").serialize();
	var cnt = $(".page_combo2").val();
	$.ajax({
		url: "/bidList?cnt="+cnt,
		data: {
			cnt: $(".page_combo2").val(),
			findStr: $frm.findStr.value,
			nowPage: $frm.nowPage.value
		},
		type: "POST",
		cache: false,
		async: true,
		success: function(){
			window.location.href = "/bidList?cnt="+cnt+"&findStr="+$frm.findStr.value+"&nowPage="+$frm.nowPage.value;
			var findStr = $("#findStr").val()
			if(findStr=="") {
				$(".selected_option_area").hide();
				$(".idle_selected_option_area").show();
			}
			$(this).parent().parent().parent().hide();
			var findStrAttach = $(`<div><span style="margin: 0;"> ${findStr} </span> <input type="button" value="X" style="border: none; background-color: transparent;" onclick="$(this).parent().remove()"/></div>`);
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

 $(function(){
	$frm = $("#frm_list")[0];
	//$("form[name='frm_view']").attr({'min':0.5000, 'max':1.5000});
	/* 리스트 화면 작동 */
		
	$(".search_box #btnSearch").on("click", function(){
		search();
	});
	
	
	$("#navAll").on("click", function(){
		$("#navAll").addClass("orangeLi");
		$("#navPaint").removeClass("orangeLi");
		$("#navPottery").removeClass("orangeLi");
		$(".selected_option_area").hide();
		$(".idle_selected_option_area").show();
	})
	
	$("#navPaint").on("click", function(){
		$("#findStr").val("");
		$("#navAll").removeClass("orangeLi");
		$("#navPaint").addClass("orangeLi");
		$("#navPottery").removeClass("orangeLi");
		$(".selected_option_area").hide();
		$(".idle_selected_option_area").show();
	})
	
	$("#navPottery").on("click", function(){
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
		search();
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