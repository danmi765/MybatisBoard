package com.hkb.serviceimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hkb.dto.MemberBean;
import com.hkb.service.MemberService;

@Repository
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberBean loginCheck(MemberBean fromview){
		return sqlSession.selectOne("member.loginCheck", fromview);
	}

	@Override
	public void joinMember(MemberBean mb) {
		sqlSession.insert("member.joinMember",mb);
	}

	@Override
	public MemberBean getMemberByUserid(MemberBean mb) {
		return sqlSession.selectOne("member.getMemberByUserid",mb);
	}

	@Override
	public void updateMember(MemberBean mb) {
		sqlSession.update("member.updateMember", mb);
	}

	@Override
	public void updateMemberPassword(MemberBean mb) {
		sqlSession.update("member.updateMemberPassword", mb);
	}
}
