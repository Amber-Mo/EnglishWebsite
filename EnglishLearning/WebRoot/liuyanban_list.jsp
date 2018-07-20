
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
    <title>留言板</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
  </head>
<body >
	<p>留言板列表</p>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30px" bgcolor="A4B6D7">序号</td>
	    <td bgcolor='#A4B6D7'>昵称</td>
	    <td bgcolor='#A4B6D7'>QQ</td>
	    <td bgcolor='#A4B6D7'>邮箱</td>
	    <td bgcolor='#A4B6D7'>电话</td>
	    <td bgcolor="A4B6D7">内容</td>
	    <td bgcolor="A4B6D7">添加时间</td>
	    <td bgcolor="A4B6D7">回复内容</td>
	    <td bgcolor="A4B6D7">操作</td>
	  </tr>
	  <%
	  String sql="";
	  sql="select * from liuyanban where 1=1";
	  if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}
	  else{
		  	sql=sql+" and bianhao like '%"+request.getParameter("bianhao")+"%'";
		  }
	   sql=sql+" order by id desc";
		 ResultSet RS_result=connDbBean.executeQuery(sql);
		 String id="";
		 String cheng="";
		 String xingbie="";
		 String QQ="";
		 String youxiang="";
		 String dianhua="";
		 String neirong="";
		 String huifuneirong="";
		 String addtime="";
		 int i=0;
		 while(RS_result.next()){
				 i=i+1;
				 id=RS_result.getString("id");
				 cheng=RS_result.getString("cheng");
				 QQ=RS_result.getString("QQ");
				 youxiang=RS_result.getString("youxiang");
				 dianhua=RS_result.getString("dianhua");
				 neirong=RS_result.getString("neirong");
				 huifuneirong=RS_result.getString("huifuneirong");
			   addtime=RS_result.getString("addtime");
	 
	%>
	  <tr align="center">
	    <td><%=i %></td>
	    <td><%=cheng %></td>
	    <td><%=QQ %></td>
	    <td><%=youxiang %></td>
	    <td><%=dianhua %></td>
	    <td><%=neirong %></td>
	    <td><%=addtime.substring(0,19) %></td>
	    <td><%=huifuneirong %></td>
	    <td><a href="del.jsp?id=<%=id %>&tablename=liuyanban" onclick="return confirm('真的要删除？')">删除</a> 
	    <a href="hf.jsp?id=<%=id%>">回复</a></td>
	  </tr>
	  	<%
	  }
	   %>
	</table><br>
	<p align="center">以上数据共 <%=i %> 条,<a style="cursor:hand" onclick="javascript:window.print();">打印本页</a></p>
</body>
</html>

