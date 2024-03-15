package com.spring.animal.service;

import java.util.List;

import com.spring.animal.vo.AnimalVO;


public interface AnimalService {
	public List<AnimalVO> animalList(AnimalVO avo);
	
	public int animalListCnt(AnimalVO avo);
	public AnimalVO animalDetail(AnimalVO avo); 
	public int pwdConfirm(AnimalVO avo);
	public AnimalVO updateForm(AnimalVO bvo);
	
	
	
	public int animalInsert(AnimalVO avo) throws Exception;
	public int animalUpdate(AnimalVO avo) throws Exception; 
	public int animalDelete(AnimalVO avo) throws Exception; 
	//board테이블의 전체 레코드 수
}
