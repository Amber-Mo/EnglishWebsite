
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
    <title>�Զ����</title> 
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
  </head>
<body >
  <p>�Զ�����б�</p>
  <form name="form1" id="form1" method="post" action="">
   	����&nbsp;&nbsp;���:
     <input name="bianhao" type="text" id="bianhao" />
          רҵ:
     <input name="mingcheng" type="text" id="mingcheng" />
     <input type="submit" name="Submit" value="����" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" align="center" bgcolor="CCFFFF">���</td>
	    <td width="86" bgcolor='#CCFFFF'>���</td>
	    <td width="90" bgcolor='#CCFFFF'>רҵ</td>
	    <td width="57" bgcolor='#CCFFFF'>����</td>
	    <td width="249" bgcolor='#CCFFFF'>��������ID�������</td>
	    <td width="80" bgcolor='#CCFFFF'>��ֵ</td>
	    <td width="130" align="center" bgcolor="CCFFFF">���ʱ��</td>
	    <td width="145" align="center" bgcolor="CCFFFF">����</td>
	  </tr>
	 <%
	  String sql="";
	  sql="select * from zidongzujuan where 1=1";
	  if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null )
	  {}
	  else
	  {
	  	sql=sql+" and bianhao like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";
	  }
	  if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null )
	  {}
	  else
	  {
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
		 bianhao=RS_result.getString("bianhao");zhuanye=RS_result.getString("zhuanye");tishu=RS_result.getString("tishu");fenzhi=RS_result.getString("fenzhi");
		 addtime=RS_result.getString("addtime"); timu=RS_result.getString("timu");
	%>
	  <tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=bianhao %></td>
	    <td><%=zhuanye %></td>
	    <td><%=tishu %></td>
	    <td><%=timu%></td>
	    <td><%=fenzhi %></td>
	    <td width="130" align="center"><%=addtime.substring(0,19) %></td>
	    <td width="145" align="center">
	    <a href="shijuan_detail.jsp?id=<%=id%>" target="_blank">�鿴�Ծ�</a> 
	    <a href="zidongzujuan_updt.jsp?id=<%=id%>">�ֹ��޸�</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=zidongzujuan" onClick="return confirm('���Ҫɾ����')">ɾ��</a></td>
	  </tr>
	  	<%
	  }
	   %>
	</table>
	<br>
	<p align="center">�������ݹ� <%=i %> ��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a></p>
</body>
</html>

