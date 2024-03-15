<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
	<body>
		
			<%--댓글 입력 화면 --%>
		<div>
			<form id="adoptionForm" name="adoptionForm">
				<div class="row mb-3">
					<label for="adoptionTitle" class="col-sm-1 col-form-label">작성자</label>
					<div class="col-sm-3">
						<input type="text" name="adoptionTitle" id="adoptionTitle" maxlength="5" class="form-control" />
					</div>
					<label for="adoptionPasswd" class="col-sm-1 col-form-label">비밀 번호</label>
					<div class="col-sm-3">
						<input type="password" name="adoptionPasswd" id="adoptionPasswd" maxlength="18" class="form-control" />
					</div>
					<button type="button" id="adoptionInsertBtn" class="btn btn-primary col-sm-1 sendBtn mx-2">저장</button>
				</div>
				<div class="row mb-3">
					<label for="adoptionContent" class="col-sm-1 col-form-label">댓글내용</label>
					<div class="col-sm-11">
						<textarea name="adoptionContent" id="adoptionContent" class="form-control" rows="3"></textarea>
					</div>
				</div>
			</form>
		</div>	
			<%--리스트 영역 --%>
		<div id="reviewList">
			<div class="card mb-2" id="item-template">
 				<div class="card-header">
	   				<span class="name"></span>
	   				<span class="date"></span>
	   				<button type="button" data-btn="upBtn" class="btn btn-primary btn-sm">수정하기</button>
	   				<button type="button" data-btn="delBtn" class="btn btn-primary btn-sm">삭제하기</button>
 				</div>
 				<div class="card-body">
   					<p class="card-text"></p>
 				</div>
			</div>
		</div>
		<script>
			let message = "작성시 입력한 비밀번호를 입력해 주세요", btnKind="", replyTotal=0;
			
			$(function(){
				let animalId = ${detail.animalId };
				listAll(animalId);
				/*글 입력을 위한 Ajax 연동 처리 */
				$(document).on("click", "#adoptionInsertBtn", function(){
					let insertUrl = "/adoption/adoptionInsert";
					
					let value = JSON.stringify({
						animalId:animalId,
						adoptionTitle:$("#adoptionTitle").val(),
						adoptionPasswd:$("#adoptionPasswd").val(),
						adoptionContent:$("#adoptionContent").val()
					});
					
					$.ajax({
						url : insertUrl,
						type : "post",
						headers : {
							"Content-Type" : "application/json"
						},
						dataType:"text",
						data : value,
						error: function(xhr, textStatus, errorThrown) {
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown +")");
						},
						beforeSend: function(){
							if(!checkForm("#adoptionTitle", "작성자를"))  return false;
							else if (!checkForm("#adoptionPasswd", "비밀번호를")) return false;
							else if (!checkForm("#adoptionContent", "댓글내용을")) return false;
						},
						success : function(result) {
							if(result=="SUCCESS"){
								alert("댓글 등록이 완료되었습니다");
								dataReset();
								listAll(animalId);
							}
						}
					});
				});
				
				//비밀번호 확인 없이 수정버튼 제어
				$(document).on("click", "button[data-btn='upBtn']", function(){
					let card = $(this).parents("div.card")
					let adoptionId = card.attr("data-num");
					updateForm(adoptionId, card);
				});
				
				//수정하기 클릭시 동적으로 생성된 "취소"버튼 이벤트 처리
				$(document).on("click", ".resetBtn", function(){
					dataReset();
				});
				
				//수정을 위한 Ajax 연동 처리
				$(document).on("click", "#adoptionUpdateBtn", function(){
					let adoptionId = $(this).attr("data-rnum");
					$.ajax({
						url:'/adoption/'+adoptionId,
						type:'put',
						headers: {
							"Content-Type": "application/json",
							"X-HTTP-Method-Override": "PUT"
						},
						data:JSON.stringify({
							adoptionContent:$("#adoptionContent").val(),
							adoptionPasswd:$("#adoptionPasswd").val()
						}),
						dataType:'text',
						error: function(xhr, textStatus, errorThrown) {
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
						},
						beforeSend: function() {
							if(!checkForm("#adoptionContent", "댓글내용을")) return false;
						},
						success:function(result){
							console.log("result : " + result);
							if(result == "SUCCESS"){
								alert("댓글 수정이 완료되었습니다");
								dataReset();
								listAll(animalId);
							}
						}
					});
				});
				
				//비민번호 확인 없이 삭제 버튼 제어 
				$(document).on("click", "button[data-btn='delBtn']", function(){
					let adoptionId = $(this).parents("div.card").attr("data-num");
					deleteBtn(animalId, adoptionId);
				});
			});

			//댓글 목록 보여주는 함수
			function listAll(animalId) {
				$(".adoption").detach();
				let url = "/adoption/all/" + animalId;
				$.getJSON(url, function(data) {
					$(data).each(function(index){
						let adoptionId = this.adoptionId;
						let adoptionTitle = this.adoptionTitle;
						let adoptionContent = this.adoptionContent;
						let adoptionDate = this.adoptionDate;
						adoptionContent =adoptionContent.replace(/(\r\n|\r|\n)/g, "<br/>");
						
						//$('#reviewList').append(replyNumber + replyName + replyContent + replyDate + "<br/>")
						template(adoptionId, adoptionTitle, adoptionContent, adoptionDate)
					});
				}).fail(function(){
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요");
				});
			}
			
			function template(adoptionId, adoptionTitle, adoptionContent, adoptionDate) {
				let $div = $('#reviewList');
				
				let $element = $('#item-template').clone().removeAttr('id');
				$element.attr("data-num", adoptionId);
				$element.addClass("adoption");
				$element.find('.card-header .name').html(adoptionTitle);
				$element.find('.card-header .date').html(" / " + adoptionDate);
				$element.find('.card-body .card-text').html(adoptionContent);
				
				$div.append($element);
			}
			
			//입력폼 초기화
			function dataReset() {
				$("#adoptionForm").each(function(){
					this.reset();
				});
				
				$("#adoptionId").prop("readonly", false);
				$("#adoptionForm button[type='button']").removeAttr("data-rnum");
				$("#adoptionForm button[type='button']").attr("id", "adoptionInsertBtn");
				$("#adoptionForm button[type='button'].sendBtn").html("저장");
				$("#adoptionForm button[type='button'].resetBtn").detach();
			}
			
			//수정 폼 화면 구현 함수
			function updateForm(adoptionId, card) {
				$("#adoptionForm .resetBtn").detach();
				
				$("#adoptionId").val(card.find(".card-header .name").html());
				$("#adoptionId").prop("readonly", true);
				
				let content = card.find(".card-text").html();
				content = content.replace(/(<br>|<br\/>|<br\/>)/g, '\r\n');
				$("#adoptionContent").val(content);
				
				$("#adoptionForm button[type='button']").attr("id", "adoptionUpdateBtn");
				$("#adoptionForm button[type='button']").attr("data-rnum", adoptionId);
				$("#adoptionForm button[type='button']").html("수정");
				
				let resetButton = $("<button type='button' class='btn btn-primary col-sm-1 resetBtn'>");
				resetButton.html("취소");
				$("#adoptionForm .sendBtn").after(resetButton);
			}
			
			//삭제하기 구현
			function deleteBtn(animalId, adoptionId) {
				if(confirm("선택하신 댓글을 삭제하시겠습니까?")) {
					$.ajax({
						url:'/adoption/' + adoptionId,
						type : 'delete',
						headers : {
							"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : 'text',
						error: function(xhr, textStatus, errorThrown) {
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
						},
						success : function(result) {
							console.log("result : " + result);
							if(result == 'SUCCESS') {
								alert("댓글 삭제가 완료되었습니다");
								listAll(animalId);
							}	
						}
					});
				}
			}
		</script>
	</body>
</html>