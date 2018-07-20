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
    <title>发布作业</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body>
	<p>已发布作业列表</p>
  <form name="form1" id="form1" method="post" action="">
		搜索&nbsp;&nbsp;
		作业编号：<input name="zuoyeID" type="text" id="zuoyeID" /> 
		名称：<input name="mingcheng" type="text" id="mingcheng" />
		提交期限：<input name="tijiaoqixian1" type="text" id="tijiaoqixian1"  value='' onclick="getDate(form1.tijiaoqixian1,'2')" need="1" size="10" />-<input name="tijiaoqixian2" type="text" id="tijiaoqixian2"  value='' onclick="getDate(form1.tijiaoqixian2,'2')" need="1" size="10"  />
		<input type="submit" name="Submit" value="查找" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" bgcolor="CCFFFF">序号</td>
	    <td bgcolor='#CCFFFF'>作业编号</td>
	    <td bgcolor='#CCFFFF'>名称</td>
	    <td bgcolor='#CCFFFF'>附件</td>
	    <td bgcolor='#CCFFFF'>提交期限</td>
	    <td bgcolor='#CCFFFF'>发布人</td>
	    <td width="130" bgcolor="CCFFFF">添加时间</td>
	    <td width="90" bgcolor="CCFFFF">操作</td>
	  </tr>
  	<%
			int curpage=1;//当前页
			int page_record=10;//每页显示的记录数
			int zgs=0;
			int zys=0;
			//用下面的方法（sql查询完成，速度快）
			String hsgnpage=request.getParameter("page");
			String fysql="select count(id) as ss from fabuzuoye where faburen='"+request.getSession().getAttribute("username")+"'";
			ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
			while(RS_resultfy.next()){
			    zgs=Integer.parseInt(RS_resultfy.getString("ss"));
			    zys=zgs/page_record+1;
			}
			if (hsgnpage!=null){
			    curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
			}
			else{
			    curpage=1;
			}
			if (curpage==0){
			    curpage=1;
			}
			if(curpage>zys){
			    curpage=zys;
			}
   		sql="";
  		sql="select top "+page_record+" * from fabuzuoye where faburen='"+request.getSession().getAttribute("username")+"' and id not in (select top "+((curpage-1)*page_record)+" id from fabuzuoye where faburen='"+request.getSession().getAttribute("username")+"' order by id desc) ";
			if(request.getParameter("zuoyeID")=="" ||request.getParameter("zuoyeID")==null ){}
			else{
			    sql=sql+" and zuoyeID like '%"+new String(request.getParameter("zuoyeID").getBytes("8859_1"))+"%'";
			}
			if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null ){}
			else{
			    sql=sql+" and mingcheng like '%"+new String(request.getParameter("mingcheng").getBytes("8859_1"))+"%'";
			}
			if (request.getParameter("tijiaoqixian1")==""  ||request.getParameter("tijiaoqixian1")==null ) {}
			else{
			    sql=sql+" and tijiaoqixian >= '"+new String(request.getParameter("tijiaoqixian1").getBytes("8859_1"))+"'";
			}
			if (request.getParameter("tijiaoqixian2")==""  ||request.getParameter("tijiaoqixian2")==null ) {}
			else{
			    sql=sql+" and tijiaoqixian <= '"+new String(request.getParameter("tijiaoqixian2").getBytes("8859_1"))+"'";
			}
			sql=sql+" order by id desc";
			RS_result=connDbBean.executeQuery(sql);
			String id="";
			String zuoyeID="";
			String mingcheng="";
			String neirong="";
			String fujian="";
			String tijiaoqixian="";
			String faburen="";
			String addtime="";
			int i=0;
			while(RS_result.next()){
			    i=i+1;
			 		id=RS_result.getString("id");
					zuoyeID=RS_result.getString("zuoyeID");
					mingcheng=RS_result.getString("mingcheng");
					neirong=RS_result.getString("neirong");
					fujian=RS_result.getString("fujian");
					tijiaoqixian=RS_result.getString("tijiaoqixian");
					faburen=RS_result.getString("faburen");
			 		addtime=RS_result.getString("addtime");
		%>
  	<tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=zuoyeID %></td>
	    <td><%=mingcheng %></td>
	    <td><a href='<%=fujian %>' target='_blank'>下载</a></td>
	    <td><%=tijiaoqixian %></td>
	    <td><%=faburen %></td>
	    <td width="130"><%=addtime.substring(0,19) %></td>
	    <td width="90">
		    <a href="fabuzuoye_updt.jsp?id=<%=id%>">修改</a>  
		    <a href="del.jsp?id=<%=id %>&tablename=fabuzuoye" onClick="return confirm('真的要删除？')">删除</a> 
		    <a href="fabuzuoyedetail.jsp?id=<%=id%>" target="_blank">详细</a>
		  </td>
		</tr>
  	<%
  		}
    %>
	</table><br>
	<p align="center">以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a></p>
	<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="fabuzuoye_list2.jsp?page=1">首页</a>　<a href="fabuzuoye_list2.jsp?page=<%= curpage-1%>">上一页</a>　<A href="fabuzuoye_list2.jsp?page=<%= curpage+1%>">下一页</A>　<a href="fabuzuoye_list2.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
</body>
</html>

