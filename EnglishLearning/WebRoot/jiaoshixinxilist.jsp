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
    <link href="css/style.css" type="text/css" rel="stylesheet">
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body >
  <table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
		<tr>
			<td><%@ include file="qttop.jsp"%></td>
		</tr>
		<tr>
			<td><table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
	          <tr>
	            <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
	              <tr>
	                <td valign="top"><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
	                  <tr>
	                    <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	                      <tr>
	                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">教学队伍</span></td>
	                        <td width="76%" class="STYLE4">&nbsp;</td>
	                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
	                      </tr>
	                    </table></td>
	                  </tr>
	                  <tr>
	                    <td width="100%" height="669" valign="top" background="qtimages/5.gif"><form name="form1" id="form1" method="post" action="">
	                      	搜索&nbsp;&nbsp; 工号：<input name="gonghao" type="text" id="gonghao" size="10" />
									                     姓名：<input name="xingming" type="text" id="xingming" size="10" />
									                     性别：<select name="xingbie" id="xingbie">
														    <option value="">所有</option>
														    <option value="男">男</option>
														    <option value="女">女</option></select>
									                     职称：<input name="zhicheng" type="text" id="zhicheng" size="10" />
	  											<input type="submit" name="Submit5" value="查找" />
	                    </form>
	                      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
	                        <tr align="center">
	                          <td width="30" bgcolor="ccffff">序号</td>
	                          <td bgcolor='#ccffff'>工号</td>
	                          <td bgcolor='#ccffff'>姓名</td>
	                          <td bgcolor='#ccffff'>性别</td>
	                          <td bgcolor='#ccffff'>职称</td>
	                          <td bgcolor='#ccffff'>照片</td>
	                          <td bgcolor='#ccffff'>主教课程</td>
	                          <td bgcolor="ccffff">操作</td>
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
	    <tr  align="center">
	      <td width="30" align="center"><%=i %></td>
	      <td><%=gonghao %></td>
	      <td><%=xingming %></td>
	      <td><%=xingbie %></td>
	      <td><%=zhicheng %></td>
	      <td><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td>
	      <td><%=zhujiaokecheng %></td>
	      <td><a href="jiaoshixinxidetail.jsp?id=<%=id%>" >详细</a></td>
	    </tr>
		<%
	  	}
		%>
	</table><br>
	<p align="center">以上数据共 <%=i %> 条,<a style="cursor:hand" onclick="javascript:window.print();">打印本页</a></p>
	<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="jiaoshixinxilist.jsp?page=1">首页</a>　
		<a href="jiaoshixinxilist.jsp?page=<%= curpage-1%>">上一页</a>　<a href="jiaoshixinxilist.jsp?page=<%= curpage+1%>">下一页</a>　
		<a href="jiaoshixinxilist.jsp?page=<%=zys %>">尾页</a>　当前第<font color=red><%=curpage %></font>页/共<font color=red><%=zys %></font>页</p>
	<p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p>
	<P align=center></td>
	                  </tr>
	                  <tr>
	                    <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
	                  </tr>
	                </table></td></tr></table></td>
	            <td valign="top"><%@ include file="qtleft.jsp"%></td>
	          </tr>
	        </table></td></tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>