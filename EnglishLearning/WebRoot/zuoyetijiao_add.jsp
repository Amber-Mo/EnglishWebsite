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
    <title>��ҵ�ύ</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
	  <script type="text/javascript">
	    function up(tt){
	    	var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
        pop.setContent("contentUrl","upload.jsp?Result="+tt);
        pop.setContent("title","�ļ��ϴ�");
        pop.build();
        pop.show();
	    }
		</script>
  </head>
		<script language="javascript">
		function check(){
			if(document.form1.jiaoshi.value==""){alert("�������ʦ");document.form1.jiaoshi.focus();return false;}if(document.form1.zuoyemingcheng.value==""){alert("��������ҵ����");document.form1.zuoyemingcheng.focus();return false;}if(document.form1.tijiaoren.value==""){alert("�������ύ��");document.form1.tijiaoren.focus();return false;}
		}
		function gow(){
			document.location.href="zuoyetijiao_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
		}
		</script>
<body >
	<form name="form1" id="form1" method="post" action="zuoyetijiao_add_post.jsp">
	  �����ҵ�ύ<br><br>
		<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
			<tr><td align="center">��ʦ����</td><td><select name='jiaoshi' id='jiaoshi'>
			<%
				String sql="select gonghao from jiaoshixinxi order by id desc";
				ResultSet RS_result=connDbBean.executeQuery(sql);
				while(RS_result.next()){
			%>
					<option value="<%= RS_result.getString("gonghao")%>" >
					<%=RS_result.getString("gonghao")%></option><%}%></select>&nbsp;*</td></tr>
					<tr><td align="center">��ҵ����</td><td><input name='zuoyemingcheng' type='text' id='zuoyemingcheng' value='' size='50' />&nbsp;*</td></tr>
					<tr><td align="center">����</td><td><textarea name="neirong"></textarea></td></tr>
					<tr><td align="center">����</td><td><input name='fujian' type='text' id='fujian' size='50' value='' />&nbsp;
					<input type='button' value='�ϴ�' onClick="up('fujian')"/></td></tr>
					<tr><td align="center">�ύ��</td><td><input name='tijiaoren' type='text' id='tijiaoren' value='<%=request.getSession().getAttribute("username")%>' />&nbsp;*</td></tr>
			<tr align="center">
				<td colspan="2"><input type="submit" name="Submit" value="�ύ" onclick="return check();"/>&nbsp;&nbsp;
				<input type="reset" name="Submit2" value="����" /></td>
			</tr>
		</table>
	</form>
</body>
</html>

