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
		<th>번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>생일</th>
		<tbody id="tBody"></tbody>
		<td colspan="4" align="right"><button onclick="location.href='/views/human-info/insert'">등록</button></td>
	</table>
	
	<script>
		window.addEventListener('load',function(){
			const xhr = new XMLHttpRequest();
			xhr.open('get','/human-info/list');
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200) {
						const obj = JSON.parse(xhr.responseText);
						let html = "";
						for(const map of obj){
							html += "<tr>";
							html += "<td>"+map.hiNum+"</td>";
							html += "<td><a href='/views/human-info/view?hiNum="+map.hiNum+"'/>"+map.hiName+"</td>";
							html += "<td>"+map.hiAge+"</td>";
							html += "<td>"+map.hiBirth+"</td>";
							html += "</tr>";
						}
						document.querySelector('#tBody').innerHTML = html;
					}
				}
			}
			xhr.send();
		})
	</script>
</body>
</html>