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
		String xuehao=request.getParameter("xuehao");String xingming=request.getParameter("xingming");String banji=request.getParameter("banji");String xingbie=request.getParameter("xingbie");String dianhua=request.getParameter("dianhua");String zhaopian=request.getParameter("zhaopian");String shenfenzheng=request.getParameter("shenfenzheng");String jiatingzhuzhi=request.getParameter("jiatingzhuzhi");String beizhu=request.getParameter("beizhu");String mima=request.getParameter("mima");
  	String sql="insert into xueshengxinxi(xuehao,xingming,banji,xingbie,dianhua,zhaopian,shenfenzheng,jiatingzhuzhi,beizhu,mima) values('"+xuehao+"','"+xingming+"','"+banji+"','"+xingbie+"','"+dianhua+"','"+zhaopian+"','"+shenfenzheng+"','"+jiatingzhuzhi+"','"+beizhu+"','"+mima+"') ";
  	connDbBean.executeUpdate(sql);
  	out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='xueshengxinxi_add.jsp';</script>");
	%>
</body>
</html>

