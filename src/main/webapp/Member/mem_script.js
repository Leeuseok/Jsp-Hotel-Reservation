function idCheck(mem_id, callback) {
	var frm = document.regFrm;
	if (mem_id == "") {
		alert("아이디를 입력해 주세요.");
		frm.mem_id.focus();
		return;
	}

	// 정규표현식을 사용한 유효성 검사
	var idPattern = /^[a-zA-Z0-9]{4,12}$/;
	if (!idPattern.test(mem_id)) {
		alert("아이디는 4~12자의 영어 혹은 숫자만 가능합니다.");
		frm.mem_id.focus();
		return;
	}

	// AJAX를 이용한 비동기 요청
	var xhr = new XMLHttpRequest();
	var url = "idCheck.jsp?mem_id=" + mem_id;
	xhr.open("GET", url, true);

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = JSON.parse(xhr.responseText);
			alert(result.message);
			// 콜백 함수 호출하여 결과 전달
			callback(result);
		}
	};

	xhr.send();
}

function idCheck2(mem_id, callback) {
	var frm = document.regFrm;
	if (mem_id == "") {
		alert("아이디를 입력해 주세요.");
		frm.mem_id.focus();
		return;
	}

	// 정규표현식을 사용한 유효성 검사
	var idPattern = /^[a-zA-Z0-9]{4,12}$/;
	if (!idPattern.test(mem_id)) {
		alert("아이디는 4~12자의 영어 혹은 숫자만 가능합니다.");
		frm.mem_id.focus();
		return;
	}

	// AJAX를 이용한 비동기 요청
	var xhr = new XMLHttpRequest();
	var url = "idCheck.jsp?mem_id=" + mem_id;
	xhr.open("GET", url, true);

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = JSON.parse(xhr.responseText);
			// 콜백 함수 호출하여 결과 전달
			callback(result);
		}
	};

	xhr.send();
}

function inputCheck() {
    var mem_pw = document.regFrm.mem_pw.value;
    var mem_repw = document.regFrm.repw.value;  // 비밀번호 확인 값 추가
    var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;

    if (document.regFrm.mem_id.value == "") {
        alert("아이디를 입력해주세요.");
        document.regFrm.mem_id.focus();
        return;
    }

    // 아이디 중복 확인
    idCheck2(document.regFrm.mem_id.value, function(result) {
        // 중복이면 다음 입력 체크 수행하지 않음
        if (result.duplicate) {
            return;
        }

        if (document.regFrm.mem_pw.value == "") {
            alert("비밀번호를 입력해주세요.");
            document.regFrm.mem_pw.focus();
            return;
        }

        if (!pwPattern.test(mem_pw)) {
            alert("비밀번호는 8글자 이상이어야 하며, 영문, 숫자, 특수문자를 모두 포함해야 합니다.");
            document.regFrm.mem_pw.focus();
            return;
        }

        if (document.regFrm.repw.value == "") {
            alert("비밀번호 확인을 입력해주세요.");
            document.regFrm.repw.focus();
            return;
        }

        // 비밀번호 확인이 비어있거나 비밀번호와 다를 때
        if (mem_pw !== mem_repw) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            document.regFrm.repw.focus();
            return;
        }

        if (document.regFrm.mem_name.value == "") {
            alert("이름을 입력해주세요.");
            document.regFrm.mem_name.focus();
            return;
        }



        if (document.regFrm.mem_phone.value == "") {
            alert("주소를 입력해주세요.");
            document.regFrm.mem_phone.focus();
            return;
        }
        // 휴대폰번호 유효성 검사
        var mem_phone = document.regFrm.mem_phone.value;
        var phonePattern = /^\d{11}$/;

        if (!phonePattern.test(mem_phone)) {
            alert("휴대폰번호는 11자리의 숫자여야 합니다.");
            document.regFrm.mem_phone.focus();
            return;
        }

        if (document.regFrm.mem_addr.value == "") {
            alert("주소를 입력해주세요.");
            document.regFrm.mem_addr.focus();
            return;
        }

        if (document.regFrm.mem_birth.value == "") {
            alert("생년월일을 입력해주세요.");
            document.regFrm.mem_birth.focus();
            return;
        }

        // 생년월일은 8자리의 숫자인지 확인
        var mem_birth = document.regFrm.mem_birth.value;
        var birthPattern = /^\d{8}$/;

        if (!birthPattern.test(mem_birth)) {
            alert("생년월일은 8자리의 숫자여야 합니다.");
            document.regFrm.mem_birth.focus();
            return;
        }

        // 나머지 입력이 모두 완료되면 회원가입 진행
        document.regFrm.submit();
    });
}

function win_close() {
    self.close();
}
