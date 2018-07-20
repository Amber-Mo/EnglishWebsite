
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
    <title>自动组卷</title> 
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
  </head>
<body >
  <p>自动组卷列表</p>
  <form name="form1" id="form1" method="post" action="">
   	搜索&nbsp;&nbsp;编号:
     <input name="bianhao" type="text" id="bianhao" />
          专业:
     <input name="mingcheng" type="text" id="mingcheng" />
     <input type="submit" name="Submit" value="查找" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
	    <td width="86" bgcolor='#CCFFFF'>编号</td>
	    <td width="90" bgcolor='#CCFFFF'>专业</td>
	    <td width="57" bgcolor='#CCFFFF'>题数</td>
	    <td width="249" bgcolor='#CCFFFF'>生成试题ID（随机）</td>
	    <td width="80" bgcolor='#CCFFFF'>分值</td>
	    <td width="130" align="center" bgcolor="CCFFFF">添加时间</td>
	    <td width="145" align="center" bgcolor="CCFFFF">操作</td>
	  </tr>
	 <%
	  String sql="";
	  sql="select * from zidongzujuan where 1=1";
	  if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null )
	  {}
	  else
	  {
	  	sql=sql+" and bianhao like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";
	  }
	  if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null )
	  {}
	  else
	  {
	  	sql=sql+" and zhuanye like '%"+new String(request.getParameter("mingcheng").getBytes("8859_1"))+"%'";
	  }
	 sql=sql+" order by id desc";
	 ResultSet RS_result=connDbBean.executeQuery(sql);
	 String id="";
	 String bianhao="";
	 String zhuanye="";
	 String tishu="";
	 String fenzhi="";
	 String timu="";
	 String addtime="";
	 int i=0;
	 while(RS_result.next()){
		 i=i+1;
		 id=RS_result.getString("id");
		 bianhao=RS_result.getString("bianhao");zhuanye=RS_result.getString("zhuanye");tishu=RS_result.getString("tishu");fenzhi=RS_result.getString("fenzhi");
		 addtime=RS_result.getString("addtime"); timu=RS_result.getString("timu");
	%>
	  <tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=bianhao %></td>
	    <td><%=zhuanye %></td>
	    <td><%=tishu %></td>
	    <td><%=timu%></td>
	    <td><%=fenzhi %></td>
	    <td width="130" align="center"><%=addtime.substring(0,19) %></td>
	    <td width="145" align="center">
	    <a href="shijuan_detail.jsp?id=<%=id%>" target="_blank">查看试卷</a> 
	    <a href="zidongzujuan_updt.jsp?id=<%=id%>">手工修改</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=zidongzujuan" onClick="return confirm('真的要删除？')">删除</a></td>
	  </tr>
	  	<%
	  }
	   %>
	</table>
	<br>
	<p align="center">以上数据共 <%=i %> 条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a></p>
</body>
</html>

