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
    <title>教师信息详细</title>
    <script language="javascript" src="js/Calendar.js"></script>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
    	td {
    		text-align:center;
    	}
    </style>
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
 	教师信息详细<br><br>
  <%
	  String sql="select * from jiaoshixinxi where id="+id;
	  String gonghao="";String xingming="";String mima="";String chushengnianyue="";String shenfenzheng="";String xingbie="";String zhicheng="";String zhaopian="";String zhujiaokecheng="";String dianhua="";String beizhu="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
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
	  }
	%>
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
		<tr><td width='11%'>工号</td><td width='39%'><%=gonghao%></td><td width='11%'>姓名</td><td width='39%'><%=xingming%></td></tr>
		<tr><td width='11%'>密码</td><td width='39%'><%=mima%></td><td width='11%'>出生年月</td><td width='39%'><%=chushengnianyue%></td></tr>
		<tr><td width='11%'>身份证</td><td width='39%'><%=shenfenzheng%></td><td width='11%'>性别</td><td width='39%'><%=xingbie%></td></tr>
		<tr><td width='11%'>职称</td><td width='39%'><%=zhicheng%></td><td width='11%'>照片</td><td width='39%'><%=zhaopian%></td></tr>
		<tr><td width='11%'>主教课程</td><td width='39%'><%=zhujiaokecheng%></td><td width='11%'>电话</td><td width='39%'><%=dianhua%></td></tr>
		<tr><td width='11%'>备注</td><td width='39%'><%=beizhu%></td><td>&nbsp;</td><td>&nbsp;</td>
		<tr>
			<td colspan="4" align="center"><input type="button" name="Submit" value="返回" onclick="javascript:history.back()" /></td>
		</tr>
	</table>
</body>
</html>


