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
    <title>��ѧӢ������ѧϰ��</title>
    <link href="css/style.css" type="text/css" rel="stylesheet">
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body >
	<table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
		<tr><td><%@ include file="qttop.jsp"%></td></tr>
		<tr>
			<td><table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
	          <tr>
	            <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
	              <tr>
	                <td valign="top"><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
	                  <tr>
	                    <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	                      <tr>
	                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">��ϰ��ҵ</span></td>
	                        <td width="76%" class="STYLE4">&nbsp;</td>
	                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
	                      </tr>
	                    </table></td>
	                  </tr>
	                  <tr>
	                    <td width="100%" height="669" valign="top" background="qtimages/5.gif">
	                    <form name="form1" id="form1" method="post" action="">
	                      	��ҵ��ţ�<input name="zuoyeID" type="text" id="zuoyeID" />
	                      	���ƣ�<input name="mingcheng" type="text" id="mingcheng" />
	                    	     �ύ���ޣ�<input name="tijiaoqixian1" type="text" id="tijiaoqixian1"  value='' onClick="getDate(form1.tijiaoqixian1,'2')" need="1" 
	                    	     size="10" />-<input name="tijiaoqixian2" type="text" id="tijiaoqixian2"  value='' onclick="getDate(form1.tijiaoqixian2,'2')" need="1" size="10"  />
	  													<input type="submit" name="Submit5" value="����" />
	                    </form>
	                      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F8C878" style="border-collapse:collapse">
	                        <tr align="center">
	                          <td width="30" bgcolor="#F8F8C8">���</td>
	                          <td bgcolor='#F8F8C8'>��ҵ���</td>
	                          <td bgcolor='#F8F8C8'>����</td>
	                          <td bgcolor='#F8F8C8'>����</td>
	                          <td bgcolor='#F8F8C8' width='65' align='center'>�ύ����</td>
	                          <td bgcolor='#F8F8C8'>������</td>
	                          <td width="130" bgcolor="#f8f8c8">���ʱ��</td>
	                          <td width="50" bgcolor="#f8f8c8">����</td>
	                        </tr>
				<%
					int curpage=1;//��ǰҳ
					int page_record=10;//ÿҳ��ʾ�ļ�¼��
					int zgs=0;
					int zys=0;
					//������ķ�����sql��ѯ��ɣ��ٶȿ죩
					String hsgnpage=request.getParameter("page");
					String fysql="select count(id) as ss from fabuzuoye";
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
	  			sql="select top "+page_record+" * from fabuzuoye where id not in (select top "+((curpage-1)*page_record)+" id from fabuzuoye order by id desc) ";
					if(request.getParameter("zuoyeID")=="" ||request.getParameter("zuoyeID")==null ){}
					else{sql=sql+" and zuoyeID like '%"+new String(request.getParameter("zuoyeID").getBytes("8859_1"))+"%'";}
					if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null ){}
					else{sql=sql+" and mingcheng like '%"+new String(request.getParameter("mingcheng").getBytes("8859_1"))+"%'";}
					if (request.getParameter("tijiaoqixian1")==""  ||request.getParameter("tijiaoqixian1")==null ) {}
					else{sql=sql+" and tijiaoqixian >= '"+new String(request.getParameter("tijiaoqixian1").getBytes("8859_1"))+"'";}
					if (request.getParameter("tijiaoqixian2")==""  ||request.getParameter("tijiaoqixian2")==null ) {}
					else {sql=sql+" and tijiaoqixian <= '"+new String(request.getParameter("tijiaoqixian2").getBytes("8859_1"))+"'";}
	  			sql=sql+" order by id desc";
	  			RS_result=connDbBean.executeQuery(sql);
	 				String id="";
	 				String zuoyeID="";String mingcheng="";String neirong="";String fujian="";String tijiaoqixian="";String faburen="";
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
             <td width="130" align="center"><%=addtime.substring(0,19) %></td>
             <td width="70" align="center"><a href="fabuzuoyedetail.jsp?id=<%=id%>">��ϸ</a></td>
           </tr>
	         <%
	  					}
	         %>
	</table><br>
	<p align="center">�������ݹ� <%=i %> ��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a></p>
	<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="fabuzuoyelist.jsp?page=1">��ҳ</a>��<a href="fabuzuoyelist.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="fabuzuoyelist.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="fabuzuoyelist.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
	<p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p>
	<P align=center></td>
	                  </tr>
	                  <tr>
	                    <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
	                  </tr>
	                </table></td></tr>
	            </table></td>
	            <td valign="top"><%@ include file="qtleft.jsp"%></td>
	          </tr>
	        </table></td></tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>