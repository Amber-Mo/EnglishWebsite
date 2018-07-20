<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>Insert title here</title>
	<meta content="MSHTML 6.00.2800.1106" name=GENERATOR>
</head>
<table id="__01" width="203" height="666" border="0" cellpadding="0" cellspacing="0">
	<tr>
	  <td><table id="__01" width="203" border="0" cellpadding="0" cellspacing="0">
	    <tr>
	      <td width="203" height="35" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	          <tr>
	            <td width="38%" height="20" align="center" valign="bottom"><span class="title">站内搜索</span></td>
	            <td width="47%" class="STYLE4">&nbsp;</td>
	            <td width="15%" valign="bottom" class="STYLE4">&nbsp;</td>
	          </tr>
	      </table></td>
	    </tr>
	    <tr>
	      <td><table id="__01" width="203" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td background="qtimages/1_02_02_02_02_01.jpg" width="5"></td>
	          <td width="195" height="122" background="qtimages/1_02_02_02_02_02.jpg"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	            <form action="news.jsp" method="post" name="formsearch" id="formsearch" >
	              <tr>
	                <td width="19%">标题</td>
	                <td width="81%"><input name="keyword" type="text" id="keyword" size="18" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
	              </tr>
	              <tr>
	                <td>类别</td>
	                <td><select name="lb" style=" height:19px; border:solid 1px #000000; color:#666666">
	                    <option value="新闻通知">新闻通知</option>
	                  </select>
	                </td>
	              </tr>
	              <tr>
	                <td>&nbsp;</td>
	                <td><input type="submit" name="Submit4" value="提交" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
	              </tr>
	            </form>
	          </table></td>
	          <td width="3" background="qtimages/1_02_02_02_02_03.jpg"></td>
	        </tr>
	      </table></td>
	    </tr>
	    <tr>
	      <td><img src="qtimages/1_02_02_02_03.jpg" width="203" height="9" alt=""></td>
	    </tr>
	  </table></td>
	</tr>
  <tr>
    <td><table id="__01" width="203" height="180" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="203" height="35" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="38%" height="20" align="center" valign="bottom"><span class="title">公告通知</span></td>
            <td width="47%" class="STYLE4">&nbsp;</td>
            <td width="15%" valign="bottom" class="STYLE4">&nbsp;</td>
          </tr></table></td>
      </tr>
      <tr>
        <td><table id="__01" width="203" height="136" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td background="qtimages/1_02_02_02_02_01.jpg" width="5"></td>
            <td width="195" height="148" background="qtimages/1_02_02_02_02_02.jpg">
            <marquee border="0" direction="up" height="148" onmouseout="start()" onmouseover="stop()"scrollamount="1" scrolldelay="50">
    <table width="92%" height="100%" border=0 align=center cellpadding=0 cellspacing=5>
    	<tbody><tr><td><p>
    	<%
				String sqlxtgg="select * from dx where leibie='系统公告'";
				ResultSet RS_resultxtgg=connDbBean.executeQuery(sqlxtgg);
				while(RS_resultxtgg.next()){
				    out.print(RS_resultxtgg.getString("content"));
				}
			%></p></td></tr></tbody></table></marquee></td>
         <td width="3" background="qtimages/1_02_02_02_02_03.jpg"></td>
         </tr></table></td></tr>
         <tr>
           <td><img src="qtimages/1_02_02_02_03.jpg" width="203" height="9" alt=""></td>
         </tr></table></td>
	     </tr>
	     <tr>
	       <td><table id="__01" width="203" height="180" border="0" cellpadding="0" cellspacing="0">
	         <tr>
	           <td width="203" height="35" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr>
                 <td width="38%" height="20" align="center" valign="bottom"><span class="title">用户登录</span></td>
                 <td width="47%" class="STYLE4">&nbsp;</td>
                 <td width="15%" valign="bottom" class="STYLE4">&nbsp;</td>
               </tr></table></td></tr>
         <tr>
           <td><table id="__01" width="203" height="136" border="0" cellpadding="0" cellspacing="0">
               <tr>
                 <td background="qtimages/1_02_02_02_02_01.jpg" width="5"></td>
                 <td width="195" height="148" background="qtimages/1_02_02_02_02_02.jpg"><%
					if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
	 			%></a>
        <table width="83%" height="91%" border="0" align="center" cellpadding="0" cellspacing="0">
          <form name="formlog" method="post" action="userlog_post.jsp">
            <tr>
              <td width="37%" height="30">用户名</td>
              <td width="63%" height="30">
              <input name="username" type="text" id="username" style="border-right: #cadcb2 1px solid;
					    border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
					    width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"></td>
            </tr>
            <tr>
              <td height="30">密&nbsp;&nbsp;&nbsp;码</td>
              <td height="30">
              <input name="pwd1" type="password" id="pwd1" Style="border-right: #cadcb2 1px solid;
					    border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
					    width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"></td>
            </tr>
            <tr>
              <td height="30">权&nbsp;&nbsp;&nbsp;限</td>
              <td height="30">
              <select name="cx" id="cx" Style="border-right: #cadcb2 1px solid;
					    border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
					    width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px">
                  <option value="教师">教师</option>
         					<option value="学生">学生</option>
              </select>
              </td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              <td height="30"><input type="submit" name="Submit" value="登录" style=" height:19px; border:solid 1px #000000; color:#666666">
              <input type="reset" name="Submit2" value="重置" style=" height:19px; border:solid 1px #000000; color:#666666"></td>
            </tr>
          </form>
        </table>
        <%
					}else{
				%>
        <table width="90%" height="82%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="31%" height="30">用户名</td>
            <td width="69%" height="30"><%=request.getSession().getAttribute("username")%></td>
          </tr>
          <tr>
            <td height="30">权&nbsp;&nbsp;&nbsp;限</td>
            <td height="30"><%=request.getSession().getAttribute("cx")%> </td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center">
            	<input type="button" name="Submit3" value="退出" onClick="javascript:location.href='logout.jsp';" style=" height:19px; border:solid 1px #000000; color:#666666">&nbsp;&nbsp;
              <input type="button" name="Submit32" value="个人后台" onClick="javascript:location.href='main.jsp';" style=" height:19px; border:solid 1px #000000; color:#666666">
            </td>
          </tr>
        </table>
      <%
				}
			%></td>
           <td width="3" background="qtimages/1_02_02_02_02_03.jpg"></td>
         </tr>
	     </table></td>
		   </tr>
		   <tr>
		     <td><img src="qtimages/1_02_02_02_03.jpg" width="203" height="9" alt=""></td>
		   </tr></table></td></tr>
       <tr>
         <td><table id="__01" width="203" height="180" border="0" cellpadding="0" cellspacing="0">
           <tr>
             <td width="203" height="35" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellpadding="0" cellspacing="0">
             	<tr>
	              <td width="38%" height="20" align="center" valign="bottom"><span class="title">友情链接</span></td>
	              <td width="47%" class="STYLE4">&nbsp;</td>
	              <td width="15%" valign="bottom" class="STYLE4">&nbsp;</td>
               </tr>
             </table></td></tr>
               <tr>
               	<td><table id="__01" width="203" height="136" border="0" cellpadding="0" cellspacing="0">
                	<tr>
	                  <td background="qtimages/1_02_02_02_02_01.jpg" width="5"></td>
	                  <td width="195" height="148" background="qtimages/1_02_02_02_02_02.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
							<%
								String sql2="";
                sql2="select top 5 * from youqinglianjie where 1=1";
								sql2=sql2+" order by id desc";
								ResultSet RS_result2=connDbBean.executeQuery(sql2);
								String wangzhanmingcheng="";String wangzhi="";
								while(RS_result2.next()){
								    wangzhanmingcheng=RS_result2.getString("wangzhanmingcheng");
								    wangzhi=RS_result2.getString("wangzhi");
							%>
                <tr valign="middle">
                  <td width="12%" height="25" align="center" class="STYLE2"><img height="7" 
                    src="qtimages/index_r9_c9.jpg" 
                    width="7" /> </td>
                  <td width="19%" height="25" align="left">
                  <a href="<%= wangzhi%>" class="b" target="_blank"><%= wangzhanmingcheng%></a></td>
                  <td width="69%" align="left"><a href="<%= wangzhi%>" class="b" target="_blank"><%= wangzhi%></a></td>
                </tr>
                <%} %>
              </table></td>
              <td width="3" background="qtimages/1_02_02_02_02_03.jpg"></td>
            </tr></table></td>
            </tr>
            <tr>
            	<td><img src="qtimages/1_02_02_02_03.jpg" width="203" height="9" alt=""></td>
            </tr>
            </table></td></tr> 
</table>