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
    <title>��ҵ�ύ</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body >
  <p>���ύ��ҵ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����&nbsp;&nbsp;��ʦ��<select name='jiaoshi' id='jiaoshi'><option value="">����</option><% sql="select gonghao from jiaoshixinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("gonghao")%>" ><%=RS_result.getString("gonghao")%></option><%}%></select> 
   ��ҵ���ƣ�<input name="zuoyemingcheng" type="text" id="zuoyemingcheng" />
     <input type="submit" name="Submit" value="����" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" bgcolor="CCFFFF">���</td>
	    <td bgcolor='#CCFFFF'>��ʦ</td>
	    <td bgcolor='#CCFFFF'>��ҵ����</td>
	    <td bgcolor='#CCFFFF'>����</td>
	    <td bgcolor='#CCFFFF'>�ύ��</td>
	    <td width="150" align="center" bgcolor="CCFFFF">���ʱ��</td>
	    <td width="60" align="center" bgcolor="CCFFFF">����</td>
	  </tr>
	  <%
  			int curpage=1;//��ǰҳ
				int page_record=10;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from zuoyetijiao where tijiaoren='"+request.getSession().getAttribute("username")+"'";
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
				 sql="select top "+page_record+" * from zuoyetijiao where tijiaoren='"+request.getSession().getAttribute("username")+"' and id not in (select top "+((curpage-1)*page_record)+" id from zuoyetijiao where tijiaoren='"+request.getSession().getAttribute("username")+"' order by id desc) ";
				 if(request.getParameter("jiaoshi")=="����" ||request.getParameter("jiaoshi")==null ){}else{sql=sql+" and jiaoshi like '%"+new String(request.getParameter("jiaoshi").getBytes("8859_1"))+"%'";}
				 if(request.getParameter("zuoyemingcheng")=="" ||request.getParameter("zuoyemingcheng")==null ){}else{sql=sql+" and zuoyemingcheng like '%"+new String(request.getParameter("zuoyemingcheng").getBytes("8859_1"))+"%'";}
				 sql=sql+" order by id desc";
				 RS_result=connDbBean.executeQuery(sql);
				 String id="";
				 String jiaoshi="";
				 String zuoyemingcheng="";
				 String neirong="";
				 String fujian="";
				 String tijiaoren="";
				 String addtime="";
				 int i=0;
				 while(RS_result.next()){
				 i=i+1;
				 id=RS_result.getString("id");
				 jiaoshi=RS_result.getString("jiaoshi");
				 zuoyemingcheng=RS_result.getString("zuoyemingcheng");
				 neirong=RS_result.getString("neirong");
				 fujian=RS_result.getString("fujian");
				 tijiaoren=RS_result.getString("tijiaoren");
				 addtime=RS_result.getString("addtime");
	 %>
	  <tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=jiaoshi %></td><td><%=zuoyemingcheng %></td><td><a href='<%=fujian %>' target='_blank'>����</a></td><td><%=tijiaoren %></td>
	    <td width="150" align="center"><%=addtime.substring(0,19) %></td>
	    <td width="90" align="center"><a href="zuoyetijiao_updt.jsp?id=<%=id%>">�޸�</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=zuoyetijiao" onClick="return confirm('���Ҫɾ����')">ɾ��</a> 
	    <a href="zuoyetijiao_detail.jsp?id=<%=id%>">��ϸ</a></td>
	  </tr>
	  	<%
	  }
	   %>
	</table><br>
	<p align="center">�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a></p>
	<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="zuoyetijiao_list2.jsp?page=1">��ҳ</a>��<a href="zuoyetijiao_list2.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="zuoyetijiao_list2.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="zuoyetijiao_list2.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
</body>
</html>

