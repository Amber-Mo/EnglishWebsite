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
		String biaoti=request.getParameter("biaoti");
		String leibie=request.getParameter("leibie");
		String neirong=request.getParameter("neirong");
		String tianjiaren=request.getParameter("tianjiaren");
		String shouyetupian=request.getParameter("shouyetupian");
		String dianjilv=request.getParameter("dianjilv");
  	String sql="insert into xinwentongzhi(biaoti,leibie,neirong,tianjiaren,shouyetupian,dianjilv) values('"+biaoti+"','"+leibie+"','"+neirong+"','"+tianjiaren+"','"+shouyetupian+"','"+dianjilv+"') ";
  	connDbBean.executeUpdate(sql);
  	out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='xinwentongzhi_add.jsp?lb="+leibie+"';</script>");
	%>
</body>
</html>

