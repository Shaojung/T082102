<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function add() {
	  var ul = document.getElementById("list");
	  var li = document.createElement("li");
	  var msg = document.getElementById("msg");
	  li.appendChild(document.createTextNode(msg.value));
	  ul.appendChild(li);
	  
	  var form1 = document.getElementById("form1");
	  var input = document.createElement("input");
      input.type = "hidden";
      input.name = "msg";
      input.value = msg.value;
      form1.appendChild(input);
	}
</script>
</head>
<body>
<input type="text" id="msg" />
<input type="button" id="btn" value="add" onclick="add()" />
<ul id="list">
	<li>aaa</li>
	<li>bbb</li>
</ul>
<form id="form1" action="Test_Array_3_Receive.jsp" method="post">
<input type="hidden" name="msg" value="aaa" />
<input type="hidden" name="msg" value="bbb" />
<input type="submit" value="下單" />
</form>
</body>
</html>