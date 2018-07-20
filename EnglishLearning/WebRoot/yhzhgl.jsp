<%
if (request.getSession().getAttribute("cx").equals("超级管理员")){}
else{
	out.print("<script>alert('对不起,您没有这个权限!!');history.back();</script>");
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
    <title>修改密码</title>
  </head>
		<script language="javascript">
			function check()
			{
				if(document.form1.username.value==""){
					alert("请输入用户名");
					document.form1.username.focus();
					return false;
				}
				if(document.form1.pwd1.value==""){
					alert("请输入密码");
					document.form1.pwd1.focus();
					return false;
				}
				if(document.form1.pwd2.value=="")
				{
					alert("请输入确认密码");
					document.form1.pwd2.focus();
					return false;
				}
				if(document.form1.pwd2.value!=document.form1.pwd1.value){
					alert("两次密码不一致,请确认");
					document.form1.pwd1.value="";
					document.form1.pwd2.value="";
					document.form1.pwd1.focus();
					return false;
				}
			}
		</script>
<body >
<form name="form1" id="form1" method="post" action="yhzhgl_post.jsp">
   添加管理员用户<br><br>
   <table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr>
      <td align="center">用户名</td>
      <td><input name="username" type="text" id="username" />
      *</td>
    </tr>
    <tr>
      <td align="center">密码</td>
      <td><input name="pwd1" type="password" id="pwd1" />
      *</td>
    </tr>
    <tr>
      <td align="center">确认密码</td>
      <td><input name="pwd2" type="password" id="pwd2" />
      *</td>
    </tr>
    <tr align="center">
      <td colspan="2">
	      <input type="submit" name="Submit" value="提交" onclick="return check();" />&nbsp;&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>
<br>
<p>管理员列表</p>
<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr align="center">
    <td bgcolor="A4B6D7">序号</td>
    <td bgcolor="A4B6D7">用户名</td>
    <td bgcolor="A4B6D7">密码</td>
    <td bgcolor="A4B6D7">权限</td>
    <td bgcolor="A4B6D7">添加时间</td>
    <td bgcolor="A4B6D7">操作</td>
  </tr>
  <%
		 ResultSet RS_result=connDbBean.executeQuery("select * from allusers order by id desc" );
		 String id="";
		 String username="";
		 String pwd="";
		 String cx="";
		 String addtime="";
		 int i=0;
		 while(RS_result.next()){
		     i=i+1;
			   id=RS_result.getString("id");
			 	 username=RS_result.getString("username");
			   pwd=RS_result.getString("pwd");
			   cx=RS_result.getString("cx");
			   addtime=RS_result.getString("addtime");
	%>
  <tr align="center">
    <td><%=i %></td>
    <td><%=username %></td>
    <td><%=pwd %></td>
    <td><%=cx %></td>
    <td><%=addtime.substring(0,19) %></td>
    <td><a href="del.jsp?id=<%=id %>&tablename=allusers" onclick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  	<%
  }
   %>
</table>
</body>
</html>

