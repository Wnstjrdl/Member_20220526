package com.its.member.controller;

import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/member")
@Controller
public class MemberController {
 @Autowired
  private MemberService memberService;
    @GetMapping("save")
     public String saveForm(){return "memberPages/save";}
}
