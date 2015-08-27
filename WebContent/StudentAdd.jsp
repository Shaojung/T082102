<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a student.</title>
<script language="JavaScript">
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
<p>Student Name:<input id="t1" type="text" name="student_name" /></p>
<p>Student Tel:<input id="t2" type="text" name="student_tel" /></p>
<p><input type="submit" value="ADD!" />
</form>

</body>
</html>