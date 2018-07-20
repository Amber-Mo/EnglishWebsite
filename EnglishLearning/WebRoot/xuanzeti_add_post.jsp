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
		String zhuanye=request.getParameter("zhuanye");String xueke=request.getParameter("xueke");String timu=request.getParameter("timu");String xuanxiangA=request.getParameter("xuanxiangA");String xuanxiangB=request.getParameter("xuanxiangB");String xuanxiangC=request.getParameter("xuanxiangC");String xuanxiangD=request.getParameter("xuanxiangD");String daan=request.getParameter("daan");String nanduxishu=request.getParameter("nanduxishu");
  	String sql="insert into xuanzeti(zhuanye,xueke,timu,xuanxiangA,xuanxiangB,xuanxiangC,xuanxiangD,daan,nanduxishu) values('"+zhuanye+"','"+xueke+"','"+timu+"','"+xuanxiangA+"','"+xuanxiangB+"','"+xuanxiangC+"','"+xuanxiangD+"','"+daan+"','"+nanduxishu+"') ";
  	connDbBean.executeUpdate(sql);
  	out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='xuanzeti_add.jsp';</script>");
	%>
</body>
</html>

