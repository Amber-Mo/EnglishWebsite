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
    <title>��Ƶ��ѧ��ϸ</title>
    <script language="javascript" src="js/Calendar.js"></script>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
  </head>
		<script language="javascript">
			function check(){
				fewgidsoidfjdkgds
			}
		</script>
<body >
  <%
  	String id=request.getParameter("id");
  %>
	��Ƶ��ѧ��ϸ<br><br>
  <%
	  String sql="select * from shipinjiaoxue where id="+id;
	  String bianhao="";String jiaocaimingcheng="";String kecheng="";String zhujiangren="";String shipinwenjian="";String beizhu="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  		bianhao=RS_result.getString("bianhao");
	  		jiaocaimingcheng=RS_result.getString("jiaocaimingcheng");
	  		kecheng=RS_result.getString("kecheng");
	  		zhujiangren=RS_result.getString("zhujiangren");
	  		shipinwenjian=RS_result.getString("shipinwenjian");
	  		beizhu=RS_result.getString("beizhu");
	  }
	%>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  	<tr><td width='11%'>���</td><td width='39%'><%=bianhao%></td></tr>
    <tr><td width='11%'>�̲�����</td><td width='39%'><%=jiaocaimingcheng%></td></tr>
		<tr><td width='11%'>�γ�</td><td width='39%'><%=kecheng%></td></tr>
    <tr><td width='11%'>������</td><td width='39%'><%=zhujiangren%></td></tr>
    <tr><td width='11%'>��Ƶ�ļ�</td><td width='39%'><a href='<%=shipinwenjian %>' target='_blank'>����</a></td></tr>
    <tr><td width='11%'>��ע</td><td width='39%'><%=beizhu%></td></tr>
    <tr>
    	<td colspan="2" align="center">
    	<input type="button" name="Submit" value="����" onclick="javascript:history.back()" /></td>
    </tr>
  </table>
</body>
</html>


