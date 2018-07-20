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
    <title>作业提交</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body >
  <p>已提交作业列表</p>
  <form name="form1" id="form1" method="post" action="">
   搜索&nbsp;&nbsp;教师：<select name='jiaoshi' id='jiaoshi'><option value="">所有</option><% sql="select gonghao from jiaoshixinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("gonghao")%>" ><%=RS_result.getString("gonghao")%></option><%}%></select> 
   作业名称：<input name="zuoyemingcheng" type="text" id="zuoyemingcheng" />
     <input type="submit" name="Submit" value="查找" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" bgcolor="CCFFFF">序号</td>
	    <td bgcolor='#CCFFFF'>教师</td>
	    <td bgcolor='#CCFFFF'>作业名称</td>
	    <td bgcolor='#CCFFFF'>附件</td>
	    <td bgcolor='#CCFFFF'>提交人</td>
	    <td width="150" align="center" bgcolor="CCFFFF">添加时间</td>
	    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
	  </tr>
	  <%
  			int curpage=1;//当前页
				int page_record=10;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from zuoyetijiao where tijiaoren='"+request.getSession().getAttribute("username")+"'";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
			  while(RS_resultfy.next()){
				  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
				  zys=zgs/page_record+1;
			  }
				if (hsgnpage!=null)
				{
				curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
				}
				else
				{
				curpage=1;
				}
				if (curpage==0)
				{
					curpage=1;
				}
				if(curpage>zys)
				{
					curpage=zys;
				}
				 sql="";
				 sql="select top "+page_record+" * from zuoyetijiao where tijiaoren='"+request.getSession().getAttribute("username")+"' and id not in (select top "+((curpage-1)*page_record)+" id from zuoyetijiao where tijiaoren='"+request.getSession().getAttribute("username")+"' order by id desc) ";
				 if(request.getParameter("jiaoshi")=="所有" ||request.getParameter("jiaoshi")==null ){}else{sql=sql+" and jiaoshi like '%"+new String(request.getParameter("jiaoshi").getBytes("8859_1"))+"%'";}
				 if(request.getParameter("zuoyemingcheng")=="" ||request.getParameter("zuoyemingcheng")==null ){}else{sql=sql+" and zuoyemingcheng like '%"+new String(request.getParameter("zuoyemingcheng").getBytes("8859_1"))+"%'";}
				 sql=sql+" order by id desc";
				 RS_result=connDbBean.executeQuery(sql);
				 String id="";
				 String jiaoshi="";
				 String zuoyemingcheng="";
				 String neirong="";
				 String fujian="";
				 String tijiaoren="";
				 String addtime="";
				 int i=0;
				 while(RS_result.next()){
				 i=i+1;
				 id=RS_result.getString("id");
				 jiaoshi=RS_result.getString("jiaoshi");
				 zuoyemingcheng=RS_result.getString("zuoyemingcheng");
				 neirong=RS_result.getString("neirong");
				 fujian=RS_result.getString("fujian");
				 tijiaoren=RS_result.getString("tijiaoren");
				 addtime=RS_result.getString("addtime");
	 %>
	  <tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=jiaoshi %></td><td><%=zuoyemingcheng %></td><td><a href='<%=fujian %>' target='_blank'>下载</a></td><td><%=tijiaoren %></td>
	    <td width="150" align="center"><%=addtime.substring(0,19) %></td>
	    <td width="90" align="center"><a href="zuoyetijiao_updt.jsp?id=<%=id%>">修改</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=zuoyetijiao" onClick="return confirm('真的要删除？')">删除</a> 
	    <a href="zuoyetijiao_detail.jsp?id=<%=id%>">详细</a></td>
	  </tr>
	  	<%
	  }
	   %>
	</table><br>
	<p align="center">以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a></p>
	<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="zuoyetijiao_list2.jsp?page=1">首页</a>　<a href="zuoyetijiao_list2.jsp?page=<%= curpage-1%>">上一页</a>　<A href="zuoyetijiao_list2.jsp?page=<%= curpage+1%>">下一页</A>　<a href="zuoyetijiao_list2.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
</body>
</html>

