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
    <title></title>
  </head>
<body>
	<%
		String zuoyeID=request.getParameter("zuoyeID");String mingcheng=request.getParameter("mingcheng");String neirong=request.getParameter("neirong");String fujian=request.getParameter("fujian");String tijiaoqixian=request.getParameter("tijiaoqixian");String faburen=request.getParameter("faburen");
		String sql="insert into fabuzuoye(zuoyeID,mingcheng,neirong,fujian,tijiaoqixian,faburen) values('"+zuoyeID+"','"+mingcheng+"','"+neirong+"','"+fujian+"','"+tijiaoqixian+"','"+faburen+"') ";
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='fabuzuoye_add.jsp';</script>");
	%>
</body>
</html>

