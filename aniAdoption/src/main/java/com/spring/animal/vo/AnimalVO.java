package com.spring.animal.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.admin.vo.AdminVO;
import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class AnimalVO extends CommonVO { 
	private int animalId =0;
	private String animalSpecies="";
	private String animalAge="";
	private String animalGender="";
	private String animalStatus="";
	private String animalKg="";
	private String animalColor="";
	private String animalMemo="";
	private String animalTemp;
	private String animalRegist;
	private String animalName="";
	private String animalPasswd="";
	private int readcnt=0;
	
	private MultipartFile file;
	private String animalFile = "";
	
	private AdminVO admin;
}
