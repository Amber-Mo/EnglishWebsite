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
    <title>学生信息</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body>
  <p>学生信息列表</p>
  <form name="form1" id="form1" method="post" action="">
   搜索&nbsp;&nbsp;学号：<input name="xuehao" type="text" id="xuehao" /> 姓名：<input name="xingming" type="text" id="xingming" />班级：<select name='banji' id='banji'><option value="">所有</option><% sql="select banji from banjixinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("banji")%>" ><%=RS_result.getString("banji")%></option><%}%></select> 性别：<select name="xingbie" id="xingbie"><option value="">所有</option><option value="男">男</option><option value="女">女</option></select> 电话：<input name="dianhua" type="text" id="dianhua" /> 身份证：<input name="shenfenzheng" type="text" id="shenfenzheng" />
   <input type="submit" name="Submit" value="查找" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
	    <td bgcolor='#ccffff'>学号</td>
	    <td bgcolor='#ccffff'>姓名</td>
	    <td bgcolor='#ccffff'>班级</td>
	    <td bgcolor='#ccffff'>性别</td>
	    <td bgcolor='#ccffff'>电话</td>
	    <td bgcolor='#ccffff'>照片</td>
	    <td bgcolor='#ccffff'>身份证</td>
	    <td bgcolor='#ccffff'>家庭住址</td>
	    <td bgcolor='#ccffff'>备注</td>
	    <td bgcolor='#ccffff'>密码</td>
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
			String fysql="select count(id) as ss from xueshengxinxi";
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
		 sql="select top "+page_record+" * from xueshengxinxi where id not in (select top "+((curpage-1)*page_record)+" id from xueshengxinxi order by id desc) ";
		  
		 if(request.getParameter("xuehao")=="" ||request.getParameter("xuehao")==null ){}else{sql=sql+" and xuehao like '%"+new String(request.getParameter("xuehao").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+new String(request.getParameter("xingming").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("banji")=="所有" ||request.getParameter("banji")==null ){}else{sql=sql+" and banji like '%"+new String(request.getParameter("banji").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("xingbie")=="所有" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+new String(request.getParameter("xingbie").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("dianhua")=="" ||request.getParameter("dianhua")==null ){}else{sql=sql+" and dianhua like '%"+new String(request.getParameter("dianhua").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("shenfenzheng")=="" ||request.getParameter("shenfenzheng")==null ){}else{sql=sql+" and shenfenzheng like '%"+new String(request.getParameter("shenfenzheng").getBytes("8859_1"))+"%'";}
		 sql=sql+" order by id desc";
		 RS_result=connDbBean.executeQuery(sql);
		 String id="";
		 String xuehao="";String xingming="";String banji="";String xingbie="";String dianhua="";String zhaopian="";String shenfenzheng="";String jiatingzhuzhi="";String beizhu="";String mima="";
		 String addtime="";
		 int i=0;
		 while(RS_result.next()){
		 i=i+1;
		 id=RS_result.getString("id");
		 xuehao=RS_result.getString("xuehao");xingming=RS_result.getString("xingming");banji=RS_result.getString("banji");xingbie=RS_result.getString("xingbie");dianhua=RS_result.getString("dianhua");zhaopian=RS_result.getString("zhaopian");shenfenzheng=RS_result.getString("shenfenzheng");jiatingzhuzhi=RS_result.getString("jiatingzhuzhi");beizhu=RS_result.getString("beizhu");mima=RS_result.getString("mima");
		 addtime=RS_result.getString("addtime");
	%>
	  <tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=xuehao %></td><td><%=xingming %></td><td><%=banji %></td><td><%=xingbie %></td><td><%=dianhua %></td><td><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td><td><%=shenfenzheng %></td><td><%=jiatingzhuzhi %></td><td><%=beizhu %></td><td><%=mima %></td>
	    <td><%=addtime.substring(0,19) %></td>
	    <td><a href="xueshengxinxi_updt.jsp?id=<%=id%>">修改</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=xueshengxinxi" onclick="return confirm('真的要删除？')">删除</a> 
	  </tr>
	  <%
	  	}
	  %>
	</table><br>
	<p align="center">以上数据共<%=i %>条,<a style="cursor:hand" onclick="javascript:window.print();">打印本页</a></p>
	<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　
	<a href="xueshengxinxi_list.jsp?page=1">首页</a>　
	<a href="xueshengxinxi_list.jsp?page=<%= curpage-1%>">上一页</a>　
	<a href="xueshengxinxi_list.jsp?page=<%= curpage+1%>">下一页</a>　
	<a href="xueshengxinxi_list.jsp?page=<%=zys %>">尾页</a>　
	当前第<font color=red><%=curpage %></font>页/共<font color=red><%=zys %></font>页</p>
</body>
</html>
