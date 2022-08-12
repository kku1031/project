<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jspf"%>
<div class="container">
	<div class="jumbotron my-3">
		<h3>글 쓰기</h3>
	</div>
	<form action="${contextPath}/board/register" method="post" id="registerForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group">
			<label>제목 : </label> <input type="text" class="form-control" name="title">
		</div>
		<div class="form-group">
			<label>내용 : </label>
			<textarea rows="10" class="form-control" name="content"></textarea>
		</div>
		<div class="form-group">
			<label>작성자 : </label> <input type="text" class="form-control" name="writer">
		</div>
		<div class="row my-5">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h4>파일 첨부</h4>
					</div>
					<div class="card-body">
						<div class="uploadDiv"> <input type="file" name="uploadFile" multiple="multiple"></div>
						<div class="uploadResult"><ul class="list-group"></ul></div>
					</div>
				</div>
			</div>
		</div>
		<button class="btn btn-primary">등록</button>			
	</form>
</div>

<script>	
	//파일 확장자, 용량 지정
	let regex = new RegExp("(.*?)\.(exe|sh|js|alz)$")
	let maxSize = 5242880; //5MB
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert('파일 사이즈 초과');
			return false;
		}
		if(regex.test(fileName)){
			alert('허용되지 않는 확장자')
			return false;
		}
		return true;
	}		
	
	let uploadResult = $('.uploadResult ul');
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){return;}
		let str = "";
		$(uploadResultArr).each(function(i,obj){
			if(!obj.fileType){ //이미지가 아닌 경우
				let fileCellPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" +obj.fileName);					
				str+="<li class='list-group-item' data-path='"+obj.uploadPath+"'"
				str+="data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
				str+="<img src='${contextPath}/resources/assets/img/attach.png' style='width:50px;'>"
				str+="<a href='${contextPath}/download?fileName="+fileCellPath+"'>"+obj.fileName+"</a>"
				str+= "<span data-file='"+fileCellPath+"'' data-type='file'>삭제</span>"		
				str+="</li>"
			} else { //이미지인 경우		
				let fileCellPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" +obj.fileName);
				let originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
				originPath = originPath.replace(new RegExp(/\\/g),"/");
				
				str+="<li class='list-group-item' data-path='"+obj.uploadPath+"'"
				str+="data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
				str+= "<img src='${contextPath}/display?fileName="+fileCellPath+"'>";
				str+= "<a href='javascript:showImage(\""+originPath+"\")'>이미지원본보기</a>";
				str+= "<span data-file='"+fileCellPath+"'' data-type='image'>삭제</span>"		
				str+= "</li>"
			}		
		})
		uploadResult.append(str);
	}	

//글쓰기 처리 form 태그 전송을 submit으로 재설정
$(function(){
	let form = $('#registerForm');
	let submitBtn = $('#registerForm button');
	
	submitBtn.on('click',function(e){
		e.preventDefault();
		let str = "";
		$('.uploadResult li').each(function(i,obj){
			let jobj = $(obj);
			
			str +="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data('filename')+"'>";
			str +="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data('uuid')+"'>";
			str +="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data('path')+"'>";
			str +="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data('type')+"'>";
		})
		form.append(str).submit();
	})
	
	//파일업로드
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
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenName);
			}, //시큐리티 접목 후 토큰 추가
			data : formData,
			dataType : 'json',
			success : function(result){
				showUploadResult(result)
			}
		});
	})	
	
	// 파일 삭제, 썸네일 처리 부분
	$('.uploadResult ul').on('click','span',function(){
		let targetFile = $(this).data('file');
		let type = $(this).data('type');
		let targetLi = $(this).closest('li');

		$.ajax({
			url : contextPath + '/deleteFile',
			type : 'post',
			data : {fileName : targetFile, type : type},
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenName);
			}, //시큐리티 접목 후 토큰 추가
			dataType : 'text',
			success : function(result){
				alert(result);
				targetLi.remove();
			}
		})
	})		
})	
	
</script>
<%@ include file="../layout/footer.jspf"%>