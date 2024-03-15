package com.spring.adoption.service;

import java.util.List;

import com.spring.adoption.vo.AdoptionVO;
import com.spring.animal.vo.AnimalVO;


public interface AdoptionService {
	public List<AdoptionVO> adoptionList(AdoptionVO advo);
	public int adoptionInsert(AdoptionVO advo);
	
	public int adoptionUpdate(AdoptionVO advo);
	public int adoptionDelete(AdoptionVO advo);
}
