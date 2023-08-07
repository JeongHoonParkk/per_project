package com.lgy.aboutus.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.aboutus.dao.AboutUsDao;
import com.lgy.aboutus.dto.BoardDto;
import com.lgy.aboutus.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Service("MemberService")
@Slf4j
public class AboutUsServiceImpl implements AboutUsService {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	//로그인
	public MemberDto login(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.login() start");
		AboutUsDao dao = sqlSession.getMapper(AboutUsDao.class);
		MemberDto dto = dao.login(param);
		return dto;
	}

	@Override
	//회원가입
	public void regitser(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.regitser() start");
		AboutUsDao dao = sqlSession.getMapper(AboutUsDao.class);
		dao.register(param);
	}

	@Override
	//계정유무
	public int idCheck(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.idCheck() start");
		AboutUsDao dao = sqlSession.getMapper(AboutUsDao.class);
		int result = dao.idCheck(param);
		return result;
	}

	@Override
	//글작성
	public void write(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.write() start");
		AboutUsDao dao = sqlSession.getMapper(AboutUsDao.class);
		dao.write(param);
	}

	@Override
	//글 불러오기
	public ArrayList<BoardDto> contentList(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.contentList() start");
		AboutUsDao dao = sqlSession.getMapper(AboutUsDao.class);
		ArrayList<BoardDto> list = dao.contentList(param);
		return list;
	}
	
	@Override
	public void update(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.contentList() start");
		AboutUsDao dao = sqlSession.getMapper(AboutUsDao.class);
		dao.update(param);
	}

	@Override
	public void delete(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.delete() start");
		AboutUsDao dao = sqlSession.getMapper(AboutUsDao.class);
		dao.delete(param);
	}
}
