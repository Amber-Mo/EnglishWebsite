<%
if (request.getSession().getAttribute("cx").equals("��������Ա")){}
else{
	out.print("<script>alert('�Բ���,��û�����Ȩ��!!');history.back();</script>");
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
    <title>�޸�����</title>
  </head>
		<script language="javascript">
			function check()
			{
				if(document.form1.username.value==""){
					alert("�������û���");
					document.form1.username.focus();
					return false;
				}
				if(document.form1.pwd1.value==""){
					alert("����������");
					document.form1.pwd1.focus();
					return false;
				}
				if(document.form1.pwd2.value=="")
				{
					alert("������ȷ������");
					document.form1.pwd2.focus();
					return false;
				}
				if(document.form1.pwd2.value!=document.form1.pwd1.value){
					alert("�������벻һ��,��ȷ��");
					document.form1.pwd1.value="";
					document.form1.pwd2.value="";
					document.form1.pwd1.focus();
					return false;
				}
			}
		</script>
<body >
<form name="form1" id="form1" method="post" action="yhzhgl_post.jsp">
   ��ӹ���Ա�û�<br><br>
   <table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr>
      <td align="center">�û���</td>
      <td><input name="username" type="text" id="username" />
      *</td>
    </tr>
    <tr>
      <td align="center">����</td>
      <td><input name="pwd1" type="password" id="pwd1" />
      *</td>
    </tr>
    <tr>
      <td align="center">ȷ������</td>
      <td><input name="pwd2" type="password" id="pwd2" />
      *</td>
    </tr>
    <tr align="center">
      <td colspan="2">
	      <input type="submit" name="Submit" value="�ύ" onclick="return check();" />&nbsp;&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>
<br>
<p>����Ա�б�</p>
<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr align="center">
    <td bgcolor="A4B6D7">���</td>
    <td bgcolor="A4B6D7">�û���</td>
    <td bgcolor="A4B6D7">����</td>
    <td bgcolor="A4B6D7">Ȩ��</td>
    <td bgcolor="A4B6D7">���ʱ��</td>
    <td bgcolor="A4B6D7">����</td>
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
    <td><a href="del.jsp?id=<%=id %>&tablename=allusers" onclick="return confirm('���Ҫɾ����')">ɾ��</a></td>
  </tr>
  	<%
  }
   %>
</table>
</body>
</html>

