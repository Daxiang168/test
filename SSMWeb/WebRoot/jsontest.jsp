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
   <input type="button" value="查询" id="btnSelect">
   <div id="info"></div>
   <script type="text/javascript">
   $("#btnSelect").click(function(){
   $.ajax({
   url:"stu/selectStus.do",
   dataType:"json",
   success:function(data){
   var s="";
     $.each(data,function(i,d){
     s+="<h1>"+d.name+"&nbsp;&nbsp;&nbsp;"+d.birthday+"</h1>";
     })
     $("#info").html(s);
   }
   })
   })
   
   </script>
  </body>
</html>
