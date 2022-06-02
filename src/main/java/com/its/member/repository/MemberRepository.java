package com.its.member.repository;

import com.its.member.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(MemberDTO memberDTO) {return sql.insert("Member.save",memberDTO); }


    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicate",memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) {return sql.selectOne("Member.login",memberDTO);}

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public void delete(Long id) {sql.delete("Member.delete",id);
    }


    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    public void update(MemberDTO memberDTO) {sql.update("Member.update",memberDTO);

    }
}

