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
		String zhuanye=request.getParameter("zhuanye");
		String tishu=request.getParameter("tishu");
		String fenzhi=request.getParameter("fenzhi");
		String sql="select top "+tishu+" id from xuanzeti where zhuanye='"+zhuanye+"' order by newid()";
		ResultSet RS_result=connDbBean.executeQuery(sql);
		String id="";
 		while(RS_result.next()){
	  		id=id+RS_result.getString("id")+",";
		}
		id=id.substring(0,id.length()-1);
  	sql="insert into zidongzujuan(bianhao,zhuanye,tishu,fenzhi,timu) values('"+bianhao+"','"+zhuanye+"','"+tishu+"','"+fenzhi+"','"+id+"') ";
  	connDbBean.executeUpdate(sql);
  	out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='zidongzujuan_list.jsp';</script>");
	%>
</body>
</html>

