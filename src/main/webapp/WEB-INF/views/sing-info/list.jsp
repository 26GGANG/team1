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
		<button onclick="location.href='/views/sing-info/insert'">등록</button>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>가수</th>
				<th>장르</th>
				<th>제목</th>
				<th>성별</th>
				<th>작곡가</th>
				<th>작사가</th>
				<th>곡 설명</th>
				<th>조회수</th>
				<th>앨범수</th>
			</tr>
			<tbody id="tBody"></tbody>
		</table>
	</div>
	<script>
		function getSinger(){
			const xhr=new XMLHttpRequest();
			xhr.open('GET','/sing-info/list');
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						const singers=JSON.parse(xhr.responseText);
						let html='';
						for(const sing of singers){
							html+='<tr>';
							html+='<td>'+sing.siNum+'</td>'
							html+='<td>'+sing.siName+'</td>'
							html+='<td>'+sing.siGenre+'</td>'
							html+='<td><a href="/views/sing-info/view?siNum=' + sing.siNum + '">' +sing.siTitle+'</td>'
							html+='<td>'+sing.siTrans+'</td>'
							html+='<td>'+sing.siArtist+'</td>'
							html+='<td>'+sing.siWriter+'</td>'
							html+='<td>'+sing.siDesc+'</td>'
							html+='<td>'+sing.siCnt+'</td>'
							html+='<td>'+sing.siAlbum+'</td>'
						}
						document.querySelector('#tBody').innerHTML=html;
					}
				}
			}
			xhr.send();
		}
		window.addEventListener('load',getSinger);
	</script>
</body>
</html>