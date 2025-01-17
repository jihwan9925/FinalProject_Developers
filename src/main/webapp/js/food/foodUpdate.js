function sample6_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ''; // 주소 변수
      var extraAddr = ''; // 참고항목 변수

      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else { // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }

      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
      if (data.userSelectedType === 'R') {
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
          extraAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if (data.buildingName !== '' && data.apartment === 'Y') {
          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if (extraAddr !== '') {
          extraAddr = ' (' + extraAddr + ')';
        }
        // 조합된 참고항목을 해당 필드에 넣는다.
        document.getElementById("sample6_extraAddress").value = extraAddr;

      } else {
        document.getElementById("sample6_extraAddress").value = '';
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('sample6_postcode').value = data.zonecode;
      document.getElementById("sample6_address").value = addr;
      // 커서를 상세주소 필드로 이동한다.
      document.getElementById("sample6_detailAddress").focus();
    }
  }).open();
}

//★★★파일 업로드★★★\\
function getImageFiles(e) {
  const uploadFiles = [];
  const files = e.currentTarget.files;
  const imagePreview = document.querySelector('.image-preview');
  const docFrag = new DocumentFragment();

  if ([...files].length >= 5) {
    alert('이미지는 최대 5개 까지 업로드가 가능합니다.');
    return;
  }

  // 파일 타입 검사
  [...files].forEach(file => {
    if (!file.type.match("image/.*")) {
      alert('이미지 파일만 업로드가 가능합니다.');
      return
    }

    // 파일 갯수 검사
    if ([...files].length < 5) {
      uploadFiles.push(file);
      const reader = new FileReader();
      reader.onload = (e) => {
        const preview = createElement(e, file);
        imagePreview.appendChild(preview);
      };
      reader.readAsDataURL(file);
    }
  });
}

function createElement(e, file) {
  const li = document.createElement('li');
  const img = document.createElement('img');
  img.setAttribute('src', e.target.result);
  img.setAttribute('data-file', file.name);
  
  // Set the image size to 60x60
  img.style.width = '110px';
  img.style.height = '110px';

  li.appendChild(img);

  return li;
}

const realUpload = document.querySelector('.real-upload');
const upload = document.querySelector('.upload');

upload.addEventListener('click', () => realUpload.click());

realUpload.addEventListener('change', getImageFiles);


/*document.addEventListener("DOMContentLoaded", function() {
  const registCancelBtn = document.getElementById("registOkBtn");

  registOkBtn.addEventListener("click", function() {
	  
    
    
    if (confirm("등록하시겠습니까??")==true) {
		console.log("실해")
		document.getElementById('#foodRecommendForm').submit();
		
    }
  });
});
*/


function submitFoodRecommendForm() {
	var form = document.getElementById('foodRecommendForm');
	form.submit(); // 폼 데이터를 서버로 전송
}

/*====================================지환(AS)================================*/
function fn_foodRegist(event){
	//console.log($("#flexSwitchCheckChecked").val());
	const result = confirm("맛집 수정을 완료 하시겠습니까?");
	if(result == true){
	  $(event.target).attr("type","submit");
		const form=new FormData();
		const fileInput=$("#upFile");

		$.each(fileInput[0].files,(i,f)=>{
			form.append("upFile",f);
      console.log(form);
    });
        
    //form.append("foodNo",'${f.foodNo}');
    //맛집이름, 주소, 메뉴, 첨부사진 (없는거 : 오픈타임, 번호)
    form.append("frGrade",$(".starcountnum").val()/2);
    form.append("frContent",$("#FR_CONTENT").val());
    form.append("frNo",$("#selected_food_no").val());
    form.append("allow",$("#flexSwitchCheckChecked").val());

    $.ajax({
      url:getContextPath()+"/food/foodRegist.do",
      data:form,
      type:"post",
      enctype: "multipart/form-data",
      processData:false,
      contentType:false,
      cache: false,
      success:data=>{
        alert("수정이 완료되었습니다.");
        location.reload();
        $('window').scrollTop(0);
      },
      error:(r,s,e)=>{
        console.log("수정 실패 "+r.s+"\n"+"msg "+r.responseText+"\n"+"error "+e);
        alert("수정 실패");
      },
      complete:()=>{
        $(".upFile").val('');
      }
    });
  }
};

