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
<body >
  <table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td valign="top"><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">���԰�</span></td>
                        <td width="69%" class="STYLE4">&nbsp;</td>
                        <td width="14%" valign="bottom" class="STYLE4"><a href="lyb.jsp" class="title">��Ҫ����</a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="100%" height="669" valign="top" background="qtimages/5.gif">
			<%
    		int curpage=1;//��ǰҳ
				int page_record=3;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from liuyanban";
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
				//out.print(curpage);
				String sql;
				if (curpage==1){
						sql="select top "+page_record+" * from liuyanban";
				}
				else{
						sql="select top "+page_record+" * from liuyanban where id not in (select top "+((curpage-1)*page_record)+" id from liuyanban order by id desc) ";
				}
				sql=sql+" order by id desc";
			  ResultSet RS_result=connDbBean.executeQuery(sql);
			  String id="";
			  String nicheng="";String xingbie="";String QQ="";String youxiang="";String dianhua="";String neirong="";String huifuneirong="";
			  String addtime="";
			  int i=0;
			  while(RS_result.next()){
					  i=i+1;
					  id=RS_result.getString("id");
					  nicheng=RS_result.getString("cheng");
					  xingbie=RS_result.getString("xingbie");
					  QQ=RS_result.getString("QQ");
					  youxiang=RS_result.getString("youxiang");
					  dianhua=RS_result.getString("dianhua");
					  neirong=RS_result.getString("neirong");
					  huifuneirong=RS_result.getString("huifuneirong");
					  addtime=RS_result.getString("addtime");
			%>
			<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#AAE4D5" class="tb">
	      <tr>
	        <td width="85" rowspan="4" align="center" valign="middle" bgcolor="#FFFFFF"><img width='70'height='70' src=img/<%=xingbie %>.gif border=0> </td>
	        <td height="20" align="right" valign="middle" bgcolor="#FFFFFF">&nbsp; &nbsp; ������: <%=addtime.substring(0,19)%> &nbsp;</td>
	      </tr>
	      <tr>
	        <td height="78" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;<%=neirong%></td>
	      </tr>
	      <tr>
	        <td align="right" valign="middle" bgcolor="#FFFFFF" style="height: 25px">&nbsp;&nbsp; �ǳƣ�<%=nicheng%> &nbsp;&nbsp; �绰��<%=dianhua %>&nbsp;&nbsp;�� ��: <%=youxiang%> &nbsp;&nbsp; QQ: <%=QQ%></td>
	      </tr>
	      <tr>
	        <td align="left" valign="middle" bgcolor="#FFFFFF" style="height: 25px">&nbsp; &nbsp;����Ա�ظ���<%=huifuneirong%></td>
	      </tr>
	    </table>
	      <%}%>
	      <p align="center">&nbsp;&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="lyblist.jsp?page=1">��ҳ</a>��
	      <a href="lyblist.jsp?page=<%= curpage-1%>">��һҳ</a>��
	      <a href="lyblist.jsp?page=<%= curpage+1%>">��һҳ</a>��
	      <a href="lyblist.jsp?page=<%=zys %>">βҳ</A>����ǰ��
	      <font color=red><%=curpage %></font>ҳ/��
	      <font color=red><%=zys %></font>ҳ</p>
	         <p align="center">&nbsp;</p>
	         <p align="center">&nbsp;</p>
						<p align=center></td>
	       </tr>
	       <tr>
	         <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
	       </tr>
	     </table></td></tr></table></td>
        <td valign="top"><%@ include file="qtleft.jsp"%></td>
        </tr></table></td></tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>