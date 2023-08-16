<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	번호 : <span id="siNum"></span><br>
	가수 : <span id="siName"></span><br>
	장르 : <span id="siGenre"></span><br>
	제목 : <span id="siTitle"></span><br>
	곡 설명 : <span id="siDesc"></span><br>
	조회수 : <span id="siCnt"></span><br>
	<button onclick="location.href='/views/sing-info/update?siNum=${param.siNum}'">수정</button><button onclick="deleteSinger()">삭제</button>
</div>
<script>
function deleteSinger(){
	const xhr=new XMLHttpRequest();
	const param={
			siNum : ${param.siNum}
	};
	const json=JSON.stringify(param);
	xhr.open('POST','/sing-info/delete');
	xhr.onreadystatechange=function(){
		if(xhr.readyState===4){
			if(xhr.status===200){
				console.log(xhr.responseText);
				if(xhr.responseTedxt==='1'){
					alert('삭제가 완료되었습니다.');
					location.href='/views/sing-info/list';
				}
				else{
					alert('삭제가 실패하였습니다');
				}
			}else{
				console.log(xhr.responseText);
				alert('삭제 오류');
			}
		}
	}
	xhr.send(json);
}
window.addEventListener('load',function(){
	const xhr=new XMLHttpRequest();
	xhr.open('GET','/sing-info/one?siNum=${param.siNum}');
	xhr.onreadystatechange=function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				const sing = JSON.parse(xhr.responseText);
				for(const key in sing ){
					if(document.querySelector('#'+key)){
						document.querySelector('#'+key).innerText = sing[key];
					}
				}
			}
		}
	}
	xhr.send();
})
</script>

</body>
</html>