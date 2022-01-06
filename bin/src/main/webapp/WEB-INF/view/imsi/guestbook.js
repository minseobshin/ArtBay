function guestbook(){
	//화살표함수 표현, 람다식(자바)
	let frm = document.frm_guestbook;
	let btnList = document.getElementById('btnList');
	let btnModifyCancel = document.getElementById('btnModifyCancel');
	let btnModify = document.getElementById('btnModify');
	
	if(btnModify !=null){
		btnModify.onclick = function(){
			frm_modify.action = "index.jsp?sub=./guestbook/modify_result.jsp";
			frm_modify.submit();
		}
	}
	
	if(btnModifyCancel != null){
		btnModifyCancel.onclick = function(){
			var frm = document.getElementById('modify_box');
			frm.style.display='none';
		}
	}
	
	
	if(frm != null){
		frm.onsubmit = function(){
			if(frm.doc.value==''){
				alert('내용을 입력하세요....');
				return false;
			}
		}
	}
	if(btnList != null){
		btnList.onclick = function(){
			location.href = 'index.jsp?sub=./guestbook/list.jsp';
		}
	}
}

function modifyFunc(num, doc){
	var frm = document.getElementById("modify_box");
	frm.style.display='block'; //화면에 보임
	frm_modify.doc.value = doc;
	frm_modify.num.value = num;
}


function delChoice(){
	var checkbox = document.getElementsByName("del"); //~name은 배열로 값을 받음
	var delValue = "";
	var url = "";
	
	for(var v of checkbox){
		if(v.checked==true){
			delValue += v.value + ",";
		}
	}
	delValue = delValue.substr(0, delValue.length-1);	//마지막 콤마 없앰
	//동적 jsp include에 의해 delete~를 부름
	url = "index.jsp?sub=./guestbook/delete_result.jsp&delValue=" + delValue;
	location.href=url;
}
