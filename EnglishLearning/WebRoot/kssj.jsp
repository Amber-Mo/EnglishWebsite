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
    <title>考试时间设置</title>
  </head>
<body >
  <form name="form1" id="form1" method="post" action="kssj_post.jsp">
  <%
	  String sql;
	  sql="select * from kaoshishijian";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
  %>
		<table width="41%" height="126" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="9DC9FF" style="border-collapse:collapse">
	    <tr>
	      <td colspan="2"><div align="center">设置考试时间</div></td>
	    </tr>
	    <tr>
	      <td>考试时间：</td>
	      <td><input name="ymm" type="text" id="ymm" value="<%=RS_result.getString("kssj")%>" /></td>
	    </tr>
	    <tr align="center">
	      <td colspan="2"><input type="submit" name="Submit" value="确定" onClick="return check()" />&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="重置" /></td>
	    </tr>
	  </table>
  <%}%>
  </form>
</body>
</html>

