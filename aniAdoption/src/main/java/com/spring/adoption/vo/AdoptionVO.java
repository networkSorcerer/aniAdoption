package com.spring.adoption.vo;

import lombok.Data;

@Data
public class AdoptionVO{ 
	private int    adoptionId     = 0;  //댓글번호
	private int    animalId     = 0;  //게시판 글번호
	private String adoptionTitle       = ""; //댓글 작성자  
	private String adoptionContent    = ""; //댓글 내용 
	private String adoptionDate       = ""; //댓글 작성일 
	private String adoptionPasswd     = ""; //댓글 비밀번호 
	private String adoptionStatus 	="";
	private String adminId ="";
	private String adoptionLevel ="";
	

}