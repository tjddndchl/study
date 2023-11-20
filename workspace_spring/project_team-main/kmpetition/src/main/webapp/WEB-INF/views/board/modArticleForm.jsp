<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" import="java.util.Date"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="now" value="<%=new Date()%>" />
<c:set var="article" value="${articleMap.article}" />
<c:set var="uploadList" value="${articleMap.uploadList}" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function backToList(obj) { // [리스트로 돌아가기] 나 [취소] 눌렀을 때 obj <- this.form(폼 객체 전체)
		obj.action = "${contextPath}/board/noticeList.do";
		obj.submit();
	}

	var cnt = 1;
	function fn_addFile() {
		$("#d_file")
				.append("<br>" + "<input type='file' name='file"+cnt+"' />");
		cnt++;
	}
	
	
	function fileDelete(id, fileName, fileId) {
		var file=document.getElementById(fileId);
		file.setAttribute("name", "removeList");
		/* 
		$("#d_file")
		.append("<input type='hidden' name='removeList' value='"+fileName+"'/>");
		 */
		$("#"+id).hide();
		
	}
</script>


<body>
	<form method="post" action="${contextPath}/board/modArticle.do"
		enctype="multipart/form-data">
		<table border=0 align="center">
<tr>
				<td width="150" align="center" bgcolor="#FF9933">작성자</td>
				<td><input type=text name="v_id" id="id" value=${memberInfo.id } disabled/></td>
				<input type="hidden" name="id" value=${memberInfo.id }>
				<input type="hidden" name="articleNO" value=${article.articleNO }>
			</tr>

			<tr>
				<td width="150" align="center" bgcolor="#FF9933">제목</td>
				<td><input type=text name="title" id="i_title"  value='${article.title }'></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">내용</td>
				<td><textarea rows="20" cols="60" name="content" id="i_content" >${article.content }</textarea></td>
			</tr>

			<tr>
				<td width="150" align="center" bgcolor="#FF9933">등록일자</td>
				<td><input type=text value="${article.createdate }"
					disabled /></td>
			</tr>
			<c:if test="${not empty uploadList}">
				<tr>
				<td width="150" align="center" bgcolor="#FF9933">첨부파일</td>
				<td>
				<c:forEach var="file" items="${uploadList }" varStatus="num">
				<div id="file${num.count }">
					<input type="text" value="${file.uploadfile }" name="attachName" id="${num.count }" >		
					<input type="button" value="파일다운로드" onClick="fileDownload('${contextPath }/downloadFile.do','${file.uploadfile }')"/></br>  
					<input type="button" value="파일삭제" onClick="fileDelete('file${num.count }', '${file.uploadfile }', '${num.count }')"/></br>
				</div>
				</c:forEach>
				</td>
				</tr>
			</c:if>
			
			<tr>
				<td align="right">파일 첨부</td>
				<td align="left"><input type="button" value="파일 추가"
					onClick="fn_addFile()" /></td>


			</tr>
			<tr>
				<td colspan="4"><div id="d_file"></div></td>
			</tr>


			<tr id="tr_btn">
				<td><input type=button value="리스트로 돌아가기"
					onClick="backToList(this.form)"> <input type="submit"
					value="등록하기"></td>
					<td align="right">공개여부</td>
					<td>
						<input type="checkbox" name="visible" checked="checked" >
						<!-- <input type="hidden" name="visible" value="true"> -->
					</td>
			</tr>


		</table>
	</form>
</body>
