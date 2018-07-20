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
    <title>发布作业</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
	  <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
	    }
		</script>
  </head>
		<script language="javascript">
			function check(){
				if(document.form1.zuoyeID.value==""){
					alert("请输入作业ID");document.form1.zuoyeID.focus();
					return false;
				}
				if(document.form1.mingcheng.value==""){
					alert("请输入名称");document.form1.mingcheng.focus();
					return false;
				}
				if(document.form1.tijiaoqixian.value==""){
					alert("请输入提交期限");document.form1.tijiaoqixian.focus();
					return false;
				}
				if(document.form1.faburen.value==""){
					alert("请输入发布人");document.form1.faburen.focus();
					return false;
				}
			}
		</script>
<body>
	<%
		String id=request.getParameter("id");
	%>
  <form name="form1" id="form1" method="post" action="fabuzuoye_updt_post.jsp?id=<%=id %>">
  	修改发布作业<br><br>
  <%
	  String sql="select * from fabuzuoye where id="+id;
	  String zuoyeID="";String mingcheng="";String neirong="";String fujian="";String tijiaoqixian="";String faburen="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	      zuoyeID=RS_result.getString("zuoyeID");
	      mingcheng=RS_result.getString("mingcheng");
	      neirong=RS_result.getString("neirong");
	      fujian=RS_result.getString("fujian");
	      tijiaoqixian=RS_result.getString("tijiaoqixian");
	      faburen=RS_result.getString("faburen");
	  }
	%>
		<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
	    <tr><td align="center">作业编号</td><td><input name='zuoyeID' type='text' id='zuoyeID' value='<%= zuoyeID%>' readonly='readonly'/></td></tr>
	    <tr><td align="center">名称</td><td><input name='mingcheng' type='text' id='mingcheng' size='50' value='<%=mingcheng%>' /></td></tr>
	    <tr><td align="center">内容</td><td><textarea name="neirong"><%=neirong%></textarea></td></tr>
	    <tr><td align="center">附件</td><td><input name='fujian' type='text' id='fujian' size='50' value='<%= fujian%>' />&nbsp;<input type='button' value='上传' onclick="up('fujian')"/></td></tr>
	    <tr><td align="center">提交期限</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='<%= tijiaoqixian%>' onclick="getDate(form1.tijiaoqixian,'2')" need="1"/></td></tr>
	    <tr><td align="center">发布人</td><td><input name='faburen' type='text' id='faburen' value='<%= faburen%>' /></td></tr>
	    <tr align="center">
	      <td colspan="2"><input type="submit" name="Submit" value="提交" onclick="return check();" />&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="重置" /></td>
	  	</tr>
		</table>
	</form>
</body>
</html>


