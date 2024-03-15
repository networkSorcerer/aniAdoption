<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>

<body>
	<div class ="container">
		<div class="text-center"><h3>동물 리스트</h3></div>
		
		<form id="detailForm">
			<input type="hidden" id="animalId" name="animalId"/>
		</form>
		
		<div id="animalSearch">
		    <form id="f_search" name="f_search">
		        <div class="row g-2 align-items-center">
		            <label for="search">검색조건</label>
		        </div>
		        <div class="col-auto">
		            <select id="search" name="search" class="form-select form-select-sm" >
		                <option value="all">전체 목록 조회</option>
		                <option value="animal_id">동물 ID</option>
		                <option value="animal_name">이름</option>
		                <option value="animal_species">분류</option>
		                <option value="animal_temp">임시 보호 유무</option>
		            </select>
		        </div>
		        <div class="col-auto">
		            <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control form-control-sm" />
		        </div>
		        <div class="col-auto">
		            <button type="button" id="searchData" class="btn btn-success btn-sm">검색</button>
		        </div>
		    </form>
		</div>

		
		<div id="animalSearch" class="text-right"></div>
		
		<div id="animalList">
			<table summary="게시판 리스트" class="table table-striped">
				<thead>
					<tr class="text-center">
						<th class="col-md-1">동물 ID</th>
						<th class="col-md-1">사진</th>
						<th class="col-md-1">이름</th>
						<th class="col-md-1">분류</th>
						<th class="col-md-1">무게</th>
						<th class="col-md-1">중성화 유무</th>
						<th class="col-md-1">성별</th>
						<th class="col-md-1">임시보호 유무</th>
						<th class="col-md-2">작성일</th>
						<th class="col-md-1">조회수</th>
					</tr>
				</thead>
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty animalList }">
							<c:forEach var="animal" items="${animalList }" varStatus="status">
								<tr class = "text-center id" data-num="${ animal.animalId}">
									
									<td>${animal.animalId}</td>
									<td>
										<c:if test="${not empty animal.animalFile }">
											<img src="/uploadStorage/animal/${animal.animalFile}"
											class="rounded w-50 h-50"/>
										</c:if>
										<c:if test="${empty animal.animalFile }">
											<img src="/resources/images/common/noimage.jpg"
											class="rounded w-100 h-100"/>
										</c:if>
									</td>
									<td class="goDetail text-start">
									${animal.animalName}
									</td>
									<td class="species">${animal.animalSpecies }</td>
									<td class="kg">${animal.animalKg }</td>
									<td class="status">${animal.animalStatus }</td>
									<td class="gender">${animal.animalGender }</td>
									<td class="temp0">${animal.animalTemp }</td>
									<td class="regist">${animal.animalRegist}</td>
									<td class ="readcnt">${animal.readcnt }</td>
									
							</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<td colspan="5" class ="text-center">등록된 게시물이 존재하지 않습니다</td>
						</tr>
						</c:otherwise>
					</c:choose>	
				</tbody>
			</table>
		</div>
		
		<div class = "text-end">
			<button type="button" id="insertFormBtn" class ="btn btn-success btn-sm">새로 등록 하기</button>
		</div>		
	</div>
	<script src="/resources/include/js/animalList.js"></script>
	<script>
		$(function(){
			/* 검색 후 검색 대상과 검색 단어 출력 */
			let word="<c:out value='${animalVO.keyword}' />";
			let value="";
			if(word!=""){
				$("#keyword").val("<c:out value='${animalVO.keyword}' />");
				$("#search").val("<c:out value='${animalVO.search}' />");
			
				if($("#search").val()!='animal_status'){
					//:contains()는 특정 텍스트를 포함한 요소반환 	
					if($("#search").val()=='animal_name') value = "#list tr td.goDetail";
					else if($("#search").val()=='animal_id') value="#list tr td.id";
					else if($("#search").val()=='animal_species')value="#list tr td.species"
					else if($("#search").val()=='animal_temp')value="#list tr td.temp"
					console.log($(value+":contains('"+word+"')").html());
					//$("#list tr td.goDetail:contains('노력')").html()  => <span class='required'>노력</span>에 대한 명언
			    	$(value+":contains('"+word+"')").each(function () {
						let regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
			    	});
				}
			}
		});	
</script>
</body>
