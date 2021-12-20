package com.reserve.restaruant.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder

public class User {

   private Long userNo;
   private String email;
   private String userId;
   private String userPw;
   private String userName;
   private String userTel;
   private String userGrade;
   private Date userDate;
   private String birthDay;
   private int state;
   private Long point;
   private String adNo;
   private String adId;
}