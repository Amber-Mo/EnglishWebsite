
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
    <title>�ɼ��鿴</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
  </head>
<body >
	<p>�ɼ��б�</p>
	<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00ffff" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="8%" bgcolor="A4B6D7">���</td>
	    <td width="21%" bgcolor='#A4B6D7'>�û���</td>
	    <td width="17%" bgcolor='#A4B6D7'>�Ծ���</td>
	    <td width="18%" bgcolor='#A4B6D7'>�ɼ�</td>
	    <td width="26%" bgcolor="A4B6D7">����ʱ��</td>
	    <td width="10%" bgcolor="A4B6D7">����</td>
	  </tr>
  	<%
			String sql="";
			sql="select * from cj where username='"+request.getSession().getAttribute("username")+"'";
			sql=sql+" order by id desc";
			ResultSet RS_result=connDbBean.executeQuery(sql);
			String id="";
			String username="";String cj="";String sjbh="";
			String addtime="";
			int i=0;
			while(RS_result.next()){
			    i=i+1;
				 id=RS_result.getString("id");
				 username=RS_result.getString("username");
				 cj=RS_result.getString("cj");
				 sjbh=RS_result.getString("sjbh");
				 addtime=RS_result.getString("addtime");
		%>
	  <tr align="center">
	    <td><%=i %></td>
	    <td><%=username %></td>
	    <td><%=sjbh %></td>
	    <td><%=cj %></td>
	    <td><%=addtime.substring(0,19) %></td>
	    <td><a href="del.jsp?id=<%=id %>&tablename=cj" onclick="return confirm('���Ҫɾ����')">ɾ��</a> </td>
	  </tr>
  	<%
  		}
   	%>
</table>
<br>
 	�������ݹ� <%=i %> ��,
 	<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
</body>
</html>

