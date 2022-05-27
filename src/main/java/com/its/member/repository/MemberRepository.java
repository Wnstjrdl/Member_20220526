package com.its.member.repository;

import com.its.member.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(MemberDTO memberDTO) {return sql.insert("Member.save",memberDTO); }


    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicate",memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) {return sql.selectOne("Member.login",memberDTO);}
}

