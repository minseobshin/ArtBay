/**
 * 
 */
$(function(){
	var storedFiles = [];
	var formData = new FormData($("#frm_upload")[0]);
	/*$("btnCancle").click(function(){ //취소 클릭시 전페이지 이동
	})*/
	
	$('#btn-warning-confirm').click(function(){
		Commas();
		$param = $('#frm_bay_insert').serialize();
		$.post('insertArtWorSave', $param, function(data){
			var json = JSON.parse(data);
			
			if(json.flag == "OK") {
				$frm = $("#frm_upload")[0];
				$frm.lot.value = json.lot;	//lot 번호
				$frm.enctype = "multipart/form-data";
				console.log($frm.enctype)
				$frm.action = "artworkfileUp?job=i";
				$frm.submit();
			}
			else {
				alert("저장중 오류가 발생하였습니다.");
			}		
		})
	})
	
	//경매 리스트로 이동
	$("#btnArtworkList").click(function() {
		$frm = $("#frmArtwork")[0];
		$frm.action = "bidList";	
		$frm.submit();
	});
	

	thumbnailFile.addEventListener('change', function () {
		$file = $("#thumbnailFile")[0];
			var fileList;
	for(var i = 0; i < this.files.length; i++){
			fileList = $file.files[i]; 
			console.log(formData);
			var li = document.createElement('li');
			li.className = 'tui-upload-item';
			var span = document.createElement('span');
			span.className = 'tui-file-name';
			var Content = document.createTextNode(fileList.name + '(' + fileList.size + 'byte)');
			var Remove = document.createTextNode('Remove');
			var fileul =  document.querySelector('#file-ul');
			var btn= document.createElement("input");
			btn.type = "button";
			btn.id = "btnRemove";
			btn.className = 'tui-btn-delete'
 
		    storedFiles.push(fileList[i]);
		    fileul.appendChild(li);
			li.appendChild(span);
			li.appendChild(btn);
			span.appendChild(Content);
			btn.appendChild(Remove);
		}
		console.log(storedFiles)
	})
	addFile.addEventListener('change', function () {
		$file = $("#addFile")[0];
			var fileList;
	for(var i = 0; i < this.files.length; i++){
			fileList = $file.files[i]; 
			console.log(formData);
			var li = document.createElement('li');
			li.className = 'tui-upload-item';
			var span = document.createElement('span');
			span.className = 'tui-file-name';
			var Content = document.createTextNode(fileList.name + '(' + fileList.size + 'byte)');
			var Remove = document.createTextNode('Remove');
			var fileul =  document.querySelector('#file-ul');
			var btn= document.createElement("input");
			btn.type = "button";
			btn.id = "btnRemove";
			btn.className = 'tui-btn-delete'
 
		    storedFiles.push(fileList[i]);
		    fileul.appendChild(li);
			li.appendChild(span);
			li.appendChild(btn);
			span.appendChild(Content);
			btn.appendChild(Remove);
		}
		console.log(storedFiles)
		
	})
	
		/*btnRemove.addEventListener('click', function () {
		  var index	 = li.index();
		console.log(index);
		  removeEventListener(index);
	
		  // 해당 li 태그 제거
		});*/
	
})


//숫자만 입력 가능
$(document).on("keyup", "input:text[numberOnly]", function() {
    $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
});
//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}
function Commas(){
		if($('#direct_price').val()!==''){
			$('#frm_bay_insert')[0].direct_price.value = parseInt(removeCommas($('#direct_price').val()));
		}
			$('#frm_bay_insert')[0].start_price.value = removeCommas($('#start_price').val());
			$('#frm_bay_insert')[0].s_size01.value = removeCommas($('#s_size01').val());
			$('#frm_bay_insert')[0].s_size02.value = removeCommas($('#s_size02').val());
			$('#frm_bay_insert')[0].s_size03.value = removeCommas($('#s_size03').val());
			$('#frm_bay_insert')[0].ho.value = removeCommas($('#ho').val());
}
function validate(){
	if(artwork_name.value==''){
		$("#modal-common").show();
	}else if($('#artwork_ctgr').val()==""){
		$("#modal-ctgr").show();
	}else if($('#start_price').val()==""){
		$("#modal-startprice").show();
	}else if($('#s_size01').val()=="" || $('#s_size02').val()=="" || $('#s_size03').val()=="" || $('#ho').val()=="" ){
		$("#modal-size").show();
	}else if($('#direct_price').val()!==""){
		var start_p = parseInt(removeCommas($('#start_price').val()))
		var diect_p = parseInt(removeCommas($('#direct_price').val()))
		if(start_p>diect_p){
		$("#modal-price").show();
		}else{
			$("#modal-warning").show();
		}
	}else{
		$("#modal-warning").show();
	}
}
function modalOff(modal){
	modal.hide();
}