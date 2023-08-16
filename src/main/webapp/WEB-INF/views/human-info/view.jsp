<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr><td>번호</td>
		<td id="hiNum"></td></tr>
		<tr><td>이름</td>
		<td id="hiName"></td></tr>
		<tr><td>나이</td>
		<td id="hiAge"></td></tr>
		<tr><td>생일</td>
		<td id="hiBirth"></td></tr>
		<tr><td>성별</td>
		<td id="hiGender"></td></tr>
		<tr><td>주소</td>
		<td id="hiAddress"></td></tr>
		<tr><td>신장</td>
		<td id="hiHeight"></td></tr>
		<tr><td>체중</td>
		<td id="hiWeight"></td></tr>
		<tr><td>종교</td>
		<td id="hiReligion"></td></tr>
		<tr><td>신용</td>
		<td id="hiCredit"></td></tr>
		<tr><td colspan="2" align="right">
		<button onclick="location.href='/views/human-info/update?hiNum=${param.hiNum}'">수정</button>
		<button onclick="location.href='/views/human-info/delete?hiNum=${param.hiNum}'">삭제</button></td></tr>
	</table>
	
	<script>
		window.addEventListener('load',function(){
			const xhr = new XMLHttpRequest();
			xhr.open('get','/human-info/view?hiNum=${param.hiNum}');
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						const obj = JSON.parse(xhr.responseText);
						for(const key in obj){
							document.querySelector('#'+key).innerText = obj[key]
						}
					}
				}
			}
			xhr.send();
		})
	</script>
</body>
</html>