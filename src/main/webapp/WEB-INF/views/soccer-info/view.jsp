<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer View</title>
</head>
<body>
<div class="container">
	선수 번호 : <span id="siNum">${param.siNum}</span><br>
	선수 이름 : <span id="siName"></span><br>
	선수 국가 : <span id="siCntry"></span><br>
	선수 출생지 : <span id="siBelongs"></span><br>
	선수 포지션 : <span id="siPosition"></span><br>
	선수 골수 : <span id="siGoals"></span><br>
	선수 어시스트 횟수 : <span id="siAssist"></span><br>
	선수 출전경기수 : <span id="siAppearance"></span><br>
	선수 별명 : <span id="siFeature"></span><br>
	선수 성별 : <span id="siGender"></span><br>
	<button>수정</button>
	<button onclick="deleteSoccer()">삭제</button>
	
</div>
<script>
	function deleteSoccer() {
		const xhr = new XMLHttpRequest();
		xhr.open('POST','/soccer-info/delete?siNum=${param.siNum}');
		xhr.onreadystatechange = function() {
			if(xhr.readyState === 4) {
				if(xhr.status === 200) {
					if(xhr.responseText == 1) {
						alert('Delete Complete');
					}else {
						alert('Delete Fail');
					}
					location.href='/views/soccer-info/list';
				}
			}
		}
		xhr.send();
	}

	const SoccerView = function() {
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/soccer-info/view?siNum=${param.siNum}');
		xhr.onreadystatechange = function() {
			if(xhr.readyState === 4) {
				if(xhr.status === 200) {
					const soccer = JSON.parse(xhr.responseText);
					console.log(soccer);
					for(const key in soccer) {
						if(document.querySelector('#'+key) != null) {
							document.querySelector('#'+key).innerHTML = soccer[key];
						}
					}
				}
			}
		}
		xhr.send();
	}
	window.addEventListener('load',SoccerView);
</script> 
</body>
</html>