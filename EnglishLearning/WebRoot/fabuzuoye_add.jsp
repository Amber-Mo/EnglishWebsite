
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
    <title>������ҵ</title>
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
			if(document.form1.zuoyeID.value==""){
				alert("��������ҵID");document.form1.zuoyeID.focus();
				return false;
			}
			if(document.form1.mingcheng.value==""){
				alert("����������");document.form1.mingcheng.focus();
				return false;
			}
			if(document.form1.tijiaoqixian.value==""){
				alert("�������ύ����");document.form1.tijiaoqixian.focus();
				return false;
			}
			if(document.form1.faburen.value==""){
				alert("�����뷢����");document.form1.faburen.focus();
				return false;
			}
		}
		function gow(){
			document.location.href="fabuzuoye_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
		}
		</script>
<body>
	<form name="form1" id="form1" method="post" action="fabuzuoye_add_post.jsp">
 	 ��ӷ�����ҵ<br><br>
		<table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00ffff" style="border-collapse:collapse">    
	    <tr><td align="center">��ҵ���</td>
		    <td><input name='zuoyeID' type='text' id='zuoyeID' value='<%
		    java.util.Date date = new java.util.Date();
			  java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyyMMddHHmmss", java.util.Locale.CHINA);
			  String result = format.format(date);
			  out.print(result);
		    out.print(Math.round(Math.random()*100000));
		    %>' />&nbsp;*
		    </td>
	    </tr>
	    <tr><td align="center">����</td><td><input name='mingcheng' type='text' id='mingcheng' value='' size='50' />&nbsp;*</td></tr>
	    <tr><td align="center">����</td><td><textarea name="neirong" cols='50' rows='5'></textarea></td></tr>
	    <tr><td align="center">����</td><td><input name='fujian' type='text' id='fujian' size='50' value='' />&nbsp;<input type='button' value='�ϴ�' onclick="up('fujian')"/></td></tr>
	    <tr><td align="center">�ύ����</td><td><input name='tijiaoqixian' type='text' id='tijiaoqixian' value='' onclick="getDate(document.form1.tijiaoqixian,'2')" need='1' />&nbsp;*</td></tr>
	    <tr><td align="center">������</td><td><input name='faburen' type='text' id='faburen' value='<%=request.getSession().getAttribute("username")%>' />&nbsp;*</td></tr>
			<tr align="center">
			  <td colspan="2"><input type="submit" name="Submit" value="�ύ" onclick="return check();" />&nbsp;&nbsp;
			  <input type="reset" name="Submit2" value="����" /></td>
			</tr>
		</table>
	</form>
</body>
</html>

