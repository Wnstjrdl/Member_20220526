package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
 @Autowired
  private MemberService memberService;

   @GetMapping("/save")
    //회원가입 화면
     public String saveForm(){return "memberPages/save";}

    @PostMapping("/save")
    //회원가입 처리
    public  String save(@ModelAttribute MemberDTO memberDTO) throws IOException{
       memberService.save(memberDTO);
        return "redirect:/member/login";
    }
    @PostMapping("/duplicate-check")
    // 아이디 중복처리
    public @ResponseBody String duplicateCheck(@RequestParam("memberId")String memberId){
        String checkResult=memberService.duplicateCheck(memberId);
        return  checkResult;
    }
    @GetMapping("/login")
    public String loginForm(){return "memberPages/save";}



}

