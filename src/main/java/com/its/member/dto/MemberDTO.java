package com.its.member.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberDTO {
   private Long id;
   private String memberId;
   private String memberPassword;
   private String memberName;
   private String memberEmail;
   private String memberMobile;
   private MultipartFile boardFile;
   private String boardFileName;

}
