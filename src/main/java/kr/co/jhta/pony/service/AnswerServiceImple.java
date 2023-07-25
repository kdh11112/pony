package kr.co.jhta.pony.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.AnswerDAO;

@Service
public class AnswerServiceImple implements AnswerService{

	@Autowired
	private AnswerDAO dao;
	
	
}
