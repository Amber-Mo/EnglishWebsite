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
<body >
	<table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
		<tr><td><%@ include file="qttop.jsp"%></td></tr>
		<tr>
			<td>
				<table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
	         <tr>
	           <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
	             <tr>
	               <td valign="top"><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
	                 <tr>
	                   <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	                     <tr>
	                       <td width="17%" height="20" align="center" valign="bottom"><span class="title">在线测试</span></td>
	                       <td width="76%" class="STYLE4">&nbsp;</td>
	                       <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
	                     </tr>
	                   </table></td>
	                 </tr>
	                 <tr>
	                   <td width="100%" height="669" valign="top" background="qtimages/5.gif">
	                   <form name="form1" id="form1" method="post" action="">
	                     	搜索&nbsp;&nbsp;试卷编号:<input name="bianhao" type="text" id="bianhao" />
	                                                       专业:<input name="mingcheng" type="text" id="mingcheng" />
	 											<input type="submit" name="Submit5" value="查找" />
	                   </form>
	                   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
	                   	<tr align="center">
	                      <td width="28" bgcolor="CCFFFF">序号</td>
	                      <td width="125" bgcolor='#CCFFFF'>试卷编号</td>
	                      <td width="141" bgcolor='#CCFFFF'>专业</td>
	                      <td width="102" bgcolor='#CCFFFF'>题数</td>
	                      <td width="94" bgcolor='#CCFFFF'>分值</td>
	                      <td width="154" align="center" bgcolor="CCFFFF">操作</td>
	                    </tr>
	                    <%
											  String sql="";
											  sql="select * from zidongzujuan where 1=1";
											  if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}
											  else{
											  	sql=sql+" and bianhao like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";
											  }
											  if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null ){}
											  else{
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
											      bianhao=RS_result.getString("bianhao");
											      zhuanye=RS_result.getString("zhuanye");
											      tishu=RS_result.getString("tishu");
											      fenzhi=RS_result.getString("fenzhi");
											      addtime=RS_result.getString("addtime"); 
											      timu=RS_result.getString("timu");
											%>
	                    <tr align="center">
	                      <td width="28"><%=i %></td>
	                      <td><%=bianhao %></td>
	                      <td><%=zhuanye %></td>
	                      <td><%=tishu %></td>
	                      <td><%=fenzhi %></td>
	                      <td width="154" align="center"><a href="shijuan_detail2.jsp?id=<%=id%>" >开始测试</a></td>
	                    </tr>
	                    <%
												}
	 										%>
	                      </table>
	                      <br>
															<p align="center">以上数据共 <%=i %> 条,
																<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
															</p>
															<p align="center">&nbsp;</p>
	                      <p align="center"></td>
	                  	</tr>
	                  <tr>
	                    <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
	                  </tr>
	                </table></td>
	              </tr>
	            </table></td>
	            <td valign="top"><%@ include file="qtleft.jsp"%></td>
	      	</tr>
	    	</table>
	  	</td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>