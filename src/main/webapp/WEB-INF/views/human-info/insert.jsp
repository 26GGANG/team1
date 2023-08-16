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
		<tr><td>이름</td>
		<td><input type="text" id="hiName" placeholder="이름"></td></tr>
		<tr><td>나이</td>
		<td><input type="number" id="hiAge" placeholder="나이"></td></tr>
		<tr><td>생일</td>
		<td><input type="text" id="hiBirth" placeholder="생년월일"></td></tr>
		<tr><td>성별</td>
		<td><input type="text" id="hiGender" placeholder="성별"></td></tr>
		<tr><td>주소</td>
		<td><input type="text" id="hiAddress" placeholder="주소"></td></tr>
		<tr><td>신장</td>
		<td><input type="number" id="hiHeight" placeholder="신장"></td></tr>
		<tr><td>체중</td>
		<td><input type="number" id="hiWeight" placeholder="체중"></td></tr>
		<tr><td>종교</td>
		<td><input type="text" id="hiReligion" placeholder="종교"></td></tr>
		<tr><td>신용</td>
		<td><input type="number" id="hiCredit" placeholder="신용점수"></td></tr>
		<td colspan="2" align="right"><button onclick="insertHuman()">등록</button></td>
	</table>
	<script>
		const insertHuman = function(){
			const param={
					hiName : document.querySelector('#hiName').value,
					hiAge : document.querySelector('#hiAge').value,
					hiBirth : document.querySelector('#hiBirth').value,
					hiGender : document.querySelector('#hiGender').value,
					hiAddress : document.querySelector('#hiAddress').value,
					hiHeight : document.querySelector('#hiHeight').value,
					hiWeight : document.querySelector('#hiWeight').value,
					hiCredit : document.querySelector('#hiCredit').value,
					hiReligion : document.querySelector('#hiReligion').value,
			}
			const json = JSON.stringify(param);
			const xhr = new XMLHttpRequest();
			xhr.open('post', '/human-info/insert');
			xhr.setRequestHeader('Content-Type','application/json');
			xhr.onreadystatechange = function(){
				if(xhr.readystate===4){
					if(xhr.status===200){
						if(xhr.responseText==='1'){
							alert('등록 되었습니다.');
							location.href='/views/human-info/list';
						}else{
							alert('등록 실패');
						}
					}
				}
			}
			xhr.send(json);
		}
	</script>
</body>
</html>