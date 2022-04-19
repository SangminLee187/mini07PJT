<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<@ page import="java.util.List"  
<%@ page import="com.model2.mvc.service.domain.Purchase" %>
<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.service.domain.User" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

List<Purchase> list= (List<Purchase>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");

Search search = (Search)request.getAttribute("search");
//==> null 을 ""(nullString)으로 변경
String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
--%>

<html>
<head>
<title>판매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();	
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listSale.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"   cellspacing="0">
   <tr>
      <td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
      <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="93%" class="ct_ttl01">판매 목록조회</td>
            </tr>
         </table>
      </td>
      <td width="12" height="37"><img src="/images/ct_ttl_img03.gif"   width="12" height="37"></td>
   </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"   style="margin-top: 10px;">
   <tr>
		<td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
   </tr>
   <tr>
      <td class="ct_list_b" width="100">배송번호</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">회원ID</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">상품번호</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b">전화번호</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b">배송현황</td>
      <td class="ct_line02"></td>
   </tr>
   <tr>
      <td colspan="11" bgcolor="808285" height="1"></td>
   </tr>
	<%--
	<%
		for(int i=0; i<list.size(); i++) {
			Purchase purc = (Purchase)list.get(i);
	%>		
	<tr class="ct_list_pop">
		<td align="center">
			 <%=i+1 %></a>
		</td>
		<td></td>
		<td align="center">
			<a href="/getUser.do?userId=<%=purc.getBuyer().getUserId()%>"><%=purc.getBuyer().getUserId() %></a>
		</td>
		<td></td>
		<td align="center"><a href="/getPurchase.do?tranNo=<%=purc.getTranNo() %>"><%=purc.getPurchaseProd().getProdNo()%></a>
		</td>
		<td></td>
		<td align="left"><%=purc.getReceiverPhone() %></td>
		<td></td>
		<td align="center"><%=purc.getTranCode() %>	</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	

	<%
		}
	%>	
   	 --%>
       <c:set var="i" value="0"/>
    <c:forEach var="purc" items="${list}">
    <c:set var="i" value="${i+1}"/>
   	<tr classs="ct_list_pop">
    	<td align="center">
			<a href="/getPurchase.do?tranNo=${purc.tranNo}">${purc.tranNo}</a>
    	</td>
		<td></td>
		<td align="center">
			<a href="/getUser.do?userId=${purc.buyer.userId}">${purc.buyer.userId}</a>
		</td>
		<td></td>
		<td align="center">
			<a href="/getProduct.do?prodNo=${purc.purchaseProd.prodNo}"> ${purc.purchaseProd.prodNo}</a>
		</td>
		<td></td>
		<td align="center">${purc.receiverPhone}</td>
		<td></td>
		<td align="center">
			<c:if test= "${empty purc.tranCode }"> 판매중		
			</c:if>
			<c:if test= "${purc.tranCode == '111'}"> 구매완료
			</c:if>	
			<c:if test= "${purc.tranCode == '222'}"> 배송중
			</c:if>
			<c:if test= "${purc.tranCode == '333'}"> 배송완료 
			</c:if>		
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
    </c:forEach>
    
   

   
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
   <tr>
      <td align="center">
       
 <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<%--
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetSaleList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetSaleList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetSaleList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>      
			--%>
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
      </td>
   </tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>