package com.its.member.controller;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.MemberDTO;

import com.its.member.dto.PageDTO;
import com.its.member.service.BoardService;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/member")
public class MemberController {

 @Autowired
  private MemberService memberService;
 @Autowired
 private  BoardService boardService;
   @GetMapping("/save")
    //회원가입 화면
     public String saveForm(){return "memberPages/save";}

    @PostMapping("/save")
    //회원가입 처리
    public  String save(@ModelAttribute MemberDTO memberDTO) throws IOException{
       memberService.save(memberDTO);
        return "memberPages/login";
    }
    @PostMapping("/duplicate-check")
    // 아이디 중복처리
    public @ResponseBody String duplicateCheck(@RequestParam("memberId")String memberId){
        String checkResult=memberService.duplicateCheck(memberId);
        return  checkResult;
    }


    @GetMapping("/login")
    //로그인화면 구현
    public String loginForm(){return "memberPages/login";}

    @PostMapping("/login")
    // 로그인 처리 구현
    public  String login(@ModelAttribute MemberDTO memberDTO, Model model ,HttpSession session){
       MemberDTO loginMember= memberService.login(memberDTO);
       if(loginMember != null){
            model.addAttribute("loginMember",loginMember);
            session.setAttribute("loginMemberId",loginMember.getMemberId());
           session.setAttribute("loginId", loginMember.getId());

           return "boardPages/PagingList";
       }else {
           return  "memberPages/login";
       }


    }





    }


