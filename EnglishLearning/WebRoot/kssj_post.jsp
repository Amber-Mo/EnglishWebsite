<%@ page language="java"  pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
  </head>
<body>
	<%
  	String ymm=request.getParameter("ymm");
  	String sql="update kaoshishijian set kssj='"+ymm+"'";
  	connDbBean.executeUpdate(sql);
  	out.print("<script>alert('…Ë÷√≥…π¶!');window.history.go(-1);</script>");
	%>
</body>
</html>

