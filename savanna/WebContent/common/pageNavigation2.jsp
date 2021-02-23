<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="center">
<div class="pagination">
	<ol>
<c:choose>
	<c:when test="${pvo.beginPage == 1 }">		
		<a class="disable"> < </a>
	</c:when>
	<c:otherwise>
		<a href="controller?type=${command }&cPage=${pvo.beginPage - 1}&idx=${idx}&keyword=${keyword}"> < </a>
	</c:otherwise>	
</c:choose>		
<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
	<c:if test="${pageNo == pvo.nowPage }">
		<a class="now">${pageNo }</a>
	</c:if>
	<c:if test="${pageNo != pvo.nowPage }">
		
			<a href="controller?type=${command }&cPage=${pageNo }&idx=${idx}&keyword=${keyword}">${pageNo }</a>
	
	</c:if>		
</c:forEach>		
	<c:if test="${pvo.endPage < pvo.totalPage }">	
	
			<a href="controller?type=${command }&cPage=${pvo.endPage + 1}&idx=${idx}&keyword=${keyword}"> > </a>
	
	</c:if>
	<c:if test="${pvo.endPage >= pvo.totalPage }">	
		<a class="disable"> > </a>
	</c:if>
	
	</ol>
		</div>
 </div>
