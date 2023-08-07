<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lumanosimo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
    <form id="frm">
        <table>
            <tr>
                <th class="title">
                   About Us
                </th>
            </tr>
            <tr>
                <td class="title_t">나를 자유롭게 표현해보세요.</td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="ipt" name="nickname" id="nickname" placeholder="사용자 아이디"><br>
                    <input type="password" class="ipt" name="pwd" placeholder="비밀번호"><br>
                    <input type="button" id="sub" value="로그인" onclick="login()">
                </td>
            </tr>
            <tr>
                <td>
                    <div class="hr-sect">OR</div>
                    <div class="register">
                        계정이 없으신가요? <a href="register">가입하기</a>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function login() {
		let nickname = document.getElementById("nickname").value;
		var form = $('#frm').serialize();
		$.ajax({
			type: 'POST',
			url: 'loginCheck',
			data: form,
			success: function (response) {
				if(response == "no") {
					alert("사용자 이름 또는 비밀번호를 잘못입력하셨습니다.");
				}else if(response == "yes") { 
					var form = document.createElement('form');
					var nicknameInput = document.createElement('input');
					nicknameInput.setAttribute('type', 'hidden');
					nicknameInput.setAttribute('name', 'nickname');
					nicknameInput.setAttribute('value', nickname);
					form.appendChild(nicknameInput);
					
					form.setAttribute('method', 'POST');
					form.setAttribute('action', 'main');
					document.body.appendChild(form);
					form.submit();
				}else{
					alert("다시 시도해주세요.");
				}
			},
			error: function (xhr, status, error) {
	            console.log("Error:", error);
	        }
		});
	}
</script>
</html>