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
    <title>�Զ����</title>
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
				if(document.form1.bianhao.value==""){alert("��������");document.form1.bianhao.focus();return false;}if(document.form1.tishu.value==""){alert("����������");document.form1.tishu.focus();return false;}if(document.form1.fenzhi.value==""){alert("�������ֵ");document.form1.fenzhi.focus();return false;}
			}
			function gow(){
				document.location.href="zidongzujuan_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
			}
		</script>
<body >
  <form name="form1" id="form1" method="post" action="zidongzujuan_add_post.jsp">
  ����Զ����<br><br>
   <table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
	   <tr><td align="center">���</td><td><input name='bianhao' type='text' id='bianhao' value='' />&nbsp;*</td></tr>
	   <tr><td align="center">רҵ</td><td><select name='zhuanye' id='zhuanye'>
	   <%
	   	String sql="select zhuanye from zhuanyexinxi order by id desc";
	   	ResultSet RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){
	   %>
	   <option value="<%= RS_result.getString("zhuanye")%>" >
	   <%=RS_result.getString("zhuanye")%></option><%}%></select></td></tr>
	   <tr><td align="center">����</td><td><input name='tishu' type='text' id='tishu' value='' />&nbsp;*</td></tr>
	   <tr><td align="center">��ֵ</td><td><input name='fenzhi' type='text' id='fenzhi' value='' />&nbsp;*</td></tr>
	    <tr align="center">
	      <td colspan="2"><input type="submit" name="Submit" value="�ύ" onclick="return check();" />&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="����" /></td>
	    </tr>
  	</table>
	</form>
</body>
</html>

