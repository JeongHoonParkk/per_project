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
            <tr class="top">
                <th class="title">
                   About Us
                </th>
            </tr>
            <tr>
                <td class="title_t">나를 자유롭게 표현해보세요.</td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="ipt" id="contact" name="contact" placeholder="휴대폰 번호"><br>
                    <input type="text" class="ipt" id="name" name="name" placeholder="성명"><br>
                    <input type="text" class="ipt" id="nickname" name="nickname" placeholder="사용자 이름"><br>
                    <input type="password" class="ipt" id="pwd" name="pwd" placeholder="비밀번호"><br>
                    <input type="button" id="sub" value="가입">
                </td>
            </tr>
            <tr>
                <td>
                   
                    <div class="register">
                        계정이 있으신가요? <a href="login">로그인</a>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	    function idCheck() {
	        var form = $("#frm").serialize();
	        $.ajax({
	            url: 'idCheck', 
	            type: 'post',
	            data: form,
	            success: function(result) {
	                if (result === "yes") {
	                    register();
	                } else if (result === "no") {
	                    alert("이미 존재하는 사용자 이름입니다.");
	                }
	            },
	            error: function() {
	                alert("계정생성중 오류가 발생하였습니다.");
	            }
	        });
	    }
	    
	    // 가입 버튼 클릭 시 idCheck() 함수 호출
	    $("#sub").click(idCheck);
	});
	
	function register() {
	    var form = $("#frm").serialize();
	    $.ajax({
	        url: 'registerOk', 
	        type: 'post',
	        data: form,
	        success: function(result) {
	            alert("회원가입을 축하드립니다.");
	            location.href = 'login';
	        },
	        error: function() {
	            alert("계정생성중 오류가 발생하였습니다.");
	        }
	    });
	}
</script>
</html>