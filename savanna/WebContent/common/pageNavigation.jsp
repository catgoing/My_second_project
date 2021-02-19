<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<tr>
<td colspan="8">
	<ol class="paging">
<c:choose>
	<c:when test="${pvo.curBlockBeginIdx == 1 }">		
		<li class="disable"> < </li>
	</c:when>
	<c:otherwise>
		<li><a href="controller?type=${curList }&cPage=${pvo.curBlockBeginIdx - 1}"> < </a></li>
	</c:otherwise>	
</c:choose>		
<c:forEach var="pageNo" begin="${pvo.curBlockBeginIdx }" end="${pvo.curBlockEndIdx }">
	<c:if test="${pageNo == pvo.curPage }">
		<li class="now">${pageNo }</li>
	</c:if>
	<c:if test="${pageNo != pvo.curPage }">
		<li>
			<a href="controller?type=${curList }&cPage=${pageNo }">${pageNo }</a>
		</li>
	</c:if>		
</c:forEach>		
	<c:if test="${pvo.curBlockEndIdx < pvo.totalPage }">	
		<li>
			<a href="controller?type=${curList }&cPage=${pvo.curBlockEndIdx + 1}"> > </a>
		</li>
	</c:if>
	<c:if test="${pvo.curBlockEndIdx >= pvo.totalPage }">	
		<li class="disable"> > </li>
	</c:if>
	</ol>
</td>
</tr>