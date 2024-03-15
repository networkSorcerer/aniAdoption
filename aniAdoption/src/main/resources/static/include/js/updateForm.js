$(function(){
	$("#animalUpdateBtn").on("click", function(){
		if(!chkData("#animalName","동물 이름을")) return;
		else if (!chkData("#animalSpecies", "뷴류를")) return;
		else if (!chkData("#animalGender", "성별을")) return;
		else if (!chkData("#animalKg", "무게를")) return;
		else if (!chkData("#animalAge", "나이를")) return;
		else if (!chkData("#animalColor", "색깔을")) return;
		else if (!chkData("#animalStatus", "중성화 유무를")) return;
		else if (!chkData("#animalMemo", "특이사항을")) return;
		else if (!chkData("#animalTemp", "임시보호유무를")) return;
		else if (!chkData("#animalPasswd", "비밀번호를")) return;
		else {
			if($("#file").val()!=""){
				if(!chkFile($("#file")))return;
			}
			$("#f_updateForm").attr({
				"method":"post",
				"enctype":"multipart/form-data",
				"action":"/animal/animalUpdate"
			});
			$("#f_updateForm").submit();
		}
	});
	
	$("#animalCancelBtn").on("click", function(){
		$("#f_updateForm").each(function(){
			this.reset();
		});
	});
	
	$("#animalListBtn").on("click", function(){
		location.href="/animal/animalList";
	});
});