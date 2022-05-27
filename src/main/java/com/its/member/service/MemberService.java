package com.its.member.service;

import com.its.member.dto.MemberDTO;
import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

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
}
