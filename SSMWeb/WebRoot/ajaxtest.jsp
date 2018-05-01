<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jsontest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
  </head>
    
  <body>
   学生编号：<input id="a"/><span id="spID"></span>
   <script type="text/javascript">
   $("#a").blur(function(){
   $.ajax({
   url:"stu/selectById.do",
   type:"post",
   data:{"id":this.value},
     success:function(data){
     var s=data=="true"?"用户编号不存在":"用户编号已存在";
    $("#spID").text(s);
   }
   })
   
   })
   
   </script>
  </body>
</html>
