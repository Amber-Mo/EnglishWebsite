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
    <title>ѧ����Ϣ</title>
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
			if(document.form1.xuehao.value==""){alert("������ѧ��");document.form1.xuehao.focus();return false;}if(document.form1.xingming.value==""){alert("����������");document.form1.xingming.focus();return false;}if(document.form1.dianhua.value==""){alert("������绰");document.form1.dianhua.focus();return false;}if(document.form1.shenfenzheng.value==""){alert("���������֤");document.form1.shenfenzheng.focus();return false;}if(document.form1.mima.value==""){alert("����������");document.form1.mima.focus();return false;}
		}
	</script>
<body >
  <form name="form1" id="form1" method="post" action="xueshengxinxi_updt_post2.jsp">
  �޸�ѧ����Ϣ
  <br><br>
  <%
	  String sql="select * from xueshengxinxi where xuehao='"+request.getSession().getAttribute("username")+"'";
	  String xuehao="";String xingming="";String banji="";String xingbie="";String dianhua="";String zhaopian="";String shenfenzheng="";String jiatingzhuzhi="";String beizhu="";String mima="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  xuehao=RS_result.getString("xuehao");xingming=RS_result.getString("xingming");banji=RS_result.getString("banji");xingbie=RS_result.getString("xingbie");dianhua=RS_result.getString("dianhua");zhaopian=RS_result.getString("zhaopian");shenfenzheng=RS_result.getString("shenfenzheng");jiatingzhuzhi=RS_result.getString("jiatingzhuzhi");beizhu=RS_result.getString("beizhu");mima=RS_result.getString("mima");
	  }
  %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
	   <tr><td align="center">ѧ��</td><td><input name='xuehao' type='text' id='xuehao' value='<%= xuehao%>' readonly="readonly" /></td></tr>
	   <tr><td align="center">����</td><td><input name='xingming' type='text' id='xingming' value='<%= xingming%>' /></td></tr>
	   <tr><td align="center">�༶</td><td><select name='banji' id='banji'><%sql="select banji from banjixinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("banji")%>" ><%=RS_result.getString("banji")%></option><%}%></select></td></tr>
	   <script language="javascript">document.form1.banji.value='<%=banji%>';</script>
	   <tr><td align="center">�Ա�</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select></td></tr>
	   <script language="javascript">document.form1.xingbie.value='<%=xingbie%>';</script>
	   <tr><td align="center">�绰</td><td><input name='dianhua' type='text' id='dianhua' value='<%= dianhua%>' /></td></tr>
	   <tr><td align="center">��Ƭ</td><td><input name='zhaopian' type='text' id='zhaopian' size='50' value='<%= zhaopian%>' />&nbsp;<input type='button' value='�ϴ�' onClick="up('zhaopian')"/></td></tr>
	   <tr><td align="center">���֤</td><td><input name='shenfenzheng' type='text' id='shenfenzheng' size='50' value='<%=shenfenzheng%>' /></td></tr>
	   <tr><td align="center">��ͥסַ</td><td><input name='jiatingzhuzhi' type='text' id='jiatingzhuzhi' size='50' value='<%=jiatingzhuzhi%>' /></td></tr>
	   <tr><td align="center">��ע</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu'><%=beizhu%></textarea></td></tr>
	   <tr><td align="center">����</td><td><input name='mima' type='text' id='mima' value='<%= mima%>' /></td></tr>
	   <tr align="center">
	    <td colspan="2">
			  <input type="submit" name="Submit" value="�ύ" onclick="return check();" />&nbsp;&nbsp;
			  <input type="reset" name="Submit2" value="����" />
	    </td>
    	</tr>
  	</table>
	</form>
</body>
</html>


