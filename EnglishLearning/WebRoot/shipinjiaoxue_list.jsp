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
    <title>��Ƶ��ѧ</title>
		<link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body >
  <p>��ѧ��Ƶ�б�</p>
  <form name="form1" id="form1" method="post" action="">
		 ����&nbsp;&nbsp;��ţ�<input name="bianhao" type="text" id="bianhao" /> 
		 �̲����ƣ�<input name="jiaocaimingcheng" type="text" id="jiaocaimingcheng" />
		 �γ̣�<select name='kecheng' id='kecheng'><option value="">����</option><% sql="select kechengmingcheng from kechengxinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("kechengmingcheng")%>" ><%=RS_result.getString("kechengmingcheng")%></option><%}%></select>
		 <input type="submit" name="Submit" value="����" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" bgcolor="CCFFFF">���</td>
	    <td bgcolor='#CCFFFF'>���</td>
	    <td bgcolor='#CCFFFF'>�̲�����</td>
	    <td bgcolor='#CCFFFF'>�γ�</td>
	    <td bgcolor='#CCFFFF'>������</td>
	    <td bgcolor='#CCFFFF'>��Ƶ�ļ�</td>
	    <td width="140" align="center" bgcolor="CCFFFF">���ʱ��</td>
	    <td width="90" align="center" bgcolor="CCFFFF">����</td>
	  </tr>
  <%
  	int curpage=1;//��ǰҳ
		int page_record=10;//ÿҳ��ʾ�ļ�¼��
		int zgs=0;
		int zys=0;
		//������ķ�����sql��ѯ��ɣ��ٶȿ죩
		String hsgnpage=request.getParameter("page");
		String fysql="select count(id) as ss from shipinjiaoxue";
		ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
    while(RS_resultfy.next()){
		    zgs=Integer.parseInt(RS_resultfy.getString("ss"));
		    zys=zgs/page_record+1;
  	}
		if (hsgnpage!=null){
				curpage=Integer.parseInt(request.getParameter("page"));//��ȡ���ݵ�ֵ����Ҫ��ʾ��ҳ
		}else{
				curpage=1;
		}
		if (curpage==0){
				curpage=1;
		}
		if(curpage>zys){
				curpage=zys;
		}
    sql="";
  	sql="select top "+page_record+" * from shipinjiaoxue where id not in (select top "+((curpage-1)*page_record)+" id from shipinjiaoxue order by id desc) ";
		if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}else{sql=sql+" and bianhao like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";}
		if(request.getParameter("jiaocaimingcheng")=="" ||request.getParameter("jiaocaimingcheng")==null ){}else{sql=sql+" and jiaocaimingcheng like '%"+new String(request.getParameter("jiaocaimingcheng").getBytes("8859_1"))+"%'";}
		if(request.getParameter("kecheng")=="����" ||request.getParameter("kecheng")==null ){}else{sql=sql+" and kecheng like '%"+new String(request.getParameter("kecheng").getBytes("8859_1"))+"%'";}
  	sql=sql+" order by id desc";
  	RS_result=connDbBean.executeQuery(sql);
	  String id="";
	  String bianhao="";
	  String jiaocaimingcheng="";
	  String kecheng="";
	  String zhujiangren="";
	  String shipinwenjian="";
	  String beizhu="";
	  String addtime="";
	  int i=0;
		while(RS_result.next()){
		    i=i+1;
				id=RS_result.getString("id");
				bianhao=RS_result.getString("bianhao");
				jiaocaimingcheng=RS_result.getString("jiaocaimingcheng");
				kecheng=RS_result.getString("kecheng");
				zhujiangren=RS_result.getString("zhujiangren");
				shipinwenjian=RS_result.getString("shipinwenjian");
				beizhu=RS_result.getString("beizhu");
				addtime=RS_result.getString("addtime");
	%>
		<tr align="center">
	  	<td width="30" align="center"><%=i %></td>
	    <td><%=bianhao %></td><td><%=jiaocaimingcheng %></td><td><%=kecheng %></td>
	    <td><%=zhujiangren %></td>
	    <td><a href='<%=shipinwenjian %>' target='_blank'>����</a></td>
	    <td width="140" align="center"><%=addtime.substring(0,19) %></td>
	    <td width="90" align="center"><a href="shipinjiaoxue_updt.jsp?id=<%=id%>">�޸�</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=shipinjiaoxue" onClick="return confirm('���Ҫɾ����')">ɾ��</a> 
	    <a href="shipinjiaoxuedetail.jsp?id=<%=id%>" target="_blank">��ϸ</a></td>
	  </tr>
	<%
  	}
  %>
	</table><br>
	<p align="center">�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a></p>
	<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��
	<a href="shipinjiaoxue_list.jsp?page=1">��ҳ</a>��<a href="shipinjiaoxue_list.jsp?page=<%= curpage-1%>">��һҳ</a>��
	<a href="shipinjiaoxue_list.jsp?page=<%= curpage+1%>">��һҳ</a>��
	<a href="shipinjiaoxue_list.jsp?page=<%=zys %>">βҳ</a>��
	��ǰ��<font color=red><%=curpage %></font>ҳ/��<font color=red><%=zys %></font>ҳ</p>
</body>
</html>
