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
    <title>��ѧӢ������ѧϰ��</title>
    <link href="css/style.css" type="text/css" rel="stylesheet">
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
				if(document.form1.yonghuming.value==""){alert("�������û���");document.form1.yonghuming.focus();return false;}if(document.form1.mima.value==""){alert("����������");document.form1.mima.focus();return false;}if(document.form1.xingming.value==""){alert("����������");document.form1.xingming.focus();return false;}
			}
			function gow(){
				document.location.href="yonghuzhuce_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
			}
		</script>
<body >
	<table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
		<tr>
			<td><%@ include file="qttop.jsp"%></td>
		</tr>
		<tr>
			<td><table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top"><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">������ϸ</span></td>
                        <td width="76%" class="STYLE4">&nbsp;</td>
                        <td width="7%" valign="bottom" class="STYLE4"><a href="news.asp?lb="></a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="100%" height="669" valign="top" background="qtimages/5.gif"><form name="form1" method="post" action="yonghuzhuce_add_post.jsp">
                      <table width="98%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#AAE4D5" style="border-collapse:collapse">
                        <tr>
                          <td>�û�����</td>
                          <td><input name='yonghuming' type='text' id='yonghuming' value='' />
                            &nbsp;*</td>
                        </tr>
                        <tr>
                          <td>���룺</td>
                          <td><input name='mima' type='text' id='mima' value='' />
                            &nbsp;*</td>
                        </tr>
                        <tr>
                          <td>������</td>
                          <td><input name='xingming' type='text' id='xingming' value='' />
                            &nbsp;*</td>
                        </tr>
                        <tr>
                          <td>�Ա�</td>
                          <td><select name='xingbie' id='xingbie' style=" height:19px; border:solid 1px #000000; color:#666666">
                              <option value="��">��</option>
                              <option value="Ů">Ů</option>
                          </select></td>
                        </tr>
                        <tr>
                          <td>�������£�</td>
                          <td><input name='chushengnianyue' type='text' id='chushengnianyue' value='' readonly='readonly' onClick="getDate(document.form1.chushengnianyue,'2')" need='1' /></td>
                        </tr><%--
                        <tr>
                          <td>QQ��</td>
                          <td><input name='QQ' type='text' id='QQ' value='' /></td>
                        </tr>
                        --%><tr>
                          <td>���䣺</td>
                          <td><input name='youxiang' type='text' id='youxiang' value='' /></td>
                        </tr>
                        <tr>
                          <td>�绰��</td>
                          <td><input name='dianhua' type='text' id='dianhua' value='' /></td>
                        </tr>
                        <tr>
                          <td>ͷ��</td>
                          <td><input name='touxiang' type='text' id='touxiang' size='50' value='' />
                            &nbsp;
                            <input name="button" type='button' onClick="up('touxiang')" value='�ϴ�' style=" height:19px; border:solid 1px #000000; color:#666666"/></td>
                        </tr>
                        <tr>
                          <td>��ַ��</td>
                          <td><input name='dizhi' type='text' id='dizhi' value='' size='50' /></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><input type="submit" name="Submit5" value="�ύ" onClick="return check();" style=" height:19px; border:solid 1px #000000; color:#666666"/>
                              <input type="reset" name="Submit22" value="����" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                        </tr>
                      </table></form>
                    	<p align="center">&nbsp;</p>
                      <p align="center">&nbsp;</p>
											<p align=center></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
          </tr>
        </table></td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>