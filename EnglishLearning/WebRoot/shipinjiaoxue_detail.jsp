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
    <title>视频教学详细</title>
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
	视频教学详细<br><br>
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
  	<tr><td width='11%'>编号</td><td width='39%'><%=bianhao%></td></tr>
    <tr><td width='11%'>教材名称</td><td width='39%'><%=jiaocaimingcheng%></td></tr>
		<tr><td width='11%'>课程</td><td width='39%'><%=kecheng%></td></tr>
    <tr><td width='11%'>主讲人</td><td width='39%'><%=zhujiangren%></td></tr>
    <tr><td width='11%'>视频文件</td><td width='39%'><a href='<%=shipinwenjian %>' target='_blank'>下载</a></td></tr>
    <tr><td width='11%'>备注</td><td width='39%'><%=beizhu%></td></tr>
    <tr>
    	<td colspan="2" align="center">
    	<input type="button" name="Submit" value="返回" onclick="javascript:history.back()" /></td>
    </tr>
  </table>
</body>
</html>


