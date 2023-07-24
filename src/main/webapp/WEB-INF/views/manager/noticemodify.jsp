<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
<h2>modifyForm.jsp</h2>
<div class="container">
		<form action="modify" method="post">
			<table class="table">
				<tr>
					<td>
					<input type="hidden" name="noticeNo" value="${dto.noticeNo }" />
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5"><input type="text" name="title" id="" value="${dto.noticeTitle }"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="contents" id="summernote" cols="30" rows="10" >${dto.noticeContents }</textarea></td>
				</tr>
				<tr>
					<td colspan="6">
					<a href="notice"><input type="button"	class="btn btn-outline-dark" value="목록" /></a> 
					<input type="submit" value="수정" />
					
				</tr>
			</table>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height: 300,
				minHeight: null,
				maxHeight: null,
				lang:"ko-KR",
				palceholder:'여기에 글을 작성하세요.'
			});
		});
	</script>


</body>
</html>