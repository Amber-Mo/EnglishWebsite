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
    <title>��ʦ��Ϣ</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
		String sql;
		ResultSet RS_result;
	%>
<body >
	<p>��ʦ��Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
     ����&nbsp;&nbsp;���ţ�<input name="gonghao" type="text" id="gonghao" /> 
     ������<input name="xingming" type="text" id="xingming" /> ���֤��<input name="shenfenzheng" type="text" id="shenfenzheng" />
    �Ա�<select name="xingbie" id="xingbie"><option value="">����</option><option value="��">��</option><option value="Ů">Ů</option></select> 
    ְ�ƣ�<input name="zhicheng" type="text" id="zhicheng" /> �绰��<input name="dianhua" type="text" id="dianhua" />
   <input type="submit" name="Submit" value="����" />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
	  <tr align="center">
		  <td width="30" bgcolor="CCFFFF">���</td>
		  <td bgcolor='#CCFFFF'>����</td>
		  <td bgcolor='#CCFFFF'>����</td>
		  <td bgcolor='#CCFFFF'>����</td>
		  <td bgcolor='#CCFFFF'>��������</td>
		  <td bgcolor='#CCFFFF'>���֤</td>
		  <td bgcolor='#CCFFFF'>�Ա�</td>
		  <td bgcolor='#CCFFFF'>ְ��</td>
		  <td bgcolor='#CCFFFF'>��Ƭ</td>
		  <td bgcolor='#CCFFFF'>���̿γ�</td>
		  <td bgcolor='#CCFFFF'>�绰</td>
		  <td bgcolor='#CCFFFF'>��ע</td>
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
			String fysql="select count(id) as ss from jiaoshixinxi";
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
  		sql="select top "+page_record+" * from jiaoshixinxi where id not in (select top "+((curpage-1)*page_record)+" id from jiaoshixinxi order by id desc) ";
			if(request.getParameter("gonghao")=="" ||request.getParameter("gonghao")==null ){}else{sql=sql+" and gonghao like '%"+new String(request.getParameter("gonghao").getBytes("8859_1"))+"%'";}
			if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+new String(request.getParameter("xingming").getBytes("8859_1"))+"%'";}
			if(request.getParameter("shenfenzheng")=="" ||request.getParameter("shenfenzheng")==null ){}else{sql=sql+" and shenfenzheng like '%"+new String(request.getParameter("shenfenzheng").getBytes("8859_1"))+"%'";}
			if(request.getParameter("xingbie")=="����" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+new String(request.getParameter("xingbie").getBytes("8859_1"))+"%'";}
			if(request.getParameter("zhicheng")=="" ||request.getParameter("zhicheng")==null ){}else{sql=sql+" and zhicheng like '%"+new String(request.getParameter("zhicheng").getBytes("8859_1"))+"%'";}
			if(request.getParameter("dianhua")=="" ||request.getParameter("dianhua")==null ){}else{sql=sql+" and dianhua like '%"+new String(request.getParameter("dianhua").getBytes("8859_1"))+"%'";}
		  sql=sql+" order by id desc";
		  RS_result=connDbBean.executeQuery(sql);
		  String id="";
		  String gonghao="";String xingming="";String mima="";String chushengnianyue="";String shenfenzheng="";String xingbie="";String zhicheng="";String zhaopian="";String zhujiaokecheng="";String dianhua="";String beizhu="";
		  String addtime="";
		  int i=0;
		  while(RS_result.next()){
		      i=i+1;
				  id=RS_result.getString("id");
				  gonghao=RS_result.getString("gonghao");
				  xingming=RS_result.getString("xingming");
				  mima=RS_result.getString("mima");
				  chushengnianyue=RS_result.getString("chushengnianyue");
				  shenfenzheng=RS_result.getString("shenfenzheng");
				  xingbie=RS_result.getString("xingbie");
				  zhicheng=RS_result.getString("zhicheng");
				  zhaopian=RS_result.getString("zhaopian");
				  zhujiaokecheng=RS_result.getString("zhujiaokecheng");
				  dianhua=RS_result.getString("dianhua");
				  beizhu=RS_result.getString("beizhu");
				  addtime=RS_result.getString("addtime");
		%>
		<tr align="center">
	    <td width="30" align="center"><%=i %></td>
	    <td><%=gonghao %></td>
	    <td><%=xingming %></td>
	    <td><%=mima %></td>
	    <td><%=chushengnianyue %></td>
	    <td><%=shenfenzheng %></td>
	    <td><%=xingbie %></td>
	    <td><%=zhicheng %></td>
	    <td><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td>
	    <td><%=zhujiaokecheng %></td>
	    <td><%=dianhua %></td>
	    <td><%=beizhu %></td>
	    <td><%=addtime.substring(0,19) %></td>
	    <td><a href="jiaoshixinxi_updt.jsp?id=<%=id%>">�޸�</a>  
	    <a href="del.jsp?id=<%=id %>&tablename=jiaoshixinxi" onclick="return confirm('���Ҫɾ����')">ɾ��</a> 
	    <a href="jiaoshixinxidetail.jsp?id=<%=id%>" target="_blank">��ϸ</a></td>
  	</tr>
  	<%
  		}
    %>
	</table><br>
	<p align="center">�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a></p>
	<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="jiaoshixinxi_list.jsp?page=1">��ҳ</a>��<a href="jiaoshixinxi_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="jiaoshixinxi_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="jiaoshixinxi_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
</body>
</html>
