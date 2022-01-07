/**
 * 
 */
 
 $(function(){
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
	

			
})



function modalOn(modal){
	modal.show();
}

function modalOff(modal){
	modal.parent().parent().hide();
}