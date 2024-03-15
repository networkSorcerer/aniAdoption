package com.spring.adoption.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.adoption.dao.AdoptionDAO;
import com.spring.adoption.vo.AdoptionVO;
import com.spring.animal.vo.AnimalVO;

import lombok.Setter;

@Service
public class AdoptionServiceImpl implements AdoptionService {
	
	@Setter(onMethod_= @Autowired)
	private AdoptionDAO adoptionDAO;
	
	//글목록 구현
	@Override
	public List<AdoptionVO> adoptionList(AdoptionVO advo) {
		List<AdoptionVO> list = null;
		list = adoptionDAO.adoptionList(advo);
		return list;
	}
	
	// 글입력 구현
	@Override
	public int adoptionInsert(AdoptionVO advo) {
		int result = 0;
		result = adoptionDAO.adoptionInsert(advo);
		return result;
	}
	
	//글삭제 구현
	public int adoptionDelete(AdoptionVO advo) {
		int result = 0;
		result = adoptionDAO.adoptionDelete(advo);
		return result;
	}
	
	//글 수정 구현 
	public int adoptionUpdate(AdoptionVO advo) {
		int result = 0;
		result = adoptionDAO.adoptionUpdate(advo);
		return result;
	}
	
}
