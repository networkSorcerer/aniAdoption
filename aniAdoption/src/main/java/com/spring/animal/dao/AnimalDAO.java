package com.spring.animal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.animal.vo.AnimalVO;


@Mapper
public interface AnimalDAO {
	public List<AnimalVO> animalList(AnimalVO avo);
	public int animalInsert(AnimalVO avo); 
	public AnimalVO animalDetail(AnimalVO avo);
	public int readCntUpdate(AnimalVO avo);
	public int pwdConfirm(AnimalVO avo); 
	public int animalUpdate(AnimalVO avo);
	public int animalDelete(AnimalVO avo);
	public int animalListCnt(AnimalVO avo);
	
	  
	
	 
	 
	
	  //board테이블의 전체 레코드 수
}
