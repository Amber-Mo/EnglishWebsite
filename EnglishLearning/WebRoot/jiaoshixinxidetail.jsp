<%
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
		out.print("<script>javascript:alert('对不起，请您先登录！');history.back();</script>");
	}
%>
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
  	String id=request.getParameter("id");
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
	                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">师资队伍</span></td>
	                        <td width="76%" class="STYLE4">&nbsp;</td>
	                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
	                      </tr>
	                    </table></td>
	                  </tr>
	                  <tr>
	                    <td width="100%" height="669" valign="top" background="qtimages/5.gif"><%
	  String sql="select * from jiaoshixinxi where id="+id;
	  String gonghao="";
	  String xingming="";
	  String mima="";
	  String chushengnianyue="";
	  String shenfenzheng="";
	  String xingbie="";String zhicheng="";
	  String zhaopian="";
	  String zhujiaokecheng="";
	  String dianhua="";
	  String beizhu="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
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
	  }
	   %>
		<table width="100%" height="410" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00ffff" style="border-collapse:collapse">
	  	<tr>
	       <td align="center" width='11%' height="35">工号</td>
	        <td align="center" width='39%' height="35"><%=gonghao%></td>
	        <td colspan="2" rowspan="8" align="center"><img src="<%=zhaopian%>" width="279" height="205" /></td>
	    </tr>
	    <tr align="center">
		    <td width='11%' height="35">姓名</td>
		    <td width='39%' height="35"><%=xingming%></td>
	    </tr>
	    <tr align="center">
		    <td height="35">出生年月</td>
				<td height="35"><%=chushengnianyue%></td>
			</tr>
			<tr align="center">
		    <td height="35">身份证</td>
				<td height="35"><%=shenfenzheng%></td>
			</tr>
			<tr align="center">
			<td height="35">性别</td>
			<td height="35"><%=xingbie%></td>
			</tr>
			<tr align="center">
			<td width='11%' height="35">电话</td>
			<td width='39%' height="35"><%=dianhua%></td>
			</tr>
			<tr align="center">
				<td width='11%' height="35">职称</td>
				<td width='39%' height="35"><%=zhicheng%></td>
			</tr>
			<tr align="center">
				<td width='11%' height="35">主教课程</td>
				<td width='39%' height="35"><%=zhujiaokecheng%></td>
			</tr>
			<tr align="center">
				<td width='11%' height="100">备注</td>
				<td colspan="2"><%=beizhu%></td>
			<tr>
				<td height="32" colspan="3" align="center">
				<input type="button" name="Submit5" value="返回" onclick="javascript:history.back()" /></td>
			</tr>
		</table>
		<p align="center">&nbsp;</p>
		<p align="center">&nbsp;</p>
		<p align=center></td></tr>
		<tr>
			<td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
		</tr>
		</table></td></tr>
		</table></td>
			<td valign="top"><%@ include file="qtleft.jsp"%></td>
		</tr>
		</table></td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>