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
		int tishu=Integer.parseInt(request.getParameter("tishu"));
		int fenzhi=Integer.parseInt(request.getParameter("fenzhi"));
		String tmp1;
		String tmp2;
		int i=0;
		int df=0;
		for (i=1;i<=tishu;i++){
		    tmp1=request.getParameter("xztshitida"+String.valueOf(i));
			  tmp2=request.getParameter("xztxxa"+String.valueOf(i));
			  if(tmp1.equals(tmp2)){
			      df=df+fenzhi;
			}
		}
		String sql;
		sql="insert into cj(username,cj,sjbh) values('"+request.getSession().getAttribute("username")+"',"+df+",'"+request.getParameter("bianhao")+"')";
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('交卷成功!您本次成绩为"+String.valueOf(df)+"分');location.href='index.jsp';</script>");
	%>
  </body>
</html>

