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
    <title>ѧ����Ϣ</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body>
  <p>ѧ����Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����&nbsp;&nbsp;ѧ�ţ�<input name="xuehao" type="text" id="xuehao" /> ������<input name="xingming" type="text" id="xingming" />�༶��<select name='banji' id='banji'><option value="">����</option><% sql="select banji from banjixinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("banji")%>" ><%=RS_result.getString("banji")%></option><%}%></select> �Ա�<select name="xingbie" id="xingbie"><option value="">����</option><option value="��">��</option><option value="Ů">Ů</option></select> �绰��<input name="dianhua" type="text" id="dianhua" /> ���֤��<input name="shenfenzheng" type="text" id="shenfenzheng" />
   <input type="submit" name="Submit" value="����" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" align="center" bgcolor="CCFFFF">���</td>
	    <td bgcolor='#ccffff'>ѧ��</td>
	    <td bgcolor='#ccffff'>����</td>
	    <td bgcolor='#ccffff'>�༶</td>
	    <td bgcolor='#ccffff'>�Ա�</td>
	    <td bgcolor='#ccffff'>�绰</td>
	    <td bgcolor='#ccffff'>��Ƭ</td>
	    <td bgcolor='#ccffff'>���֤</td>
	    <td bgcolor='#ccffff'>��ͥסַ</td>
	    <td bgcolor='#ccffff'>��ע</td>
	    <td bgcolor='#ccffff'>����</td>
	    <td bgcolor="CCFFFF">���ʱ��</td>
	    <td bgcolor="CCFFFF">����</td>
	  </tr>
	  <%
  		int curpage=1;//��ǰҳ
			int page_record=10;//ÿҳ��ʾ�ļ�¼��
			int zgs=0;
			int zys=0;
			//������ķ�����sql��ѯ��ɣ��ٶȿ죩
			String hsgnpage=request.getParameter("page");
			String fysql="select count(id) as ss from xueshengxinxi";
			ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
		  while(RS_resultfy.next()){
		      zgs=Integer.parseInt(RS_resultfy.getString("ss"));
		  		zys=zgs/page_record+1;
		  }
			if (hsgnpage!=null)
			{
			curpage=Integer.parseInt(request.getParameter("page"));//��ȡ���ݵ�ֵ����Ҫ��ʾ��ҳ
			}
			else
			{
			curpage=1;
			}
			if (curpage==0)
			{
				curpage=1;
			}
			if(curpage>zys)
			{
				curpage=zys;
			}
		 sql="";
		 sql="select top "+page_record+" * from xueshengxinxi where id not in (select top "+((curpage-1)*page_record)+" id from xueshengxinxi order by id desc) ";
		  
		 if(request.getParameter("xuehao")=="" ||request.getParameter("xuehao")==null ){}else{sql=sql+" and xuehao like '%"+new String(request.getParameter("xuehao").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+new String(request.getParameter("xingming").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("banji")=="����" ||request.getParameter("banji")==null ){}else{sql=sql+" and banji like '%"+new String(request.getParameter("banji").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("xingbie")=="����" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+new String(request.getParameter("xingbie").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("dianhua")=="" ||request.getParameter("dianhua")==null ){}else{sql=sql+" and dianhua like '%"+new String(request.getParameter("dianhua").getBytes("8859_1"))+"%'";}
		 if(request.getParameter("shenfenzheng")=="" ||request.getParameter("shenfenzheng")==null ){}else{sql=sql+" and shenfenzheng like '%"+new String(request.getParameter("shenfenzheng").getBytes("8859_1"))+"%'";}
		 sql=sql+" order by id desc";
		 RS_result=connDbBean.executeQuery(sql);
		 String id="";
		 String xuehao="";String xingming="";String banji="";String xingbie="";String dianhua="";String zhaopian="";String shenfenzheng="";String jiatingzhuzhi="";String beizhu="";String mima="";
		 String addtime="";
		 int i=0;
		 while(RS_result.next()){
		 i=i+1;
		 id=RS_result.getString("id");
		 xuehao=RS_result.getString("xuehao");xingming=RS_result.getString("xingming");banji=RS_result.getString("banji");xingbie=RS_result.getString("xingbie");dianhua=RS_result.getString("dianhua");zhaopian=RS_result.getString("zhaopian");shenfenzheng=RS_result.getString("shenfenzheng");jiatingzhuzhi=RS_result.getString("jiatingzhuzhi");beizhu=RS_result.getString("beizhu");mima=RS_result.getString("mima");
		 addtime=RS_result.getString("addtime");
	%>
	  <tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=xuehao %></td><td><%=xingming %></td><td><%=banji %></td><td><%=xingbie %></td><td><%=dianhua %></td><td><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td><td><%=shenfenzheng %></td><td><%=jiatingzhuzhi %></td><td><%=beizhu %></td><td><%=mima %></td>
	    <td><%=addtime.substring(0,19) %></td>
	    <td><a href="xueshengxinxi_updt.jsp?id=<%=id%>">�޸�</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=xueshengxinxi" onclick="return confirm('���Ҫɾ����')">ɾ��</a> 
	  </tr>
	  <%
	  	}
	  %>
	</table><br>
	<p align="center">�������ݹ�<%=i %>��,<a style="cursor:hand" onclick="javascript:window.print();">��ӡ��ҳ</a></p>
	<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��
	<a href="xueshengxinxi_list.jsp?page=1">��ҳ</a>��
	<a href="xueshengxinxi_list.jsp?page=<%= curpage-1%>">��һҳ</a>��
	<a href="xueshengxinxi_list.jsp?page=<%= curpage+1%>">��һҳ</a>��
	<a href="xueshengxinxi_list.jsp?page=<%=zys %>">βҳ</a>��
	��ǰ��<font color=red><%=curpage %></font>ҳ/��<font color=red><%=zys %></font>ҳ</p>
</body>
</html>
