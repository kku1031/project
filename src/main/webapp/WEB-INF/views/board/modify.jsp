<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jspf"%>

<script>

let bnoValue = "${board.bno}";
</script>
<div class="container">
	<div class="jumbotron my-3">
		<h3>수정 페이지</h3>
	</div>
	<form action="${contextPath}/board/modify" method="post" id="modifyForm" enctype="multipart/form-data">
			<!-- 시큐리티 토큰 추가 -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="bno" value="${board.bno}">			
			<input type="hidden" name="writer" value="${board.writer}">				
			<div class="form-group">
				<label>제목 : </label> <input type="text" class="form-control"
					name="title" value="${board.title}">
				<!-- // -->
			</div>
			<div class="form-group">
				<label>내용 : </label>
				<textarea rows="10" class="form-control" name="content">${board.content}</textarea>
			</div>
			<div class="form-group">
				<label>작성자 : </label> <input type="text" class="form-control"
					name="writer" value="${board.writer}" readonly>
				<!-- // -->
			</div>
		<button class="btn btn-primary">수정하기</button>
	</form>
			<div class="row my-5">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>파일 첨부</h4>
						</div>
						<div class="card-body">
							<div class="uploadDiv">
								<input type="file" name="uploadFile" multiple="multiple">
							</div>
							<div class="uploadResult">
								<ul class="list-group"></ul>
							</div>
						</div>
					</div>
				</div>
			</div>
</div>

<script>

function showUploadResult(uploadResultArr){
	if(!uploadResultArr || uploadResultArr.length == 0) return;
	let str = "";
	$(uploadResultArr).each(function(i,obj){
		if(!obj.fileType){ // 이미지가 아닌 경우 
			let fileCellPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_"+obj.fileName);
			
			str+= "<li class='list-group-item' data-path='"+obj.uploadPath+"' ";
			str+= "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
			str+= "<img src='"+contextPath+"/resources/assets/img/attach.png' style='width:50px;' >"
			str+= "<span>"+obj.fileName+"</span>"
			str+= "<div class='d-flex justify-content-end'><span data-file='"+fileCellPath+"' data-type='file'>삭제</span></div>"
			str+="</li>"
		} else{ // 이미지인 경우
			let fileCellPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_"+obj.fileName);
			let originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
			originPath = originPath.replace(new RegExp(/\\/g),"/");
			
			str+= "<li class='list-group-item' data-path='"+obj.uploadPath+"' ";
			str+= "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
			str += "<img src='"+contextPath+"/display?fileName="+fileCellPath+"'>";
			str+= "<span>"+obj.fileName+"</span>"
			str+= "<div class='d-flex justify-content-end'><span data-file='"+fileCellPath+"' data-type='image'>삭제</span></div>"
			str += "</li>" 
		}
	})
	$('.uploadResult ul').append(str);
}


let regex = new RegExp("(.*?)\.(exe|sh|js|alz)$")
let maxSize = 5242880;
function checkExtension(fileName, fileSize){
	if(fileSize >= maxSize ){
		alert('파일 사이즈 초과');
		return false; 
	}
	if(regex.test(fileName)){
		alert('허용되지 않는 확장자')
		return false; 
	}
	return true; 
}


//삭제
$(function(){
	
	$.getJSON(contextPath+"/board/getAttachList", {bno : bnoValue}, function(attachList){
		showUploadResult(attachList);
	}) // $.getJSON end
	
	$('.uploadResult ul').on('click','span',function(){
		let targetLi = $(this).closest('li');
		targetLi.remove(); 
		console.log(targetLi)
		
	}) // delete event end
	
	// 파일업로드 
	$('input[type="file"]').change(function(){
		let formData = new FormData(); 
		let inputFiles = $('input[name="uploadFile"]');
		let files = inputFiles[0].files;
		
		for(let f of files){
			if(!checkExtension(f.name, f.size)) return false; 
			formData.append('uploadFile', f);
		}
		
		$.ajax({
			url : contextPath + '/uploadAjaxAction', 
			type : 'post', 
			processData : false, 
			contentType : false, 
			data : formData, 
			dataType : 'json', 
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenName);
			}, //시큐리티 접목 후 토큰 추가
			success : function(result){
				showUploadResult(result);
			}			
		});
	}) // change event end
	
	let modifyForm = $('#modifyForm');
	let modifyBtn =  $('#modifyForm button');
	modifyBtn.on('click',function(e){
		e.preventDefault();
		let str = "";
		$('.uploadResult ul li').each(function(i,obj){
			let jobj = $(obj);
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data('filename')+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data('uuid')+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data('path')+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data('type')+"'>";
		});
		modifyForm.append(str).submit();
	})	
})	
</script>

<%@ include file="../layout/footer.jspf"%>