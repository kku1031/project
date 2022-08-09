$(function() {
	//첨부파일리스트 불러오기
	$.getJSON(contextPath+"/board/getAttachList", {bno : bnoValue}, function(attachList){
		let str = "";
		$(attachList).each(function(i,obj){
			if(!obj.fileType){ //이미지가 아닌 경우			
				let fileCellPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" +obj.fileName);
				
				str+="<li class='list-group-item' data-path='"+obj.uploadPath+"'"
				str+="data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
				str+="<img src='"+contextPath+"/resources/assets/img/attach.png' style='width:50px;'>"
				str+="<a href='"+contextPath+"/download?fileName="+fileCellPath+"'>"+obj.fileName+"</a>"
				str+="</li>"
				
			} else { //이미지인 경우		
				let fileCellPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" +obj.fileName);
				let originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
				originPath = originPath.replace(new RegExp(/\\/g),"/");
				
				str+="<li class='list-group-item' data-path='"+obj.uploadPath+"'"
				str+="data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
				str+= "<img src='"+contextPath+"/display?fileName="+fileCellPath+"'>";
				str+="<a href='"+contextPath+"/download?fileName="+originPath+"'>"+obj.fileName+"</a>"
				str+= "</li>"
			}		
		}) //each end
		$('.uploadResult ul').append(str);
	})
			
})



