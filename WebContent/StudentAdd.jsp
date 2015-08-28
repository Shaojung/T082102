<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a student.</title>
<script language="JavaScript">
var request;
function getData()
{
	var t1 = document.getElementById("t1");
	request = new XMLHttpRequest();
	request.open("GET", "StudentCheck.jsp?name=" + t1.value, true);
	// 這行是設定 request 要去哪取資料，尚未開始取
	// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
	// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
	
	var img1 = document.getElementById("img1");
	img1.src = "img/wait.gif";
	
	request.onreadystatechange = updateData;
	// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
	
	request.send(null); // 發動 request 去取資料		
}

function updateData()
{
	if (request.readyState == 4)
	{
		// alert(request.responseText);
		var dup = document.getElementById("dup");
		dup.value = request.responseText.trim();
		
		if (dup.value == "1")
			{
			var img1 = document.getElementById("img1");
			img1.src = "img/a1.png";
			}
		else
			{
			var img1 = document.getElementById("img1");
			img1.src = "img/a0.png";
			}
		// alert(dup.value);
	}
}

function check_data()
{
   var flag = true;
   var message = '';

   // ---------- Check ----------
   var t1 = document.getElementById('t1');
   if(t1.value=='')
   {
      message = message + '姓名不能為空白\n';
      flag = false;
   }
   // ---------- Check ----------
   var t2 = document.getElementById('t2');
   if(t2.value=='')
   {
      message = message + '電話不能為空白\n';
      flag = false;
   }

   var dup = document.getElementById('dup');
   if(dup.value=='1')
   {
      message = message + '姓名不得重複\n';
      flag = false;
   }
   
   if(!flag) 
   {
      alert(message);
   }
   return flag;
}
</script>
</head>
<body>

<form name="student" action="StudentAddCode.jsp" method="post" onSubmit="return check_data();">
<p>Student Name:<input id="t1" type="text" name="student_name" onblur="getData()" />
<img id="img1" width="50px" height="50px" />
</p>
<input type="hidden" id="dup" value="1" />
<p>Student Tel:<input id="t2" type="text" name="student_tel" /></p>
<p><input type="submit" value="ADD!" />
</form>

</body>
</html>