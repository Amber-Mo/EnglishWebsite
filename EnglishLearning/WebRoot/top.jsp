
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>大学英语自主学习网</title>
		<style type='text/css'>
			body {
				padding-right: 0px; 
				padding-left: 0px; 
				padding-bottom: 0px; 
				margin: 0px; 
				padding-top: 0px; 
				background-color: #2a8dc8
			}
			body,td,div,p {
				font-size: 12px; 
				color: #003366; 
				font-family: Verdana, Arial, Helvetica, sans-serif;
			}
		</style>
  </head>
<body>
	<table cellspacing=0 cellpadding=0 width="100%" border=0>
	  <tbody>
	  <tr>
	    <td width=10><img src="images/new_001.jpg" border=0></td>
	    <td background=images/new_002.jpg>
	    	<font size=4><b>大学英语自主学习网站管理中心</b></font> 
	    </td>
	    <td background=images/new_002.jpg>
	      <table cellspacing=0 cellpadding=0 width="100%" border=0>
	        <tbody>
	        <tr>
	          <td align=right height=35>
	          	当前用户：<%=request.getSession().getAttribute("username")%>&nbsp;&nbsp;&nbsp;&nbsp;
	          	权限：<%=request.getSession().getAttribute("cx")%>
	          </td>
	        </tr>
	        <tr>
	          <td height=35 align="right">
	          	<a href="logout.jsp" target=_top><font color=red><b>安全退出</b></font></a>      
	          </td>
	        </tr>
	        </tbody>
	    	</table>
	    </td>
	    <td width=10><img src="images/new_003.jpg" border=0></td>
		</tr>
		</tbody>
	</table>
</body>
</html>

