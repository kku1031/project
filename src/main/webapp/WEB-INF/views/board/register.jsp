<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jspf" %>
<div class="container">
	<div class="jumbotron my-3">
		<h3>글 쓰기</h3>
	</div>
	
	<form action="${contextPath}/board/register" method="post" id="registerForm">
		<div class="form-group">
			<label>제목 : </label>
			<input type="text" class="form-control" name="title">
		</div>
		<div class="form-group">
			<label>내용 : </label>
			<textarea rows="10" class="form-control" name="content" ></textarea>
		</div>
		<div class="form-group">
			<label>작성자 : </label>
			<input type="text" class="form-control" name="writer">
		</div>
	</form>		
</div>
<div class="container">
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
				</div> <!-- panel-body -->
			</div> <!-- panel end -->
		</div> <!-- col end -->
	</div><!-- row end -->
</div>
<div class="container">
		<button class="btn btn-primary">등록</button>
</div>
<script>		
	$(function(){
		let form = $('#registerForm');
		let submitBtn = $('#registerForm button');
		
		form.on('click', function(e){
			e.preventDefault();
			console.log("폼 기본 동작 금지");
		})
		
		//파일업로드		
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
		
		$('input[type="file"]').change(function(){
			let formData = new FormData();
			let inputFiles = $('input[name="uploadFile"]');
			let files = inputFiles[0].files;
			
			for(let f of files){
				if(!checkExtension(f.name, f.size)){
					return false;
				}
				formData.append('uploadFile', f);
			}
			
			$.ajax({
				url : contextPath + '/uploadAjaxAction',
				type : 'post',
				processData : false,
				contentType : false,
				data : formData,
				dataType : 'json',
				success : function(result){
					console.log(result)
					showUploadResult(result)
				}
			});
		})	
		
		//썸네일 처리 부분
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			let uploadResult = $('.uploadResult ul');
			let str = "";
			$(uploadResultArr).each(function(i,obj){
				if(!obj.image){ //이미지가 아닌 경우
					let fileCellPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" +obj.fileName);
					str+="<li><img src='${contextPath}/resources/assets/img/attach.png' style='width:50px;'>"
					str+="<a href='${contextPath}/download?fileName="+fileCellPath+"'>"+obj.fileName+"</a>"
					str+= "<span data-file='"+fileCellPath+"'' data-type='file'>삭제</span>"		
					str+="</li>"
				} else { //이미지인 경우		
					let fileCellPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" +obj.fileName);
					let originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					str+= "<li><img src='${contextPath}/display?fileName="+fileCellPath+"'>";
					str+= "<a href='javascript:showImage(\""+originPath+"\")'>이미지원본보기</a>";
					str+= "<br><span data-file='"+fileCellPath+"'' data-type='image'>삭제</span>"		
					str+= "</li>"
				}		
			})
			uploadResult.append(str);
		}	
		
		$('.uploadResult ul').on('click','span',function(){
			let targetFile = $(this).data('file');
			let type = $(this).data('type');
			let targetLi = $(this).closest('li');
			$.ajax({
				url : contextPath + '/deleteFile',
				type : 'post',
				data : {fileName : targetFile, type : type},
				dataType : 'text',
				success : function(result){
					alert(result);
					targetLi.remove();
				}
			})
		})		
	}) 	
</script>
<%@ include file="../layout/footer.jspf" %>