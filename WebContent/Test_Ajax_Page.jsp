<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
	function getData()
	{
		var request = new XMLHttpRequest();
		request.open("GET", "Test_Ajax1.jsp", false);
		// 這行是設定 request 要去哪取資料，尚未開始取
		// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
		// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
		request.send(null); // 發動 request 去取資料
		// alert(request.responseText);
		document.getElementById("msg").innerHTML = request.responseText;
	}
</script>
</head>
<body>
<span id="msg">123</span>
<input type="button" value="Get Value!!" onclick="getData()"/>
</body>
</html>