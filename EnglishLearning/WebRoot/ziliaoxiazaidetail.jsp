<%
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){  //�ж��û��Ƿ��Ѿ���½�����û�У��������½�����������ʾ��ǰ�û���Ϣ
			out.print("<script>alert('�Բ���,�����ȵ�¼!');window.history.go(-1);</script>");
	}
%><%@ page language="java"  pageEncoding="gb2312"%>
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
	  String id=request.getParameter("id");
	  connDbBean.executeUpdate("update xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
  %>
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
                      <td width="17%" height="20" align="center" valign="bottom"><span class="title">������ϸ</span></td>
                      <td width="76%" class="STYLE4">&nbsp;</td>
                      <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="100%" height="669" valign="top" background="qtimages/5.gif"><p align="center">
		<%
		  String sql="select * from ziliaoxiazai where id="+id;
		  String bianhao="";String mingcheng="";String leibie="";String kecheng="";String jianjie="";String fujian="";
		  ResultSet RS_result=connDbBean.executeQuery(sql);
		  while(RS_result.next()){
		  bianhao=RS_result.getString("bianhao");mingcheng=RS_result.getString("mingcheng");leibie=RS_result.getString("leibie");kecheng=RS_result.getString("kecheng");jianjie=RS_result.getString("jianjie");fujian=RS_result.getString("fujian");
		  }
	   %></p>
	 <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
	  <tr align="center"><td width='11%'>���</td><td width='39%'><%=bianhao%></td></tr>
	  <tr align="center"><td width='11%'>����</td><td width='39%'><%=mingcheng%></td></tr>
	  <tr align="center"><td width='11%'>���</td><td width='39%'><%=leibie%></td></tr>
	  <tr align="center"><td width='11%'>�γ�</td><td width='39%'><%=kecheng%></td></tr>
	  <tr align="center"><td>����</td><td><a href="<%=fujian%>" target="_blank">�������</a></td>
	  <tr align="center"><td width='11%' height="95">���</td><td><%=jianjie%></td>
	  <tr>
	    <td colspan="2" align="center"><input type="button" name="Submit5" value="����" onClick="javascript:history.back()" /></td>
	  </tr>
          </table>
          <p align="center"></p>
          <P align=center></td>
      </tr>
      <tr>
        <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
      </tr>
    </table></td>
  	</tr>
         </table></td>
         <td valign="top"><%@ include file="qtleft.jsp"%></td>
       </tr>
     </table></td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>