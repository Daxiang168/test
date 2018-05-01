<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>文件上传</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/uploadPreview.js"></script>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
		$(function () {
			$("#up").uploadPreview({Img: "imgPre", Width: 120, Height: 120 });
		});
		</script>
  </head>
  
  <body>
       <form action="stu/fileup.do" method="post" enctype="multipart/form-data">
        <p>浏览选择一个文件：
        <input type="file" id="up" name="up" />
    
        <img id="imgPre" name="imgPre" width="120" height="120"/>
        </p>
       <p><input type="submit" value="提交"/></p>
       </form>
       
   </body>
</html>
