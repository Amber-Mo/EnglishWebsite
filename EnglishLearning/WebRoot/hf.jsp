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
    <title>留言板</title>
  </head>
<body >
  <%
  	String id=request.getParameter("id");
  %>
  <form name="form1" id="form1" method="post" action="hf_post.jsp?id=<%=id %>">
     	回复留言<br><br>
  <%
	  String sql="select * from liuyanban where id="+id;
	  String cheng="";
	  String xingbie="";
	  String QQ="";
	  String youxiang="";
	  String dianhua="";
	  String huifuneirong="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	      cheng=RS_result.getString("cheng");
	      xingbie=RS_result.getString("xingbie");
	      QQ=RS_result.getString("QQ");
	      youxiang=RS_result.getString("youxiang");
	      dianhua=RS_result.getString("dianhua");
	      huifuneirong=RS_result.getString("huifuneirong");
	  }
	%>
		<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
			<tr>
	     <td align="center">回复内容</td><td><textarea name="huifuneirong" rows="1" cols="60" onscroll="this.rows++;" id="huifuneirong"><%= huifuneirong%></textarea></td></tr>
	    <tr align="center">
	      <td colspan="2"><input type="submit" name="Submit" value="提交" />&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="重置" /></td>
	    </tr>
		</table>
	</form>
</body>
</html>


