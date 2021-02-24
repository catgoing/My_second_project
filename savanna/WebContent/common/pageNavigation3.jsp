<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="center">
<div class="pagination">
	<ol>
<c:choose>
	<c:when test="${pvo.curBlockBeginIdx == 1 }">		
		<a class="disable"> < </a>
	</c:when>
	<c:otherwise>
		<a href="controller?type=${curList }&cPage=${pvo.curBlockBeginIdx - 1}"> < </a>
	</c:otherwise>	
</c:choose>		
<c:forEach var="pageNo" begin="${pvo.curBlockBeginIdx }" end="${pvo.curBlockEndIdx}">
	<c:if test="${pageNo == pvo.curPage }">
		<a class="now">${pageNo }</a>
	</c:if>
	<c:if test="${pageNo != pvo.curPage }">
		
			<a href="controller?type=${curList }&cPage=${pageNo }">${pageNo }</a>
	
	</c:if>		
</c:forEach>		
	<c:if test="${pvo.curBlockEndIdx < pvo.totalPage }">	
	
			<a href="controller?type=${curList }&cPage=${pvo.curBlockEndIdx + 1}"> > </a>
	
	</c:if>
	<c:if test="${pvo.curBlockEndIdx >= pvo.totalPage }">	
		<a class="disable"> > </a>
	</c:if>
	
	</ol>
</div>
</div>