<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lumanosimo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/main.css">
    <style type="text/css">
	
    </style>
</head>

<body style="font-family: 'Lumanosimo', cursive;">
    <header>
        <div id="title">
            About Us
        </div>
        <div id="search">
            <div class="s_ipt">
                <input type="text" name="" class="searIpt" placeholder="Search">
            </div>
            <div class="s_btn">
                <button class="s_Btn"><img src="resources/img/search3.png" class="s_img"></button>
            </div>
        </div>
        <div id="pf" >
        	<a href="">
        		<img src="resources/img/prof3.png" class="prof_img"> ${nickname}
        	</a>
        </div>
    </header>
    <aside>
        <div id="left">
            <ul>
                <li class="menu">
                    <div>
                        <a class="hidden" href="mainPage">Home</a>
                        <div class="icon">
                            <a href="mainPage">
                                <img src="resources/img/home.png" class="icon_img" alt="">
                            </a>
                        </div>
                    </div>
                </li>
                <li class="menu_btn">
                    <div>
                        <button type="button" class="hidden" id="modal_btn" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            data-bs-whatever="@mdo">
                            Write
                        </button>
                        <div class="icon">
                        	<button type="button" class="hidden" id="modal_btn" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            data-bs-whatever="@mdo">
	                            <img src="resources/img/write.png" class="icon_img" alt="">    
                        </button>
                        </div>
                    </div>
                </li>
                <li class="menu">
                    <div>
                        <a class="hidden" href="/">Profile</a>
                        <div class="icon">
                            <a href="">
                                <img src="resources/img/profile.png" class="icon_img" alt="">    
                            </a>
                        </div>
                    </div>
                </li>
                <li class="menu">
                    <div>
                        <a class="hidden" href="/">Setting</a>
                        <div class="icon">
                            <a href="">
                                <img src="resources/img/setting.png" class="icon_img" alt="">    
                            </a>
                        </div>
                    </div>
                </li>
                <li class="menu">
                    <div class="logout">
                    	<button type="button" class="logout" onclick="logout()">
                    		logout
                    	</button>
                    </div>
                </li>
            </ul>
        </div>
    </aside>
<section>
    <div id="content_box">
        <c:if test="${empty list}">
            <div class="noCont">
                작성된 글이 없습니다.
            </div>
        </c:if>
        <c:if test="${not empty list}">
            <c:forEach items="${list}" var="list" varStatus="loopStatus">
                <form id="cont_up">
                    <div id="content">
                        <div class="con_top">
                            <br>
                            ${nickname} 님의 글!
                            <input type="hidden" name="b_number" value="${list.b_number}">
                            <input type="hidden" name="nickname" value="${nickname}">
                        </div>
                        <div class="con_body" style="text-align: center;">
                            <!-- c:if 사용 사진 있으면 표시 / 없으면 미표시 -->
                            <img src="" alt="">
                            <!--  -->
                            <!-- 글 내용 -->
                            <br>
                            <pre style="font-family: 'Lumanosimo', cursive">${list.content}</pre>
                        </div>
                        <div class="con_btm">
                            <c:if test="${nickname == list.nickname}">
                                <div class="ud_btn">
                                    <button type="button" class="btn" id="modal_btn2" data-bs-toggle="modal" data-bs-target="#exampleModal${list.b_number}"
                                            data-bs-whatever="@mdo">
                                        Edit
                                    </button>
                                    <button class="btn" onclick="Delete(${list.b_number})">Delete</button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </form>
            </c:forEach>
        </c:if>
    </div>
</section>
    <footer>
        <div>
            Parkk © 2023
        </div>
    </footer>
    <!-- 모달 -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">자유롭게 표현하세요!</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 내용 전송 폼 -->
                    <form id="write">
                        <div class="mb-3">
                            <textarea class="form-control" id="message-text" name="content" style="text-align: left;"></textarea>
                            <input type="hidden" name="nickname" value="${nickname}">
                        </div>
                    </form>
                    <!--  -->
                </div>
                <div class="modal-footer">
                    <button type="button" id="close_btn" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="write_btn" onclick="Write()">Write</button>
                </div>
            </div>
        </div>
    </div>
     <!-- 업데이트 모달 -->
	<c:forEach items="${list}" var="update">
	    <div class="modal fade" id="exampleModal${update.b_number}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h1 class="modal-title fs-5" id="exampleModalLabel">자유롭게 표현하세요!</h1>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                    <!-- 내용 전송 폼 -->
	                    <form class="edit-form" id="edit-${update.b_number}">
	                        <div class="mb-3">
	                            <textarea class="form-control" id="message-text2" name="content" style="text-align: left;">${update.content}</textarea>
	                            <input type="hidden" name="b_number" value="${update.b_number}">
	                            <input type="hidden" name="nickname" value="${nickname}">
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="close_btn" data-bs-dismiss="modal">Close</button>
	                    <button type="button" class="edit_btn">Edit</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</c:forEach>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
    crossorigin="anonymous"></script>
<script type="text/javascript">
	function logout() {
		alert("로그인페이지로 이동합니다.")
		location.href = "logout";
	}
	
	function Write() {
		var form = $("#write").serialize();
		$.ajax({
			url: 'write',
			type: 'post',
			data: form,
			success: function(result) {
				location.reload(true);
			},
			error: function(){
				alert("글작성중에 문제가 발생하였습니다.");
			}
		});
	}
	
	$(document).ready(function() {
	    $(".edit_btn").click(function() {
	        var $modal = $(this).closest(".modal");
	        var form = $modal.find(".edit-form").serialize();
	        
	        $.ajax({
	            url: 'update', 
	            type: 'post',
	            data: form,
	            success: function(result) {
	                alert("수정되었습니다!");
	                $modal.modal('hide'); // 모달 닫기
	                location.reload(true);
	            },
	            error: function(){
	                alert("글 수정 중에 문제가 발생하였습니다.");
	            }
	        });
	    });

	    $(".close_btn").click(function() {
	        $(this).closest(".modal").modal('hide');
	    });
	});
	
	function Delete(b_number) {
		var form = { b_number: b_number };
		$.ajax({
			url: 'delete',
			type: 'post',
			data: form,
			success: function(result) {
				alert("삭제되었습니다!");
				//1
				location.reload(true);
				//2
// 				location.href = location.href;
			},
			error: function(){
				alert("글 삭제중 문제가 발생하였습니다.");
			}
		});
	}
</script>
</html>