package com.its.member.service;

import com.its.member.dto.MemberDTO;
import com.its.member.dto.PageDTO;
import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberFile=memberDTO.getMemberFile();
        String memberFileName= memberFile.getOriginalFilename();
        memberFileName=System.currentTimeMillis()+""+memberFileName;
        memberDTO.setMemberFileName(memberFileName);
        String savePath= "D:\\spring_img\\"+memberFileName;

        if(!memberFile.isEmpty()){
            memberFile.transferTo(new File(savePath));
        }
        memberRepository.save(memberDTO);
    }


    public String duplicateCheck(String memberId) {
        String checkResult= memberRepository.duplicateCheck(memberId);
        if(checkResult == null){
            return "ok";
        }else{
            return  "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
       MemberDTO loginMember= memberRepository.login(memberDTO);
       return  loginMember;
    }


    public List<MemberDTO> findAll() {return memberRepository.findAll();
    }

    public void delete(Long id) {memberRepository.delete(id);}


    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }
}
