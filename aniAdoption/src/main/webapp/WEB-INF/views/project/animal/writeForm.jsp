<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<body>
    <div class="container">
        <div class="text-center">
            <h3>게시판 입력화면</h3>
        </div>
        <form id="f_writeForm">
            <div class="mb-3 row">
                <label for="animalName" class="col-sm-2 col-form-label">동물 이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="animalName"
                        name="animalName" placeholder="동물이름을 입력하세요."
                        data-type="CDATA">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalSpecies" class="col-sm-2 col-form-label">분류</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="animalSpecies"
                        name="animalSpecies" placeholder="분류를 적어주세요">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalGender" class="col-sm-2 col-form-label">성별</label>
                <div class="col-sm-10">
                    <textarea name="animalGender" id="animalGender"
                        class="form-control" rows="1"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalKg" class="col-sm-2 col-form-label">무게</label>
                <div class="col-sm-10">
                    <textarea name="animalKg" id="animalKg"
                        class="form-control" rows="1"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalAge" class="col-sm-2 col-form-label">나이</label>
                <div class="col-sm-10">
                    <textarea name="animalAge" id="animalAge"
                        class="form-control" rows="1"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalColor" class="col-sm-2 col-form-label">색깔</label>
                <div class="col-sm-10">
                    <textarea name="animalColor" id="animalColor"
                        class="form-control" rows="1"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalStatus" class="col-sm-2 col-form-label">중성화 유무</label>
                <div class="col-sm-10">
                    <textarea name="animalStatus" id="animalStatus"
                        class="form-control" rows="1"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalMemo" class="col-sm-2 col-form-label">특이 사항</label>
                <div class="col-sm-10">
                    <textarea name="animalMemo" id="animalMemo"
                        class="form-control" rows="1"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalTemp" class="col-sm-2 col-form-label">임시보호 유무</label>
                <div class="col-sm-10">
                    <select name="animalTemp" id="animalTemp" class="form-control">
                    	<option>1.입양 가능</option>
                    	<option>2.임시 보호</option>
                    	<option>3.치료 중</option>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="animalPasswd" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="animalPasswd"
                        name="animalPasswd" placeholder="비밀번호를 입력하세요." maxlength="16">
                </div>
            </div>
             <div class="mb-3 row">
                <label for="file" class="col-sm-2 col-form-label">첨부파일</label>
                <div class="col-sm-10">
                    <input type="file" class="form-control" id="file" name="file" >
                </div>
            </div>      
        </form>
        <div class="text-end">
                <button type="button" class="btn btn-primary" id="animalInsertBtn">저장</button>
                <button type="button" class="btn btn-secondary" id="animalCancelBtn">취소</button>
                <button type="button" class="btn btn-success" id="animalListBtn">목록</button>
        </div>
    </div>
    <script src="/resources/include/js/writeForm.js"></script>
    <script>
    $(function(){
    	let errorMsg = "${errorMsg}";
    	if(errorMsg != "") {
    		alert(errorMsg);
    		errorMsg ="";
    	}
    });
    </script>
</body>
