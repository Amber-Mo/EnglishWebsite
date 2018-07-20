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
    <title>作业提交</title>
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
				if(document.form1.jiaoshi.value==""){alert("请输入教师");document.form1.jiaoshi.focus();return false;}if(document.form1.zuoyemingcheng.value==""){alert("请输入作业名称");document.form1.zuoyemingcheng.focus();return false;}if(document.form1.tijiaoren.value==""){alert("请输入提交人");document.form1.tijiaoren.focus();return false;}
			}
		</script>
<body >
  <%
  	String id=request.getParameter("id");
  %>
  <form name="form1" id="form1" method="post" action="zuoyetijiao_updt_post.jsp?id=<%=id %>">
  修改作业提交<br><br>
  <%
	  String sql="select * from zuoyetijiao where id="+id;
	  String jiaoshi="";String zuoyemingcheng="";String neirong="";
	  String fujian="";String tijiaoren="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  jiaoshi=RS_result.getString("jiaoshi");
	  zuoyemingcheng=RS_result.getString("zuoyemingcheng");
	  neirong=RS_result.getString("neirong");
	  fujian=RS_result.getString("fujian");
	  tijiaoren=RS_result.getString("tijiaoren");
	  }
   %>
		<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
			<tr><td align="center">教师</td><td><select name='jiaoshi' id='jiaoshi'>
			<%sql="select gonghao from jiaoshixinxi order by id desc";
			RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){
			%><option value="<%= RS_result.getString("gonghao")%>" >
			<%=RS_result.getString("gonghao")%></option><%}%></select></td></tr>
			<script language="javascript">document.form1.jiaoshi.value='<%=jiaoshi%>';</script>
			<tr><td align="center">作业名称</td><td><input name='zuoyemingcheng' type='text' id='zuoyemingcheng' size='50' value='<%=zuoyemingcheng%>' /></td></tr>
			<tr><td align="center">内容</td><td><textarea name="neirong"><%=neirong%></textarea></td></tr>
			<tr><td align="center">附件</td><td><input name='fujian' type='text' id='fujian' size='50' value='<%= fujian%>' />&nbsp;<input type='button' value='上传' onClick="up('fujian')"/></td></tr>
			<tr><td align="center">提交人</td><td><input name='tijiaoren' type='text' id='tijiaoren' value='<%= tijiaoren%>' /></td></tr>
			<tr align="center">
			  <td colspan="2"><input type="submit" name="Submit" value="提交" onclick="return check();" />&nbsp;&nbsp;
			  <input type="reset" name="Submit2" value="重置" /></td>
			</tr>
  	</table>
	</form>
</body>
</html>


