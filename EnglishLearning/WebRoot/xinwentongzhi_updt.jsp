
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
    <title>����֪ͨ</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
	  <script type="text/javascript">
	    function up(tt)
	    {
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
				if(document.form1.biaoti.value==""){
					alert("���������");
					document.form1.biaoti.focus();
					return false;}if(document.form1.leibie.value==""){alert("���������");document.form1.leibie.focus();return false;}if(document.form1.tianjiaren.value==""){alert("�����������");document.form1.tianjiaren.focus();return false;}if(document.form1.dianjilv.value==""){alert("����������");document.form1.dianjilv.focus();return false;}
			}
		</script>
<body >
	<%
  	String id=request.getParameter("id");
  %>
  <form name="form1" id="form1" method="post" action="xinwentongzhi_updt_post.jsp?id=<%=id %>">
    �޸�����֪ͨ<br><br>
  <%
	  String sql="select * from xinwentongzhi where id="+id;
	  String biaoti="";String leibie="";String neirong="";String tianjiaren="";String shouyetupian="";String dianjilv="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  biaoti=RS_result.getString("biaoti");leibie=RS_result.getString("leibie");neirong=RS_result.getString("neirong");tianjiaren=RS_result.getString("tianjiaren");shouyetupian=RS_result.getString("shouyetupian");dianjilv=RS_result.getString("dianjilv");
	  }
   %>
   <table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   	<tr><td>����</td><td><input name='biaoti' type='text' id='biaoti' size='50' value='<%=biaoti%>' /></td></tr>
    <tr><td>���</td><td><input name='leibie' type='text' id='leibie' value='<%= leibie%>' /></td></tr>
    <tr><td>����</td><td><textarea rows="1" cols="60" name="neirong" onscroll="this.rows++;"><%=neirong%></textarea></td></tr>
    <tr><td>�����</td><td><input name='tianjiaren' type='text' id='tianjiaren' value='<%= tianjiaren%>' /></td></tr>
    <tr><td>��ҳͼƬ</td><td><input name='shouyetupian' type='text' id='shouyetupian' size='50' value='<%= shouyetupian%>' />&nbsp;<input type='button' value='�ϴ�' onclick="up('shouyetupian')"/></td></tr>
    <tr><td>�����</td><td><input name='dianjilv' type='text' id='dianjilv' value='<%= dianjilv%>' /></td></tr>
    <tr align="center">
    	<td colspan="2">
	      <input type="submit" name="Submit" value="�ύ" onClick="return check();" />&nbsp;&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="����" /></td>
     </tr>
  	</table>
	</form>
</body>
</html>


