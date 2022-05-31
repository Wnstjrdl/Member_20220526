package com.its.member.dto;

import lombok.Data;

@Data
public class CommentDTO {
  private   Long id;
  private  String boardId;
  private  String commentWriter;
  private  String commentCreatedDate;

}
