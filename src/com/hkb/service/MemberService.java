package com.hkb.service;

import com.hkb.dto.MemberBean;

public interface MemberService {

	public MemberBean loginCheck(MemberBean fromview);
	public void joinMember(MemberBean mb);
	public MemberBean getMemberByUserid(MemberBean mb);
	public void updateMember(MemberBean mb);
	public void updateMemberPassword(MemberBean mb);
}
