<%@ page language="java"  pageEncoding="gb2312" import="java.sql.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("gb2312"); 
	response.setCharacterEncoding("gb2312"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
  </head>
<body>
	<%
		String jiaoshi=request.getParameter("jiaoshi");String zuoyemingcheng=request.getParameter("zuoyemingcheng");String neirong=request.getParameter("neirong");String fujian=request.getParameter("fujian");String tijiaoren=request.getParameter("tijiaoren");
  	String sql="insert into zuoyetijiao(jiaoshi,zuoyemingcheng,neirong,fujian,tijiaoren) values('"+jiaoshi+"','"+zuoyemingcheng+"','"+neirong+"','"+fujian+"','"+tijiaoren+"') ";
  	connDbBean.executeUpdate(sql);
  	out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='zuoyetijiao_add.jsp';</script>");
	%>
</body>
</html>

