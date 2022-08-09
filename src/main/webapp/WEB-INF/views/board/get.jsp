<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jspf"%>
<script src="${contextPath}/resources/js/get.js">
	
</script>
<script>
	let bnoValue = $
	{
		board.bno
	};
</script>

<input type="hidden" name="bno" value="${board.bno}" id="bno">
<input type="hidden" name="page"
	value="${param.page == '' ? 1 : param.page}" id="page">
<input type="hidden" name="type" value="${param.type}" id="type">
<input type="hidden" name="keyword" value="${param.keyword}"
	id="keyword">

<div class="container">
	<div class="jumbotron">
		<h2>게시글 조회</h2>
	</div>
	<form id="getForm">
		<div class="card">
			<div class="card-header">
				<div class="row">
					<div class="col-sm-1">${board.bno }</div>
					<div class="col-sm-11">${board.title}</div>
				</div>
			</div>
			<div class="card-body">${board.content}</div>
			<div class="card-footer d-flex justify-content-between">
				<div>
					<button class="btn btn-warning modify">수정</button>
					<button class="btn btn-danger remove">삭제</button>
					<button class="btn btn-success list">목록</button>
				</div>
				<div>
					등록일 :
					<fmt:parseDate var="regDate" value="${board.regDate}"
						pattern="yyyy-MM-dd'T'" type="both" />
					<fmt:formatDate value="${regDate}" pattern="yyyy년MM월dd일" />
					<fmt:parseDate var="updateDate" value="${board.updateDate}"
						pattern="yyyy-MM-dd'T'" type="both" />
					수정일 :
					<fmt:formatDate value="${updateDate}" pattern="yyyy년MM월dd일" />
				</div>
			</div>
		</div>
	</form>
</div>

<script>
	$(function() {
		let getForm = $('#getForm'); // 폼 태그 변수 선언

		$('#getForm .list').on('click', function(e) { // 목록 버튼을 클릭했을 때 
			e.preventDefault();
			getForm.append($('#page'))
			getForm.append($('#type'))
			getForm.append($('#keyword'))
			getForm.attr("action", "list");
			getForm.attr("method", "get");
			getForm.submit();
		});

		$('#getForm .modify').on('click', function(e) { // 수정 버튼을 클릭했을 때 
			e.preventDefault();
			getForm.append($('#bno'))
			getForm.attr("action", "modify");
			getForm.attr("method", "get");
			getForm.submit();
		});

		$('#getForm .remove').on('click', function(e) { // 삭제 버튼을 클릭했을 때 
			e.preventDefault();
			getForm.append($('#bno'))
			getForm.attr("action", "remove");
			getForm.attr("method", "post");
			getForm.submit();
		});

	})
</script>
<div class="container">
	<div class="row my-5">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<h4>파일 첨부 내용</h4>
				</div>
				<div class="card-body">
					<div class="uploadResult">
						<ul class="list-group"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jspf"%>
