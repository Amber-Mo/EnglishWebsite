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
		String bianhao=request.getParameter("bianhao");
		String jiaocaimingcheng=request.getParameter("jiaocaimingcheng");
		String kecheng=request.getParameter("kecheng");
		String zhujiangren=request.getParameter("zhujiangren");
		String shipinwenjian=request.getParameter("shipinwenjian");
		String beizhu=request.getParameter("beizhu");
		String id=request.getParameter("id");
		String sql="update shipinjiaoxue set bianhao='"+bianhao+"',jiaocaimingcheng='"+jiaocaimingcheng+"',kecheng='"+kecheng+"',zhujiangren='"+zhujiangren+"',shipinwenjian='"+shipinwenjian+"',beizhu='"+beizhu+"' where id= "+id;
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='shipinjiaoxue_updt.jsp?id="+id+"';</script>");
	%>
  </body>
</html>


