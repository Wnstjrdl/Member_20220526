package com.its.member.controller;

import com.its.member.dto.MemberDTO;

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


    @GetMapping("/save")
    //회원가입 화면
    public String saveForm() {
        return "memberPages/save";
    }

    @PostMapping("/save")
    //회원가입 처리
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "memberPages/login";
    }

    @PostMapping("/duplicate-check")
    // 아이디 중복처리
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult;
    }


    @GetMapping("/login")
    //로그인화면 구현
    public String loginForm() {
        return "memberPages/login";
    }

    @PostMapping("/login")
    // 로그인 처리 구현
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        System.out.println("memberDTO = " + memberDTO);
        MemberDTO loginMember = memberService.login(memberDTO);
        System.out.println("loginMember = " + loginMember);
        if (loginMember != null) {
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());

            return "redirect:/board/paging";
        } else {
            return "memberPages/login";
        }

    }

    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    // 회원목록 조회
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "memberPages/admin";
    }

    //회원 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        memberService.delete(id);
        return "redirect:/member/findAll";
    }


    @GetMapping("/detail")
    //마이페이지
    public   String findById(@RequestParam("id") Long id, Model model) {
        System.out.println("id = " + id);

        MemberDTO memberDTO = memberService.findById(id);

        model.addAttribute("member", memberDTO);

        return "memberPages/myPages";
    }
    //비밀번호 체크
    @GetMapping("/passwordCheck")
    public String passwordCheck(@RequestParam("id") Long id,Model model){
        MemberDTO memberDTO= memberService.findById(id);
        model.addAttribute("member",memberDTO);
        return "memberPages/passwordCheck";
    }
    //수정화면
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO= memberService.findById(id);
        model.addAttribute("memberUpdate",memberDTO);
        return  "memberPages/update";
    }
    //수정처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        memberService.update(memberDTO);
        return  "redirect:/member/detail?id="+memberDTO.getId();
    }
}

