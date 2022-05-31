package com.its.member.repository;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {


    @Autowired
    private SqlSessionTemplate sql;

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }


    public void save(BoardDTO boardDTO) {
        sql.insert("Board.save", boardDTO);
    }


    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }


    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public List<BoardDTO> search(Map<String, String> searchParam) {
      return sql.selectList("Board.search", searchParam);}
}
