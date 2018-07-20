
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
    <title>视频教学</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
	  <script type="text/javascript">
	    function up(tt){
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
				if(document.form1.bianhao.value==""){
					alert("请输入编号");
					document.form1.bianhao.focus();
					return false;
				}
				if(document.form1.jiaocaimingcheng.value==""){
					alert("请输入教材名称");
					document.form1.jiaocaimingcheng.focus();
					return false;
				}
				if(document.form1.kecheng.value==""){
					alert("请输入课程");
					document.form1.kecheng.focus();
					return false;
				}
			}
			function gow()
			{
				document.location.href="shipinjiaoxue_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
			}
		</script>
<body >
  <form name="form1" id="form1" method="post" action="shipinjiaoxue_add_post.jsp">
    添加视频教学<br><br>
		<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00ffff" style="border-collapse:collapse">    
    	<tr><td align="center">编号</td><td><input name='bianhao' type='text' id='bianhao' value='<%
   		java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyyMMddHHmmss", java.util.Locale.CHINA);
			String result = format.format(date);
			out.print(result);
   		out.print(Math.round(Math.random()*100000));
   		%>' />&nbsp;*</td></tr>
	   <tr><td align="center">教材名称</td><td><input name='jiaocaimingcheng' type='text' id='jiaocaimingcheng' value='' size='50' />&nbsp;*</td></tr>
	   <tr><td align="center">课程</td><td><select name='kecheng' id='kecheng'>
   	<%
   	String sql="select kechengmingcheng from kechengxinxi order by id desc";
	   	ResultSet RS_result=connDbBean.executeQuery(sql);
	   	while(RS_result.next()){
    %>
	   	<option value="<%= RS_result.getString("kechengmingcheng")%>" >
	   	<%=RS_result.getString("kechengmingcheng")%></option><%}%></select>&nbsp;*</td></tr>
	   	<tr><td align="center">主讲人</td><td><input name='zhujiangren' type='text' id='zhujiangren' value=''/></td></tr>
	   	<tr><td align="center">视频文件</td><td><input name='shipinwenjian' type='text' id='shipinwenjian' size='50' value='' />&nbsp;
	   	<input type='button' value='上传' onClick="up('shipinwenjian')"/></td></tr>
	   	<tr><td align="center">备注</td><td><textarea name="beizhu" ></textarea></td></tr>
	    <tr align="center">
	      <td colspan="2"><input type="submit" name="Submit" value="提交" onClick="return check();"/>&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="重置" /></td>
	    </tr>
  	</table>
	</form>
</body>
</html>

