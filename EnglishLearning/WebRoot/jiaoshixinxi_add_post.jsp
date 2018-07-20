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
		String gonghao=request.getParameter("gonghao");
	  String xingming=request.getParameter("xingming");
	  String mima=request.getParameter("mima");
	  String chushengnianyue=request.getParameter("chushengnianyue");
	  String shenfenzheng=request.getParameter("shenfenzheng");
	  String xingbie=request.getParameter("xingbie");
	  String zhicheng=request.getParameter("zhicheng");
	  String zhaopian=request.getParameter("zhaopian");
	  String zhujiaokecheng=request.getParameter("zhujiaokecheng");
	  String dianhua=request.getParameter("dianhua");
	  String beizhu=request.getParameter("beizhu");
	  String sql="insert into jiaoshixinxi(gonghao,xingming,mima,chushengnianyue,shenfenzheng,xingbie,zhicheng,zhaopian,zhujiaokecheng,dianhua,beizhu) values('"+gonghao+"','"+xingming+"','"+mima+"','"+chushengnianyue+"','"+shenfenzheng+"','"+xingbie+"','"+zhicheng+"','"+zhaopian+"','"+zhujiaokecheng+"','"+dianhua+"','"+beizhu+"') ";
	  connDbBean.executeUpdate(sql);
	  out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='jiaoshixinxi_add.jsp';</script>");
 %>
</body>
</html>

