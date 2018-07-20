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
		String gonghao=request.getParameter("gonghao");String xingming=request.getParameter("xingming");String mima=request.getParameter("mima");String chushengnianyue=request.getParameter("chushengnianyue");String shenfenzheng=request.getParameter("shenfenzheng");String xingbie=request.getParameter("xingbie");String zhicheng=request.getParameter("zhicheng");String zhaopian=request.getParameter("zhaopian");String zhujiaokecheng=request.getParameter("zhujiaokecheng");String dianhua=request.getParameter("dianhua");String beizhu=request.getParameter("beizhu");
		String id=request.getParameter("id");
		String sql="update jiaoshixinxi set gonghao='"+gonghao+"',xingming='"+xingming+"',mima='"+mima+"',chushengnianyue='"+chushengnianyue+"',shenfenzheng='"+shenfenzheng+"',xingbie='"+xingbie+"',zhicheng='"+zhicheng+"',zhaopian='"+zhaopian+"',zhujiaokecheng='"+zhujiaokecheng+"',dianhua='"+dianhua+"',beizhu='"+beizhu+"' where id= "+id;
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('ÐÞ¸Ä³É¹¦!');location.href='jiaoshixinxi_list.jsp';</script>");
	%>
</body>
</html>


