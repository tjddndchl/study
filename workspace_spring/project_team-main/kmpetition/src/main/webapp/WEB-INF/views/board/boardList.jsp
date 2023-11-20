<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set  var="articleList"  value="${articleMap.articleList}" />
<c:set  var="totBoard"  value="${articleMap.totBoard}" />
<c:set  var="section"  value="${articleMap.section}" />
<c:set  var="pageNum"  value="${articleMap.pageNum}" />
<c:set  var="startNum"  value="${articleMap.startNum}" />
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
 
<!-- alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
 
 
<c:if test="${message=='notVisible' }">

	<script>
	window.onload=function(){
		alert("비공개 게시글입니다.");
		
	}
	
	</script>

</c:if>
<body>
<table border="2px">
<tr>
	<td>No</td>
	<td>제목</td>
	<td>작성일</td>
</tr>		

<c:choose>
  <c:when test="${articleList ==null }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${articleList !=null }" >
    <c:forEach  var="article" items="${articleList }" varStatus="articleNum" >
     <tr align="center">
	<td width="5%">${article.articleNO}</td>
	<td width="40%"><a href="${contextPath }/board/boardDetail.do?articleNO=${article.articleNO}" >${article.title }</a></td>
	<td width="10%">${article.createdate }</td>
	  
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
	
	</table>
	
	
<div class="cls2">
 <c:if test="${totBoard != null }" >
      <c:choose>
        <c:when test="${totBoard >100 }">  <!-- 글 개수가 100 초과인경우 -->
	      <c:forEach var="page" begin="1" end="${totBoard/(section*100) >= 1 ? 10 : totBoard%((section-1)*100)/10+1 }" step="1">
	         <c:if test="${section >1 && page==1 }">
	          <a class="no-uline" href="${contextPath }/board/boardList.do?section=${section-1}&pageNum=1">&nbsp; pre </a>
	         </c:if>
	          <a class="no-uline" href="${contextPath }/board/boardList.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
	         <c:if test="${page ==10 && totBoard > section*100 }">
	          <a class="no-uline" href="${contextPath }/board/boardList.do?section=${section+1}&pageNum=1">&nbsp; next</a>
	         </c:if>
	      </c:forEach>
        </c:when>
        <c:when test="${totBoard ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	        <a class="no-uline"  href="#">${page } </a>
	      </c:forEach>
        </c:when>
        
        <c:when test="${totBoard< 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	      <c:forEach   var="page" begin="1" end="${totBoard/10 +1}" step="1" >
	         <c:choose>
	           <c:when test="${page==pageNum }">
	            <a class="sel-page"  href="${contextPath }/board/boardList.do?section=${section}&pageNum=${page}">${page } </a>
	          </c:when>
	          <c:otherwise>
	            <a class="no-uline"  href="${contextPath }/board/boardList.do?section=${section}&pageNum=${page}">${page } </a>
	          </c:otherwise>
	        </c:choose>
	      </c:forEach>
        </c:when>
      </c:choose>
    </c:if>
</div>     
<!--  왜인지 c 안에 작성한 코드가 반영이 안 돼서 일단 관리자검사 생략
<div>
<c:if test="${isAdmin } ">
	<a href="${contextPath }/admin/noticeForm" > 글쓰기 </a>
	</c:if>
	
<c:if test="${not isAdmin } ">
	<p>관리자가 아니므로 글쓰기 불가</p>
	</c:if>
	
</div>  
 -->
 <a href="${contextPath }/board/boardForm.do" > 글쓰기 </a>
	
</body>