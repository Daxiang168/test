<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增学生信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
 
  </head>
  
  <body>
   <form action="stu/add.do" method="post">
   <table>
   <tr>
   <td>姓名</td>
   <td><input name="name"></td>
   </tr>
   <tr>
   <td>性别</td>
   <td><input name="sex" checked="checked" type="radio" value="true">男
      <input name="sex" type="radio" value="false">女
   </td>
   </tr>
   <tr>
   <td>生日</td>
   <td><input name="birthday"  class="Wdate" onFocus="WdatePicker()"/></td>
   </tr>
   <tr>
   <td>年级</td>
   <td>
   <select name="gradeId">
   <c:forEach items="${gradelist}" var="g">
     <option value="${g.id}">${g.name}</option>
   </c:forEach>
     <option></option>
   </select>
   </td>
   </tr>
   <tr>
   <td>成绩</td>
   <td><input name="score"></td>
   </tr>
   <tr>
   <td></td>
   <td><input type="submit" value="保存"></td>
   </tr>
   </table>
    </form>
  </body>
</html>
