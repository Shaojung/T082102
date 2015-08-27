<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
	var request;
	function getData()
	{
		request = new XMLHttpRequest();
		request.open("GET", "Test_Ajax1.jsp", true);
		// 這行是設定 request 要去哪取資料，尚未開始取
		// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
		// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
		
		request.onreadystatechange = updateData;
		// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
		
		request.send(null); // 發動 request 去取資料
		
		
	}
	
	function updateData()
	{
		alert(request.readyState);	
	}
</script>
</head>
<body>
<span id="msg">123</span>
<input type="button" value="Get Value!!" onclick="getData()"/>
</body>
</html>