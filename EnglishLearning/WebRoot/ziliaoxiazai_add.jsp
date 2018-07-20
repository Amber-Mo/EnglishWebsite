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
    <title>资料上传</title>
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
					document.form1.bianhao.focus();return false;
				}
				if(document.form1.mingcheng.value==""){
					alert("请输入名称");document.form1.mingcheng.focus();return false;
					}
			}
			function gow(){
				document.location.href="ziliaoxiazai_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
			}
		</script>
<body >
  <form name="form1" id="form1" method="post" action="ziliaoxiazai_add_post.jsp">
  资料上传<br><br>
  	<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
	   <tr><td align="center">编号</td><td><input name='bianhao' type='text' id='bianhao' value='' />&nbsp;*</td></tr>
	   <tr><td align="center">名称</td><td><input name='mingcheng' type='text' id='mingcheng' value='' size='50' />&nbsp;*</td></tr>
	   <tr><td align="center">类别</td><td><select name='leibie' id='leibie'>
	     <option value="教学课件">教学课件</option>
	     <option value="常用软件">常用软件</option>
	     <option value="通知公告">通知公告</option>
	     <option value="杂志文献">杂志文献</option>
	   </select></td></tr>
	   <tr><td align="center">课程</td><td><select name='kecheng' id='kecheng'><%String sql="select kechengmingcheng from kechengxinxi order by id desc";ResultSet RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("kechengmingcheng")%>" ><%=RS_result.getString("kechengmingcheng")%></option><%}%></select></td></tr>
	   <tr><td align="center">简介</td><td><textarea rows="1" cols="60" name="jianjie" onscroll="this.rows++;" id='jianjie'></textarea></td></tr>
	   <tr><td align="center">附件</td><td><input name='fujian' type='text' id='fujian' size='50' value='' />&nbsp;<input type='button' value='上传' onClick="up('fujian')"/></td></tr>
	    <tr align="center">
	      <td colspan="2"><input type="submit" name="Submit" value="提交" onClick="return check();" />&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="重置" /></td>
	    </tr>
	  </table>
	</form>
</body>
</html>

