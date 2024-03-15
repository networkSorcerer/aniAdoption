<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<body>
	<div class="container">
		<div class="text-center"><h3>동물 리스트 상세 목록</h3></div>
		
		<form name="f_data" id="f_data">
			<input type="hidden" name="animalId" value="${detail.animalId }"/>
			<input type="hidden" name="animalFile" id="animalFile" value="${detail.animalFile}"/>
		</form>
		
		
		<div class="row text-center mb_2">
			<div id="pwdChk" class="col-md-9 text-start">	
				<form name="f_passwdCheck" id="f_passwdCheck" class="row g-3">
					<input type="hidden" name="animalId" value="${detail.animalId }"/>
					<div class="col-auto">
						<label for="animalPasswd" class="visually-hidden">비밀번호</label>
						<input type="password" class="form-control" name="animalPasswd" id="animalPasswd" placeholder="비밀번호 입력" />
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-secondary btn-sm" id="passwdBtn">확인</button>
						<button type="button" class="btn btn-secondary btn-sm" id="passwdCancelBtn">취소</button>
					</div>
					<div class="col-auto">
						<span id="message" class="align-middle"></span>
					</div>
				</form>				
			</div>
			

			<div class="col-md-10 text-end">
				<button type="button" id="updateFormBtn" class="btn btn-success btn-sm">글수정</button>
				<button type="button" id="DeleteBtn" class="btn btn-success btn-sm">글삭제</button>
				<button type="button" id="insertFormBtn" class="btn btn-success btn-sm">글쓰기</button>
				<button type="button" id="animalListBtn" class="btn btn-success btn-sm">목록</button>
			</div>
		</div>
		
		<div class="text-center">
			<table class="table table-bordered">
				<thead>
					<tr>
						
						<td class="col_3">동물 ID</td>
						<td>${detail.animalId }(조회수 : ${detail.readcnt })</td>
						<td>작성일</td>
						<td>${detail.animalRegist}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
							<table class="table mb-0">
								
								<tr>
									<c:if test="${not empty detail.animalFile }">		
										<td class="text-start" rowspan="9">
											<img src="/uploadStorage/animal/${detail.animalFile }" class="rounded" width="300px"/>
										</td>		
									</c:if>
									<td class="col-3">이름</td>
									<td class="text-start">${detail.animalName }</td>
								</tr>
								<tr>
									<td>분류</td>
									<td class="text-start">${detail.animalSpecies }</td>
								</tr>
								<tr>
									<td>성별</td>
									<td class="text-start">${detail.animalGender }</td>
								</tr>
								<tr>
									<td>무게</td>
									<td class="text-start">${detail.animalKg }</td>
								</tr>
								<tr>
									<td>나이</td>
									<td class="text-start">${detail.animalAge }</td>
								</tr>
								<tr>
									<td>색깔</td>
									<td class="text-start">${detail.animalColor }</td>
								</tr>
								<tr>
									<td>중성화 유무</td>
									<td class="text-start">${detail.animalStatus }</td>
								</tr>
								<tr>
									<td>특이사항</td>
									<td class="text-start">${detail.animalMemo }</td>
								</tr>
								<tr>
									<td>임시보호 유무</td>
									<td class="text-start">${detail.animalTemp }</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<jsp:include page="adoption.jsp" />		
	</div>
	<script src="/resources/include/js/animalDetail.js"></script>		
</body>
</html>