<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer List</title>
</head>
<body>
<div class="container">
	<h3>축구인원 목록</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국가</th>
			<th>출생지</th>
			<th>포지션</th>
			<th>골</th>
			<th>어시스트</th>
			<th>출전경기</th>
			<th>별명</th>
			<th>성별</th>
		</tr>
		<tbody id="tBody"></tbody>
	</table>
	<button onclick="location.href='/views/soccer-info/insert'">등록</button>
</div>
<script>
	const getSoccerList = function() {
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/soccer-info/list');
		xhr.onreadystatechange = function() {
			if(xhr.readyState === 4) {
				if(xhr.status === 200) {
					const list = JSON.parse(xhr.responseText);
					let html = '';
					for(const soccer of list) {
						html += '<tr>';
						html += '<td>' + soccer.siNum + '</td>';
						html += '<td><a href="/views/soccer-info/view?siNum=' + soccer.siNum + '">'  + soccer.siName + '</a></td>';
						html += '<td>' + soccer.siCntry + '</td>';
						html += '<td>' + soccer.siBelongs + '</td>';
						html += '<td>' + soccer.siPosition + '</td>';
						html += '<td>' + soccer.siGoals + '</td>';
						html += '<td>' + soccer.siAssist + '</td>';
						html += '<td>' + soccer.siAppearance + '</td>';
						html += '<td>' + soccer.siFeature + '</td>';
						html += '<td>' + soccer.siGender + '</td>';
						html += '</tr>';
					}
					document.querySelector('tBody').innerHTML = html;
				}
			}
		}
		xhr.send();
	}
	window.addEventListener('load',getSoccerList);
</script>
</body>
</html>