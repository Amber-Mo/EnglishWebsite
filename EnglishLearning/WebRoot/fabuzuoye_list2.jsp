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
    <title>������ҵ</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body>
	<p>�ѷ�����ҵ�б�</p>
  <form name="form1" id="form1" method="post" action="">
		����&nbsp;&nbsp;
		��ҵ��ţ�<input name="zuoyeID" type="text" id="zuoyeID" /> 
		���ƣ�<input name="mingcheng" type="text" id="mingcheng" />
		�ύ���ޣ�<input name="tijiaoqixian1" type="text" id="tijiaoqixian1"  value='' onclick="getDate(form1.tijiaoqixian1,'2')" need="1" size="10" />-<input name="tijiaoqixian2" type="text" id="tijiaoqixian2"  value='' onclick="getDate(form1.tijiaoqixian2,'2')" need="1" size="10"  />
		<input type="submit" name="Submit" value="����" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
	    <td width="30" bgcolor="CCFFFF">���</td>
	    <td bgcolor='#CCFFFF'>��ҵ���</td>
	    <td bgcolor='#CCFFFF'>����</td>
	    <td bgcolor='#CCFFFF'>����</td>
	    <td bgcolor='#CCFFFF'>�ύ����</td>
	    <td bgcolor='#CCFFFF'>������</td>
	    <td width="130" bgcolor="CCFFFF">���ʱ��</td>
	    <td width="90" bgcolor="CCFFFF">����</td>
	  </tr>
  	<%
			int curpage=1;//��ǰҳ
			int page_record=10;//ÿҳ��ʾ�ļ�¼��
			int zgs=0;
			int zys=0;
			//������ķ�����sql��ѯ��ɣ��ٶȿ죩
			String hsgnpage=request.getParameter("page");
			String fysql="select count(id) as ss from fabuzuoye where faburen='"+request.getSession().getAttribute("username")+"'";
			ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
			while(RS_resultfy.next()){
			    zgs=Integer.parseInt(RS_resultfy.getString("ss"));
			    zys=zgs/page_record+1;
			}
			if (hsgnpage!=null){
			    curpage=Integer.parseInt(request.getParameter("page"));//��ȡ���ݵ�ֵ����Ҫ��ʾ��ҳ
			}
			else{
			    curpage=1;
			}
			if (curpage==0){
			    curpage=1;
			}
			if(curpage>zys){
			    curpage=zys;
			}
   		sql="";
  		sql="select top "+page_record+" * from fabuzuoye where faburen='"+request.getSession().getAttribute("username")+"' and id not in (select top "+((curpage-1)*page_record)+" id from fabuzuoye where faburen='"+request.getSession().getAttribute("username")+"' order by id desc) ";
			if(request.getParameter("zuoyeID")=="" ||request.getParameter("zuoyeID")==null ){}
			else{
			    sql=sql+" and zuoyeID like '%"+new String(request.getParameter("zuoyeID").getBytes("8859_1"))+"%'";
			}
			if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null ){}
			else{
			    sql=sql+" and mingcheng like '%"+new String(request.getParameter("mingcheng").getBytes("8859_1"))+"%'";
			}
			if (request.getParameter("tijiaoqixian1")==""  ||request.getParameter("tijiaoqixian1")==null ) {}
			else{
			    sql=sql+" and tijiaoqixian >= '"+new String(request.getParameter("tijiaoqixian1").getBytes("8859_1"))+"'";
			}
			if (request.getParameter("tijiaoqixian2")==""  ||request.getParameter("tijiaoqixian2")==null ) {}
			else{
			    sql=sql+" and tijiaoqixian <= '"+new String(request.getParameter("tijiaoqixian2").getBytes("8859_1"))+"'";
			}
			sql=sql+" order by id desc";
			RS_result=connDbBean.executeQuery(sql);
			String id="";
			String zuoyeID="";
			String mingcheng="";
			String neirong="";
			String fujian="";
			String tijiaoqixian="";
			String faburen="";
			String addtime="";
			int i=0;
			while(RS_result.next()){
			    i=i+1;
			 		id=RS_result.getString("id");
					zuoyeID=RS_result.getString("zuoyeID");
					mingcheng=RS_result.getString("mingcheng");
					neirong=RS_result.getString("neirong");
					fujian=RS_result.getString("fujian");
					tijiaoqixian=RS_result.getString("tijiaoqixian");
					faburen=RS_result.getString("faburen");
			 		addtime=RS_result.getString("addtime");
		%>
  	<tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=zuoyeID %></td>
	    <td><%=mingcheng %></td>
	    <td><a href='<%=fujian %>' target='_blank'>����</a></td>
	    <td><%=tijiaoqixian %></td>
	    <td><%=faburen %></td>
	    <td width="130"><%=addtime.substring(0,19) %></td>
	    <td width="90">
		    <a href="fabuzuoye_updt.jsp?id=<%=id%>">�޸�</a>  
		    <a href="del.jsp?id=<%=id %>&tablename=fabuzuoye" onClick="return confirm('���Ҫɾ����')">ɾ��</a> 
		    <a href="fabuzuoyedetail.jsp?id=<%=id%>" target="_blank">��ϸ</a>
		  </td>
		</tr>
  	<%
  		}
    %>
	</table><br>
	<p align="center">�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a></p>
	<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="fabuzuoye_list2.jsp?page=1">��ҳ</a>��<a href="fabuzuoye_list2.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="fabuzuoye_list2.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="fabuzuoye_list2.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
</body>
</html>

