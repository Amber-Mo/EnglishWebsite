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
<body>
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
                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">视频学习</span></td>
                        <td width="76%" class="STYLE4">&nbsp;</td>
                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="100%" height="669" valign="top" background="qtimages/5.gif">
                    <form name="form1" id="form1" method="post" action="">
                      	搜索&nbsp; 编号：<input name="bianhao" type="text" id="bianhao" />
                      	教材名称：<input name="jiaocaimingcheng" type="text" id="jiaocaimingcheng" />
                      	课程：<select name='kecheng' id='kecheng'>
											    <option value="">所有</option>
											    <% sql="select kechengmingcheng from kechengxinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%>
											    <option value="<%= RS_result.getString("kechengmingcheng")%>" ><%=RS_result.getString("kechengmingcheng")%></option>
											    <%}%>
											 </select>
  										<input type="submit" name="Submit5" value="查找" />
                    </form>
                    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
	                    <tr align="center">
	                      <td width="30" bgcolor="CCFFFF">序号</td>
	                      <td bgcolor='#CCFFFF'>编号</td>
	                      <td bgcolor='#CCFFFF'>教材名称</td>
	                      <td bgcolor='#CCFFFF'>课程</td>
	                      <td bgcolor='#CCFFFF'>主讲人</td>
	                      <td width="140" align="center" bgcolor="CCFFFF">添加时间</td>
	                      <td width="60" align="center" bgcolor="CCFFFF">操作</td>
	                    </tr>
                      <%
												int curpage=1;//当前页
												int page_record=10;//每页显示的记录数
												int zgs=0;
												int zys=0;
												//用下面的方法（sql查询完成，速度快）
												String hsgnpage=request.getParameter("page");
												String fysql="select count(id) as ss from shipinjiaoxue";
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
											sql="select top "+page_record+" * from shipinjiaoxue where id not in (select top "+((curpage-1)*page_record)+" id from shipinjiaoxue order by id desc) ";
											if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}
											else{sql=sql+" and bianhao like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";}
											if(request.getParameter("jiaocaimingcheng")=="" ||request.getParameter("jiaocaimingcheng")==null ){}
											else{sql=sql+" and jiaocaimingcheng like '%"+new String(request.getParameter("jiaocaimingcheng").getBytes("8859_1"))+"%'";}
											if(request.getParameter("kecheng")=="所有" ||request.getParameter("kecheng")==null ){}
											else{sql=sql+" and kecheng like '%"+new String(request.getParameter("kecheng").getBytes("8859_1"))+"%'";}
											sql=sql+" order by id desc";
											RS_result=connDbBean.executeQuery(sql);
											String id="";
											String bianhao="";String jiaocaimingcheng="";String kecheng="";String zhujiangren="";String shipinwenjian="";String beizhu="";
											String addtime="";
											int i=0;
											while(RS_result.next()){
													i=i+1;
													id=RS_result.getString("id");
													bianhao=RS_result.getString("bianhao");jiaocaimingcheng=RS_result.getString("jiaocaimingcheng");kecheng=RS_result.getString("kecheng");zhujiangren=RS_result.getString("zhujiangren");shipinwenjian=RS_result.getString("shipinwenjian");beizhu=RS_result.getString("beizhu");
													addtime=RS_result.getString("addtime");
										%>
									  <tr align="center">
                        <td width="30" align="center"><%=i %></td>
                        <td><%=bianhao %></td>
                        <td><%=jiaocaimingcheng %></td>
                        <td><%=kecheng %></td>
                        <td><%=zhujiangren %></td>
                        <td width="140" align="center"><%=addtime.substring(0,19) %></td>
                        <td width="60" align="center"><a href="shipinjiaoxuedetail.jsp?id=<%=id%>">详细</a></td>
                      </tr>
                      <%
									    	}
									    %>
											</table><br>
		<p align="center">以上数据共 <%=i %> 条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a></p>
		<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　
		<a href="shipinjiaoxuelist.jsp?page=1">首页</a>　
		<a href="shipinjiaoxuelist.jsp?page=<%= curpage-1%>">上一页</a>　
		<a href="shipinjiaoxuelist.jsp?page=<%= curpage+1%>">下一页</a>　
		<a href="shipinjiaoxuelist.jsp?page=<%=zys %>">尾页</a>　
		当前第<font color=red><%=curpage %></font>页/共<font color=red><%=zys %></font>页</p><p align="center">&nbsp;</p>
				</td>
    </tr>
    <tr>
      <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
    </tr>
  	</table></td></tr></table></td>
      <td valign="top"><%@ include file="qtleft.jsp"%></td>
    </tr></table></td></tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>