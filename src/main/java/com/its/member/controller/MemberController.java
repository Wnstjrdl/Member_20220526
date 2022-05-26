package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/member")
@Controller
public class MemberController {
 @Autowired
  private MemberService memberService;

   @GetMapping
    //회원가입 화면
     public String saveForm(){return "memberPages/save";}

    @PostMapping("save")
    //회원가입 처리
    public  String save(@RequestParam MemberDTO memberDTO){
        boolean saveResult = memberService.save(memberDTO);
        if(saveResult){
            return  "login";
        }else{
            return  "savefail";
        }
    }





}

