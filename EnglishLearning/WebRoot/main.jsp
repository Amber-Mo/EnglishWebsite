<%@ page language="java"  pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>大学英语自主学习网</title>
  </head>
  <frameset frameSpacing=0 rows=80,* frameBorder=0>
	  <frame name=top src="top.jsp" frameBorder=0 noResize scrolling=no>
	  <frameset frameSpacing=0 frameBorder=0 cols=220,*>
		  <frame name=menu src="mygo.jsp" height="650" frameBorder=0 noResize>
		  <frame name=dmMain src="right.jsp" frameBorder=0>
		</frameset>
		<noframes>
  		<p>This page requires frames, but your browser does not support them.</p>
  	</noframes>
  </frameset>
</html>
