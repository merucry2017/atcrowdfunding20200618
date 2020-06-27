package com.atcrowdfunding.manager.service;

import com.atcrowdfunding.bean.Member;

import java.util.Map;

public interface MemberService{
    Member queryMemberlogin(Map<String, Object> paramMap);
}
