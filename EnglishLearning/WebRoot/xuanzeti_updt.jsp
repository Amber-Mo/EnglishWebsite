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
    <title>ѡ����</title>
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
				if(document.form1.zhuanye.value==""){
					alert("������רҵ");document.form1.zhuanye.focus();
					return false;
				}
				if(document.form1.xueke.value==""){
					alert("������ѧ��");document.form1.xueke.focus();
					return false;
				}
			}
		</script>
<body>
	<%
  	String id=request.getParameter("id");
  %>
<form name="form1" id="form1" method="post" action="xuanzeti_updt_post.jsp?id=<%=id %>">
    �޸�ѡ����<br><br>
  <%
	  String sql="select * from xuanzeti where id="+id;
	  String zhuanye="";String xueke="";String timu="";String xuanxiangA="";String xuanxiangB="";String xuanxiangC="";String xuanxiangD="";String daan="";String nanduxishu="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  zhuanye=RS_result.getString("zhuanye");xueke=RS_result.getString("xueke");timu=RS_result.getString("timu");xuanxiangA=RS_result.getString("xuanxiangA");xuanxiangB=RS_result.getString("xuanxiangB");xuanxiangC=RS_result.getString("xuanxiangC");xuanxiangD=RS_result.getString("xuanxiangD");daan=RS_result.getString("daan");nanduxishu=RS_result.getString("nanduxishu");
	  }
   %>
   <table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td align="center">רҵ</td><td><select name='zhuanye' id='zhuanye'>
     <%
     	sql="select zhuanye from zhuanyexinxi order by id desc";
     	RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){
     %><option value="<%= RS_result.getString("zhuanye")%>" >
     <%=RS_result.getString("zhuanye")%></option><%}%></select></td></tr>
     <script language="javascript">document.form1.zhuanye.value='<%=zhuanye%>';</script>
     <tr><td align="center">ѧ��</td><td><select name='xueke' id='xueke'>
       <%sql="select kechengmingcheng from kechengxinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%>
       <option value="<%= RS_result.getString("kechengmingcheng")%>" ><%=RS_result.getString("kechengmingcheng")%></option>
       <%}%>
     </select>
     </td></tr><script language="javascript">document.form1.xueke.value='<%=xueke%>';</script>
     <tr><td align="center">��Ŀ</td><td><textarea name='timu' cols='50' rows='5' id='timu'><%=timu%></textarea></td></tr>
     <tr><td align="center">ѡ��A</td><td><input name='xuanxiangA' type='text' id='xuanxiangA' size='50' value='<%=xuanxiangA%>' /></td></tr>
     <tr><td align="center">ѡ��B</td><td><input name='xuanxiangB' type='text' id='xuanxiangB' size='50' value='<%=xuanxiangB%>' /></td></tr>
     <tr><td align="center">ѡ��C</td><td><input name='xuanxiangC' type='text' id='xuanxiangC' size='50' value='<%=xuanxiangC%>' /></td></tr>
     <tr><td align="center">ѡ��D</td><td><input name='xuanxiangD' type='text' id='xuanxiangD' size='50' value='<%=xuanxiangD%>' /></td></tr>
     <tr><td align="center">��</td><td><select name='daan' id='daan'>
       <option value="A">A</option>
       <option value="B">B</option>
       <option value="C">C</option>
       <option value="D">D</option>
     </select></td></tr>
     <script language="javascript">document.form1.daan.value='<%=daan%>';</script>
     <tr><td align="center">�Ѷ�ϵ��</td><td><select name='nanduxishu' id='nanduxishu'>
       <option value="��">��</option>
       <option value="��">��</option>
       <option value="��">��</option>
     </select></td></tr><script language="javascript">document.form1.nanduxishu.value='<%=nanduxishu%>';</script>
    <tr align="center">
      <td colspan="2"><input type="submit" name="Submit" value="�ύ" onClick="return check();" />&nbsp;&nbsp;
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>
</body>
</html>


