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
    <title>资料下载</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body >
  <p>资料下载列表</p>
  <form name="form1" id="form1" method="post" action="">
	   搜索&nbsp; 编号：<input name="bianhao" type="text" id="bianhao" /> 名称：<input name="mingcheng" type="text" id="mingcheng" />类别：
	   <select name='leibie' id='leibie'>
	     <option value="">所有</option>
	     <option value="教学课件">教学课件</option>
	     <option value="常用软件">常用软件</option>
	     <option value="通知公告">通知公告</option>
	     <option value="杂志文献">杂志文献</option>
	   </select>
	   课程：
	   <select name='kecheng' id='kecheng'><option value="">所有</option><% sql="select kechengmingcheng from kechengxinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("kechengmingcheng")%>" ><%=RS_result.getString("kechengmingcheng")%></option><%}%></select>
	   <input type="submit" name="Submit" value="查找" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
	    <td bgcolor='#CCFFFF'>编号</td>
	    <td bgcolor='#CCFFFF'>名称</td>
	    <td bgcolor='#CCFFFF'>类别</td>
	    <td bgcolor='#CCFFFF'>课程</td>
	    <td bgcolor='#CCFFFF'>简介</td>
	    <td bgcolor='#CCFFFF'>附件</td>
	    <td bgcolor="CCFFFF">添加时间</td>
	    <td bgcolor="CCFFFF">操作</td>
	  </tr>
	<%
	  int curpage=1;//当前页
		int page_record=10;//每页显示的记录数
		int zgs=0;
		int zys=0;
		//用下面的方法（sql查询完成，速度快）
		String hsgnpage=request.getParameter("page");
		String fysql="select count(id) as ss from ziliaoxiazai";
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
		 sql="select top "+page_record+" * from ziliaoxiazai where id not in (select top "+((curpage-1)*page_record)+" id from ziliaoxiazai order by id desc) ";
		 if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}else{sql=sql+" and bianhao like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null ){}else{sql=sql+" and mingcheng like '%"+new String(request.getParameter("mingcheng").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("leibie")=="所有" ||request.getParameter("leibie")==null ){}else{sql=sql+" and leibie like '%"+new String(request.getParameter("leibie").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("kecheng")=="所有" ||request.getParameter("kecheng")==null ){}else{sql=sql+" and kecheng like '%"+new String(request.getParameter("kecheng").getBytes("8859_1"))+"%'";}
		 sql=sql+" order by id desc";
		 RS_result=connDbBean.executeQuery(sql);
		 String id="";
		 String bianhao="";String mingcheng="";String leibie="";String kecheng="";String jianjie="";String fujian="";
		 String addtime="";
		 int i=0;
		 while(RS_result.next()){
			 i=i+1;
			 id=RS_result.getString("id");
			 bianhao=RS_result.getString("bianhao");mingcheng=RS_result.getString("mingcheng");leibie=RS_result.getString("leibie");kecheng=RS_result.getString("kecheng");jianjie=RS_result.getString("jianjie");fujian=RS_result.getString("fujian");
			 addtime=RS_result.getString("addtime");
	%>
	  <tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=bianhao %></td><td><%=mingcheng %></td><td><%=leibie %></td><td><%=kecheng %></td><td><%=jianjie %></td><td><a href='<%=fujian %>' target='_blank'>下载</a></td>
	    <td><%=addtime.substring(0,19) %></td>
	    <td><a href="ziliaoxiazai_updt.jsp?id=<%=id%>">修改</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=ziliaoxiazai" onClick="return confirm('真的要删除？')">删除</a> 
	    <a href="ziliaoxiazaidetail.jsp?id=<%=id%>" target="_blank">详细</a></td>
	  </tr>
	  	<%
	  }
	   %>
	</table><br>
	<p align="center">以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a></p>
	<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="ziliaoxiazai_list.jsp?page=1">首页</a>　<a href="ziliaoxiazai_list.jsp?page=<%= curpage-1%>">上一页</a>　<A href="ziliaoxiazai_list.jsp?page=<%= curpage+1%>">下一页</A>　<a href="ziliaoxiazai_list.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
</body>
</html>
