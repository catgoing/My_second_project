<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<tr>
<td colspan="8">
	<ol class="paging">
<c:choose>
	<c:when test="${pvo.beginPage == 1 }">		
		<li class="disable"> < </li>
	</c:when>
	<c:otherwise>
		<li><a href="controller?type=example&cPage=${pvo.beginPage - 1}&idx=${idx}&keyword=${keyword}"> < </a></li>
	</c:otherwise>	
</c:choose>		
<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
	<c:if test="${pageNo == pvo.nowPage }">
		<li class="now">${pageNo }</li>
	</c:if>
	<c:if test="${pageNo != pvo.nowPage }">
		<li>
			<a href="controller?type=example&cPage=${pageNo }&idx=${idx}&keyword=${keyword}">${pageNo }</a>
		</li>
	</c:if>		
</c:forEach>		
	<c:if test="${pvo.endPage < pvo.totalPage }">	
		<li>
			<a href="controller?type=example&cPage=${pvo.endPage + 1}&idx=${idx}&keyword=${keyword}"> > </a>
		</li>
	</c:if>
	<c:if test="${pvo.endPage >= pvo.totalPage }">	
		<li class="disable"> > </li>
	</c:if>
	</ol>
</td>
</tr>