package com.its.member.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
  private   Long id;
  private  Long boardId;
  private  String commentWriter;
  private Timestamp commentCreatedDate;

}
