package com.spring.adoption.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.adoption.vo.AdoptionVO;
import com.spring.animal.vo.AnimalVO;


@Mapper
public interface AdoptionDAO {
	public List<AdoptionVO> adoptionList(AdoptionVO advo);
	public int adoptionInsert(AdoptionVO advo);
	
	public int adoptionUpdate(AdoptionVO advo);
	public int adoptionDelete(AdoptionVO advo);
	public int adoptionChoiceDelete(int adoptionId);
	public int adoptionCount(int adoptionId);
	
	
}
