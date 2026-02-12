/**
 * (고급) 추가페이지, 수정페이지(상세조회)만 유효성을 넣어면 됩니다.
 * #addForm: 추가페이지 form 태그 id별명
 * username : form 태그 안에 input 태그 id별명임
 */
$("#addForm").validate({
  // 1) 유효성 규칙
  rules: {
    // 유효성 검사 규칙
    dname: {
      // 이름 필드
      required: true, // 필수 입력(반드시 입력해야함)
      minlength: 2,   // 최소 입력 길이
    },
    loc: {
      // 이름 필드
      required: true, // 필수 입력(반드시 입력해야함)
      minlength: 2,   // 최소 입력 길이
    }

  },
  // 2) 규칙에 위반되었을때(잘못 입력했을때)
  messages: {
    // 오류값 발생시 출력할 메시지 수동 지정
    dname: {
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    },
    loc: {
      required: "필수 입력 항목입니다.",
      minlength: "최소 {0}글자 이상 입력하세요.",
    }


  },
});