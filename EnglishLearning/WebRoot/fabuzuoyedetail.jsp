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
<body>
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
	                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">练习作业</span></td>
	                        <td width="76%" class="STYLE4">&nbsp;</td>
	                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
	                      </tr>
	                    </table></td>
	                  </tr>
	                  <tr>
	                    <td width="100%" height="669" valign="top" background="qtimages/5.gif">
	                    <p>
	                    <%
											  String sql="select * from fabuzuoye where id="+id;
											  String zuoyeID="";String mingcheng="";String neirong="";String fujian="";String tijiaoqixian="";String faburen="";
											  ResultSet RS_result=connDbBean.executeQuery(sql);
											  while(RS_result.next()){
											      zuoyeID=RS_result.getString("zuoyeID");
											      mingcheng=RS_result.getString("mingcheng");
											      neirong=RS_result.getString("neirong");
											      fujian=RS_result.getString("fujian");
											      tijiaoqixian=RS_result.getString("tijiaoqixian");
											      faburen=RS_result.getString("faburen");
											  }
	   									%>
	                    </p>
									<table width="98%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F8C878" style="border-collapse:collapse">
										<tr align="center">
											<td width='11%'>作业编号</td>
											<td width='39%'><%=zuoyeID%></td>
										</tr>
										<tr align="center">
									    <td width='11%'>名称</td>
									    <td width='39%'><%=mingcheng%></td>
									  </tr>
									  <tr align="center">
									    <td width='11%'>发布人</td>
									    <td width='39%'><%=faburen%></td>
									  </tr>
									  <tr align="center">
									    <td width='11%'>附件</td>
									    <td width='39%'><a href='<%=fujian %>' target='_blank'>下载</a></td>
									  </tr>
									  <tr align="center">
									    <td width='11%'>提交期限</td>
									    <td width='39%'><%=tijiaoqixian%></td>
									  </tr>
									  <tr align="center">
									    <td height="87" align="center">内容</td>
									    <td><%=neirong%></td>
									  </tr>
									  <tr align="center">
									    <td colspan="2"><input type="button" name="Submit5" value="返回" onClick="javascript:history.back()" /></td>
									  </tr></table>
                      <p align="center">&nbsp;</p>
                      <P align=center></td>
                  </tr>
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