
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
    <title>ѡ����</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
  </head>
<body >
  <p>ѡ�����б�</p>
  <form name="form1" id="form1" method="post" action="">
	    ����&nbsp;&nbsp;רҵ:<input name="bianhao" type="text" id="bianhao" />
	     ��Ŀ:<input name="mingcheng" type="text" id="mingcheng" />
	     <input type="submit" name="Submit" value="����" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" align="center" bgcolor="CCFFFF">���</td>
	    <td bgcolor='#CCFFFF'>רҵ</td>
	    <td bgcolor='#CCFFFF'>ѧ��</td>
	    <td bgcolor='#CCFFFF'>��Ŀ</td>
	    <td bgcolor='#CCFFFF'>ѡ��A</td>
	    <td bgcolor='#CCFFFF'>ѡ��B</td>
	    <td bgcolor='#CCFFFF'>ѡ��C</td>
	    <td bgcolor='#CCFFFF'>ѡ��D</td>
	    <td bgcolor='#CCFFFF'>��</td>
	    <td bgcolor='#CCFFFF'>�Ѷ�ϵ��</td>
	    <td width="130" align="center" bgcolor="CCFFFF">���ʱ��</td>
	    <td width="60" align="center" bgcolor="CCFFFF">����</td>
	  </tr>
	  <%
	  String sql="";
	  sql="select * from xuanzeti where 1=1";
	  if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null )
	  {}
	  else
	  {
	  	sql=sql+" and zhuanye like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";
	  }
	  if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null )
	  {}
	  else
	  {
	  	sql=sql+" and timu like '%"+new String(request.getParameter("mingcheng").getBytes("8859_1"))+"%'";
	  }
	  sql=sql+" order by id desc";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  String id="";
	  String zhuanye="";String xueke="";String timu="";String xuanxiangA="";String xuanxiangB="";String xuanxiangC="";String xuanxiangD="";String daan="";String nanduxishu="";
	  String addtime="";
	  int i=0;
	  while(RS_result.next()){
			 i=i+1;
			 id=RS_result.getString("id");
		   zhuanye=RS_result.getString("zhuanye");xueke=RS_result.getString("xueke");timu=RS_result.getString("timu");xuanxiangA=RS_result.getString("xuanxiangA");xuanxiangB=RS_result.getString("xuanxiangB");xuanxiangC=RS_result.getString("xuanxiangC");xuanxiangD=RS_result.getString("xuanxiangD");daan=RS_result.getString("daan");nanduxishu=RS_result.getString("nanduxishu");
			 addtime=RS_result.getString("addtime");
	 %>
	  <tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=zhuanye %></td>
	    <td><%=xueke %></td>
	    <td><%=timu %></td>
	    <td><%=xuanxiangA %></td>
	    <td><%=xuanxiangB %></td>
	    <td><%=xuanxiangC %></td>
	    <td><%=xuanxiangD %></td>
	    <td><%=daan %></td>
	    <td><%=nanduxishu %></td>
	    <td width="130" align="center"><%=addtime.substring(0,19) %></td>
	    <td width="60" align="center"><a href="xuanzeti_updt.jsp?id=<%=id%>">�޸�</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=xuanzeti" onClick="return confirm('���Ҫɾ����')">ɾ��</a></td>
	  </tr>
	  	<%
	  }
	   %>
	</table><br>
	<p align="center">�������ݹ� <%=i %> ��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a></p>
</body>
</html>

