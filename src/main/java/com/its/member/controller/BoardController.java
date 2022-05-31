package com.its.member.controller;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.MemberDTO;
import com.its.member.dto.PageDTO;
import com.its.member.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;


    @GetMapping("/save")
    // 게시글 화면 요청
    public String saveForm() {
        return "boardPages/save";
    }

    @PostMapping("/save")
    //게시글 작성처리
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/paging";
    }

    @GetMapping("/paging")
    //페이징 리스트목록
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "boardPages/pagingList";
    }

    @GetMapping("/detail")
    //상세조회
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        return "boardPages/detail";
    }
    // 글삭제처리
    @GetMapping("/delete")
    public String delete(@RequestParam("id")Long id){
        boardService.delete(id);
        return  "redirect:/board/paging";
    }

    //글목록 수정화면
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardUpdate", boardDTO);
        return "boardPages/update";
    }
    // 글목록 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "redirect:/board/detail?id="+boardDTO.getId();
    }
    @GetMapping("/search")
    public  String search(@RequestParam("searchType")String searchType,
                          @RequestParam("q")String q ,Model model ){
        List<BoardDTO> searchList=boardService.search(searchType,q);
        model.addAttribute("boardList",searchList);
        return  "boardPages/list";
    }
}
