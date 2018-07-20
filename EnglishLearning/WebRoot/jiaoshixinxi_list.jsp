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
    <title>教师信息</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body >
	<p>教师信息列表</p>
  <form name="form1" id="form1" method="post" action="">
     搜索&nbsp;&nbsp;工号：<input name="gonghao" type="text" id="gonghao" /> 
     姓名：<input name="xingming" type="text" id="xingming" /> 身份证：<input name="shenfenzheng" type="text" id="shenfenzheng" />
    性别：<select name="xingbie" id="xingbie"><option value="">所有</option><option value="男">男</option><option value="女">女</option></select> 
    职称：<input name="zhicheng" type="text" id="zhicheng" /> 电话：<input name="dianhua" type="text" id="dianhua" />
   <input type="submit" name="Submit" value="查找" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
		  <td width="30" bgcolor="CCFFFF">序号</td>
		  <td bgcolor='#CCFFFF'>工号</td>
		  <td bgcolor='#CCFFFF'>姓名</td>
		  <td bgcolor='#CCFFFF'>密码</td>
		  <td bgcolor='#CCFFFF'>出生年月</td>
		  <td bgcolor='#CCFFFF'>身份证</td>
		  <td bgcolor='#CCFFFF'>性别</td>
		  <td bgcolor='#CCFFFF'>职称</td>
		  <td bgcolor='#CCFFFF'>照片</td>
		  <td bgcolor='#CCFFFF'>主教课程</td>
		  <td bgcolor='#CCFFFF'>电话</td>
		  <td bgcolor='#CCFFFF'>备注</td>
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
			String fysql="select count(id) as ss from jiaoshixinxi";
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
  		sql="select top "+page_record+" * from jiaoshixinxi where id not in (select top "+((curpage-1)*page_record)+" id from jiaoshixinxi order by id desc) ";
			if(request.getParameter("gonghao")=="" ||request.getParameter("gonghao")==null ){}else{sql=sql+" and gonghao like '%"+new String(request.getParameter("gonghao").getBytes("8859_1"))+"%'";}
			if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+new String(request.getParameter("xingming").getBytes("8859_1"))+"%'";}
			if(request.getParameter("shenfenzheng")=="" ||request.getParameter("shenfenzheng")==null ){}else{sql=sql+" and shenfenzheng like '%"+new String(request.getParameter("shenfenzheng").getBytes("8859_1"))+"%'";}
			if(request.getParameter("xingbie")=="所有" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+new String(request.getParameter("xingbie").getBytes("8859_1"))+"%'";}
			if(request.getParameter("zhicheng")=="" ||request.getParameter("zhicheng")==null ){}else{sql=sql+" and zhicheng like '%"+new String(request.getParameter("zhicheng").getBytes("8859_1"))+"%'";}
			if(request.getParameter("dianhua")=="" ||request.getParameter("dianhua")==null ){}else{sql=sql+" and dianhua like '%"+new String(request.getParameter("dianhua").getBytes("8859_1"))+"%'";}
		  sql=sql+" order by id desc";
		  RS_result=connDbBean.executeQuery(sql);
		  String id="";
		  String gonghao="";String xingming="";String mima="";String chushengnianyue="";String shenfenzheng="";String xingbie="";String zhicheng="";String zhaopian="";String zhujiaokecheng="";String dianhua="";String beizhu="";
		  String addtime="";
		  int i=0;
		  while(RS_result.next()){
		      i=i+1;
				  id=RS_result.getString("id");
				  gonghao=RS_result.getString("gonghao");
				  xingming=RS_result.getString("xingming");
				  mima=RS_result.getString("mima");
				  chushengnianyue=RS_result.getString("chushengnianyue");
				  shenfenzheng=RS_result.getString("shenfenzheng");
				  xingbie=RS_result.getString("xingbie");
				  zhicheng=RS_result.getString("zhicheng");
				  zhaopian=RS_result.getString("zhaopian");
				  zhujiaokecheng=RS_result.getString("zhujiaokecheng");
				  dianhua=RS_result.getString("dianhua");
				  beizhu=RS_result.getString("beizhu");
				  addtime=RS_result.getString("addtime");
		%>
		<tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=gonghao %></td>
	    <td><%=xingming %></td>
	    <td><%=mima %></td>
	    <td><%=chushengnianyue %></td>
	    <td><%=shenfenzheng %></td>
	    <td><%=xingbie %></td>
	    <td><%=zhicheng %></td>
	    <td><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td>
	    <td><%=zhujiaokecheng %></td>
	    <td><%=dianhua %></td>
	    <td><%=beizhu %></td>
	    <td><%=addtime.substring(0,19) %></td>
	    <td><a href="jiaoshixinxi_updt.jsp?id=<%=id%>">修改</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=jiaoshixinxi" onclick="return confirm('真的要删除？')">删除</a> 
	    <a href="jiaoshixinxidetail.jsp?id=<%=id%>" target="_blank">详细</a></td>
  	</tr>
  	<%
  		}
    %>
	</table><br>
	<p align="center">以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a></p>
	<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="jiaoshixinxi_list.jsp?page=1">首页</a>　<a href="jiaoshixinxi_list.jsp?page=<%= curpage-1%>">上一页</a>　<A href="jiaoshixinxi_list.jsp?page=<%= curpage+1%>">下一页</A>　<a href="jiaoshixinxi_list.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
</body>
</html>
