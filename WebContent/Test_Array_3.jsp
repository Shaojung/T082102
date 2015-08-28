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
</body>
</html>