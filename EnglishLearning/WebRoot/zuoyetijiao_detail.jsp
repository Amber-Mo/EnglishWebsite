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
    <title>作业提交详细</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">s
    <style type="text/css">
    	td {
    		text-align:center;
    	}
    </style>
    <script language="javascript" src="js/Calendar.js"></script>
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
  作业提交详细<br><br>
  <%
	  String sql="select * from zuoyetijiao where id="+id;
	  String jiaoshi="";String zuoyemingcheng="";String neirong="";String fujian="";String tijiaoren="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  jiaoshi=RS_result.getString("jiaoshi");zuoyemingcheng=RS_result.getString("zuoyemingcheng");neirong=RS_result.getString("neirong");fujian=RS_result.getString("fujian");tijiaoren=RS_result.getString("tijiaoren");
	  }
   %>
	<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
	  <tr><td width='11%'>教师</td><td width='39%'><%=jiaoshi%></td></tr>
	  <tr><td width='11%'>作业名称</td><td width='39%'><%=zuoyemingcheng%></td></tr>
	  <tr><td width='11%'>提交人</td><td width='39%'><%=tijiaoren%></td></tr>
	  <tr><td width='11%'>附件</td><td width='39%'><a href="<%=fujian%>">点此下载</a></td></tr>
	  <tr><td width='11%' height="163">内容</td><td colspan="3"><%=neirong%></td></tr>
	  <tr>
	   <td colspan="2" align="center"><input type="button" name="Submit" value="返回" onClick="javascript:history.back()" /></td>
	 </tr>
	</table>
</body>
</html>


