<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<body>
  <div class="container">
    <div class = "text-center"><h1>게시판 수정 화면</h1></div>
    <form action="/update" method="post" id="f_updateForm">
    	<input type="hidden" name="animalId" value="${updateData.animalId }" id="animalId">
    	<input type="hidden" name="animalFile" name="animalFile" value="${updateData.animalFile }"/>
      		<div class ="text-center">
      		<table class="table table-striped">
      			<thead>
        		<tr>
          			<td class="col-3">글번호</td>
          			<td class="col-3">${updateData.animalId }<span>(조회수: ${updateData.readcnt })</span></td>
          			<th >작성일</th>
          			<td >${updateData.animalRegist }</td>
        		</tr>
        		</thead>
        		<tbody>
        		<tr>
        			<td colspan="4">
        			<table class="table mb-0">
		        <tr>
		          	<td class="col-3">동물 이름</td>
		          	<td class="text-start">
		          	<input type="text" value="${updateData.animalName }" class="form-control" id="animalName"
                        name="animalName" placeholder="동물이름을 입력하세요."
                        data-type="CDATA"> 
                    </td>
		        </tr>
		        <tr>
		          	<th class="col-md-1">분류</th>
		          	<td class="text-start">
		          	<input type="text" name="animalSpecies" id="animalSpecies" value="${updateData.animalSpecies }" class="form-control"></td>
		        </tr>
		        <tr>
		          	<th>성별</th>
		          	<td class="text-start">
		            <textarea name="animalGender" id="animalGender"  class="form-control">${updateData.animalGender }</textarea>
		          	</td>
		        </tr>
		        <tr>
		          	<th>무게</th>
		          	<td class="text-start">
		            <textarea name="animalKg" id="animalKg"  class="form-control">${updateData.animalKg }</textarea>
		          	</td>
		        </tr>
		        <tr>
		          	<th>나이</th>
		          	<td class="text-start">
		            <textarea name="animalAge" id="animalAge"  class="form-control">${updateData.animalAge }</textarea>
		          	</td>
		        </tr>
		        <tr>
		          	<th>색깔</th>
		          	<td class="text-start">
		            <textarea name="animalColor" id="animalColor"  class="form-control">${updateData.animalColor }</textarea>
		          	</td>
		        </tr><tr>
		          	<th>중성화 유무</th>
		          	<td class="text-start">
		            <textarea name="animalStatus" id="animalStatus"  class="form-control">${updateData.animalStatus }</textarea>
		          	</td>
		        </tr>
		        <tr>
		          	<th>특이 사항</th>
		          	<td class="text-start">
		            <textarea name="animalMemo" id="animalMemo"  class="form-control">${updateData.animalMemo }</textarea>
		          	</td>
		        </tr>
		        <tr>
		          	<th>임시보호 유무</th>
		          	<td class="text-start">
		            <select name="animalTemp" id="animalTemp" class="form-control">
                    	<option>1.입양 가능</option>
                    	<option>2.임시 보호</option>
                    	<option>3.치료 중</option>
                    </select>
		          	</td>
		        </tr>
		        <tr>
		          	<th>비밀번호</th>
		          	<td class="text-start">
		          	<input type="password" name="animalPasswd" id="animalPasswd"
		          	class="form-control" placeholder="기존의 비밀번호가 아니라 수정할 비밀번호를 입력해 주세요"></td>
		      	
		        </tr>
		        <tr>
		          	<th>이미지 파일첨부</th>
		          	<td class="text-start">
		          		<input type="file" name="file" id="file"class="form-control">
		          	</td>
		        </tr>
		      </table>
		   </td>
		   </tr>
		</tbody>
		</table>
		</div>
    </form>
    <div class="text-end">
    	<button type="button" id="animalUpdateBtn" class="btn btn-success btn-sm">수정</button>
    	<button type="button" id="animalCancelBtn" class="btn btn-success btn-sm">취소</button>
    	<button type="button" id="animalListBtn" class="btn btn-success btn-sm">목록</button>
    </div>
  </div>
  <script src="/resources/include/js/updateForm.js"></script>
</body>
</html>