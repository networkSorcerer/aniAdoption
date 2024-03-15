let buttonCheck = 0;
$(function(){
	$("#pwdChk").css("visibility","hidden");
	
	let btnInit = function() {
		$("#message").removeClass("text-danger");
		$("#message").addClass("text-primary");
		$("#message").text("작성시 입력한 비밀번호를 입력해 주세요");
	}
	$("#updateFormBtn").on("click", ()=>{
		/*$("#f_data").attr({
			"method":"get",
			"action":"/board/updateForm"
		});
		$("#f_data").submit();*/
		$("#pwdChk").css("visibility", "visible");
		btnInit();
		buttonCheck ="updateButton";
	});
	
	
	//삭제 버튼 클릭시 처리 이벤트
	$("#DeleteBtn").on("click", () => {
    // 사용자에게 확인 메시지 보여주기
    const confirmDelete = confirm("등록된 동물을 삭제하면 공고도 함께 삭제됩니다. 정말로 삭제하시겠습니까?");

    // 확인이 true인 경우에만 삭제 진행
    if (confirmDelete) {
        $("#f_data").attr({
            "method": "post",
            "action": "/animal/animalDelete"
        });
        $("#f_data").submit();

        $("#pwdChk").css("visibility", "visible");
        btnInit();
        buttonCheck = "deleteButton";
    }
});

	
	//삭제 버튼 클릭시 댓글 확인 후 처리 이벤트
	/*$("#boardDeleteBtn").on("click", ()=> {
		$.ajax({
			url : "/board/replyCount",
			type : "post",
			data : "boardNumber=" + $("#boardNumber").val(),
			dataType : "text",
			error : function() {
				alert('시스템에 문제가 있어 잠시 후 다시 진행해 주세요');
			},
			success : function(resultData) {
				if(resultData==="0"){
					$("#pwdChk").css("visibility", "visible");
					btnInit();
					buttonCheck = "deleteButton";
				}else {
					alert("댓글 존재시 게시글을 삭제할 수 없습니다. \n댓글이 전부 삭제되어야 삭제 가능합니다");
					return;
				}
			}
		});
	});*/
	
	$("#animalPasswd").bind("keydown", function(event){
		if(event.keyCode === 13) {
			event.preventDefault();
		}
	});
	
	$("#animalPasswd").on("keyup", ()=>{
		btnInit();
	});
	
	$("#passwdCancelBtn").on("click", function(){
		$("#animalPasswd").val("");
		$("#pwdChk").css("visibility", "hidden");
		buttonCheck = "";
	});

	
	$("#passwdBtn").on("click", function(){
		$.ajax({
			url : "/animal/pwdConfirm",
			type : "post",
			data : $("#f_passwdCheck").serialize(),
			dataType : "text",
			error : function(){
				alert('시스템 오류입니다 . 관리자에게 문의 하세요');
			},
			beforeSend: function(){
				if(!dataCheck("#animalPasswd", "#message", "비밀번호를")) return false;
			},
			success : function(resultData) {
				if(resultData == "불일치") {
					$("#message").addClass("text-danger");
					$("#message").text("작성시 입력한 비밀번호가 일치하지 않습니다");
					$("#animalPasswd").select();
				}else if (resultData == "일치") {
					$("#message").text("");
					if(buttonCheck=="updateButton") {
						actionProcess("get", "/animal/updateForm");
					}else if (buttonCheck=="deleteButton") {
						if(confirm("정말 삭제하시겠습니까?")) {
							actionProcess("post", "/animal/animalDelete");
						}
					}
				}
			}
		});
	});
	
	$("#insertFormBtn").click(function(){
		location.href = "/animal/writeForm";
	});
	
	$("#animalListBtn").click(function(){
		location.href="/animal/animalList";
	});
})

function actionProcess(method, goUrl) {
	$("#f_data").attr({
		"method":method,
		"action":goUrl
	});
	$("#f_data").submit();
}