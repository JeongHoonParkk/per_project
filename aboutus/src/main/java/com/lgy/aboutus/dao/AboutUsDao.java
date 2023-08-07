package com.lgy.aboutus.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.aboutus.dto.BoardDto;
import com.lgy.aboutus.dto.MemberDto;

public interface AboutUsDao {
//	로그인
	public MemberDto login(HashMap<String, String> param);
//	회원가입
	public void register(HashMap<String, String> param);
//	계정유무
	public int idCheck(HashMap<String, String> param);

	
//	글작성
	public void write(HashMap<String, String> param);
//	글 불러오기
	public ArrayList<BoardDto> contentList(HashMap<String, String> param);
//	글수정
	public void update(HashMap<String, String> param);
//	글삭제
	public void delete(HashMap<String, String> param);
}
