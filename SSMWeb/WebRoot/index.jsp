<%@page import="com.bean.Page"%>
<%@page import="com.bean.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>显示学生信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	*{margin:0px;padding:0px;}
	table{width:800px;margin:0px auto;border-collapse:collapse;text-align: center;}
	thead tr{background-color:#ccc;}
	tr{height: 50px;cursor: pointer;}
   tbody tr:nth-of-type(odd){background-color:#ff0;}
   tbody tr:nth-of-type(even){background-color:#0f0;}
	  
	</style>
</head>
<body>
	<c:if test="${upage==null}">
		<c:redirect url="/stu/list.do?pageIndex=1"/>
	</c:if>
	<%
	 Page<Student> p=(Page<Student>)request.getAttribute("upage");
	 int pageIndex=p.getPageIndex();
	 int totalPages=p.getTotalPages();
	 String next="", prev="";
	 if(pageIndex<totalPages){
	 next="href='stu/list.do?pageIndex="+(pageIndex+1)+"'";
	 }
	 if(pageIndex>1){
	prev="href='stu/list.do?pageIndex="+(pageIndex-1)+"'";
	}
	  %>
	
  <table>
	<thead>
		<tr>
		<td>编号</td><td>姓名</td><td>性别</td><td>生日</td><td>年级</td><td>成绩</td><td>操作</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${upage.list}" var="s">
			<tr onmouseover="c=this.style.backgroundColor;this.style.backgroundColor='#f00'";
			onmouseout="this.style.backgroundColor=c;">
				<td><a href="<%=basePath%>stu/up.do?id=${s.id}">${s.id}</a></td>
				<td>${s.name}</td>
				<td>${s.sex?"男":"女"}</td>
				<td><fmt:formatDate value="${s.birthday}" pattern="yyyy-mm-dd"/></td>
				<td>${s.grade.name}</td>
				<td>${s.score}</td>
				<td><a href="<%=basePath%>stu/del.do?id=${s.id}" onclick="return confirm('是否删除!')">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<a href="add.jsp">新增</a>
	<p>第<%=pageIndex%>页/共<%=totalPages%>页</p>
	
	<a <%=prev%>>上一页</a>
	<a <%=next%>>下一页</a>
</body>
</html>
