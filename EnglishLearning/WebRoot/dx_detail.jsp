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
		<style type="text/css">
		.STYLE1 {
			color: #00CCCC;
		}
		body {
			background-color: #E9F8F5;
		}
		.STYLE2 {
			color: #6D2E18; 
			font-weight: bold; 
		}
		</style>
  </head>
  <%
  	String lb=new String(request.getParameter("lb").getBytes("8859_1"));
  %>
<body >
  <table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
		<tr><td><%@ include file="qttop.jsp"%></td></tr>
		<tr>
			<td><table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
	          <tr>
	            <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
	              
	              <tr>
	                <td valign="top"><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
	                  <tr>
	                    <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	                      <tr>
	                        <td width="17%" height="20" align="center" valign="bottom"><span class="title"><%=lb%></span></td>
	                        <td width="76%" class="STYLE4">&nbsp;</td>
	                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
	                      </tr>
	                    </table></td>
	                  </tr>
	                  <tr>
	                    <td width="100%" height="669" valign="top" background="qtimages/5.gif"><p align="center">
	                    <%
												String sql="select content from dx where leibie='"+lb+"'";
											  String neirong="";
											  ResultSet RS_result=connDbBean.executeQuery(sql);
											  while(RS_result.next()){
												neirong=RS_result.getString("content");
	   									%></p>
	                      <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#aae4d5" style="border-collapse:collapse" class="newsline">
	                        <tr>
	                          <td height="110" align="left"><%=neirong %></td>
	                        </tr>
	                        <tr>
	                          <td align="center"><input type="button" name="Submit5" value="返回" onclick="javascript:history.back();" style=" height:19px; border:solid 1px #000000; color:#666666"></td>
	                        </tr>
	                      </table>
	                      <%}%>
	                      <P align=center></td>
	                  </tr>
	                  <tr>
	                    <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
	                  </tr>
	                </table></td>
	              </tr>
	            </table></td>
	            <td valign="top"><%@ include file="qtleft.jsp"%></td>
	          </tr></table></td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>