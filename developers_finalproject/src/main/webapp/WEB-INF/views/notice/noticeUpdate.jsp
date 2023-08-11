<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${path }/css/noticeAndCommunity/coStyle.css" />

    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link
      rel="stylesheet"
      href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css"
      type="text/css"
    />
    <script>document.execCommand('defaultParagraphSeparator', false, 'p');</script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
<section>
   
    <div class="container p-3 nw-container">

        <div><h3 class="text-center">공지사항 작성</h3></div>
        <form action="/notice/insertNotice.do" class="notice-form" method="post">
            <table class="table notice-table">
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 80%">
                    
                </colgroup>
                <tr>
                    <th class="text-center text-align">제목</th>
                    <td><input type="text" class="form-control" name="noticeTitle" ></td>
                </tr>
                <tr>
                    <th class="text-center text-align">내용</th>
                    <td>
                    	<div contentEditable="true" class="form-control" id="contentArea" style="min-height:200px;">
              
                    	</div>
                    	<textarea class="form-control" name="noticeContent" style="display:none"></textarea>
                    </td>
                </tr>
                
                <tr>
                    <th class="text-center text-align">
                        첨부파일
                    </th>
                    <td>
                <div class="registImgCon form-control">
                    <div class="registImg">
                      <div class="dropzone" id="dropDiv"></div>
                      
                      <div id="imgInfo">
                        <p>-파일은 최대 5개까지 등록 가능합니다.</p>
                        <p>-권장 사이즈(500px * 500px)</p>
                      </div>
                      <button type="button" class="w-btn btn-blue" id="file-submit">파일 업로드</button>
                      
                      <!-- 포스팅 - 이미지/동영상 dropzone 영역 -->
                      <div id="dropPreview">
                        <ul class="list-unstyled mb-0" id="dropzone-preview">
                          <li class="mt-2" id="dropzone-preview-list">
                            <!-- This is used as the file preview template -->
                            <div class="border rounded-3">
                              <div class="d-flex align-items-center p-2">
                                <div class="flex-shrink-0 me-3">
                                  <div class="width-8 h-auto rounded-3">
                                    <img
                                      data-dz-thumbnail="data-dz-thumbnail"
                                      class="w-full h-auto rounded-3 block"
                                      src="#"
                                      alt="Dropzone-Image"
                                      style="width: 120px"
                                    />
                                  </div>
                                </div>
                                <div class="flex-grow-1">
                                  <div class="pt-1">
                                    <h6
                                      class="font-semibold mb-1"
                                      data-dz-name="data-dz-name"
                                    >
                                      &nbsp;
                                    </h6>
                                    <p
                                      class="text-sm text-muted fw-normal"
                                      data-dz-size="data-dz-size"
                                    ></p>
                                    <strong
                                      class="error text-danger"
                                      data-dz-errormessage="data-dz-errormessage"
                                    ></strong>
                                  </div>
                                </div>
                                <div class="shrink-0 ms-3">
                                  <button
                                    data-dz-remove="data-dz-remove"
                                    class="del-img w-btn w-btn-red"
                                  >
                                    Delete
                                  </button>
                                </div>
                              </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                    
                </td>
                </tr>
            </table>
            <div class="d-flex justify-content-center mt-4">
           <button type="button" class="w-btn" onclick="noticeWrite();">등록하기</button>&nbsp;
           <button type="reset" class="btn btn-dark">취소</button>
                </div>
        </form>

    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
  <script>
		let fileName;
        Dropzone.autoDiscover = false;
        var dropzonePreviewNode = document.querySelector("#dropzone-preview-list");
        dropzonePreviewNode.id = "";
        var previewTemplate = dropzonePreviewNode.parentNode.innerHTML;
        dropzonePreviewNode.parentNode.removeChild(dropzonePreviewNode);

        const dropzone = new Dropzone(".dropzone", {
        autoProcessQueue: false,
        paramName: "files",
        url: "/ncCommon/noticeUploadFile.do", // 파일을 업로드할 서버 주소 url.
        method: "post", // 기본 post로 request 감. put으로도 할수있음
        uploadMultiple: true,
        maxFiles: 5,
        maxFilesize: 5,
        acceptedFiles: "image/*",
        previewTemplate: previewTemplate, // 만일 기본 테마를 사용하지않고 커스텀 업로드 테마를 사용하고 싶다면
        previewsContainer: "#dropzone-preview", // 드롭존 영역을 .dropzone이 아닌 다른 엘리먼트에서 하고싶을때
        init: function () {
                /* 최초 dropzone 설정시 init을 통해 호출 */
                var submitButton = document.querySelector("#file-submit");
                var myDropzone = this; //closure
                submitButton.addEventListener("click", function () {
                    console.log("업로드"); //tell Dropzone to process all queued files
                    myDropzone.processQueue();
                });
                this.on('success', function (data) {
                	fileName=data.xhr.response;
         			
                	
                	var str = "";
                   
                    str += "<div>";
                    str += "<img src='/upload/notice/"+fileName+"' style='width:400px'; height:400px' readonly>";   
                    str += "<button type='button' class='removeBtn' data-name='"+fileName+"'>Remove</button>";
                    str += "</div>";
                    str += "<br><br>";
                     
                    $("#contentArea").append(str);
                	                	
                	
                 });
            },
        });
        
        
        const noticeWrite=()=>{
   			$(".removeBtn").css("display","none");
        	$("textarea[name=noticeContent]").val($("#contentArea").html());
        	
        	$(".notice-form").submit();
        }
        
        
        
        
        $("#contentArea").on("click",".removeBtn",function(e){
        	let target=$(this);
        	const fileName=target.data("name");
        	const targetDiv=e.target.closest("div");
        
        	
        	$.ajax({
        		url: "/ncCommon/removeFile.do",
        		data: {fileName:fileName},
        		type:"post",
        		success:(data)=>{
        			if(data=="true"){
        				targetDiv.remove();	
        			}
        			else{
        				alert("삭제실패");
        			}
        			
        		}
        	})
        });
        
        
        
        
        
        
  </script>