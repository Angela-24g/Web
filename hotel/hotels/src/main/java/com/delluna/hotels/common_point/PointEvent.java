package com.delluna.hotels.common_point;

import java.sql.Date;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.common_reservation.Reservation;

public class PointEvent {
   
   private int no;
   private Reservation reservation_no ;
   private Member member_no;
   private int state;
   private int amount;
   private Date trans_date;
   private Date expire_date;
   
   public Reservation getReservation_no() {
      return reservation_no;
   }
   public void setReservation_no(Reservation reservation_no) {
      this.reservation_no = reservation_no;
   }
   public Date getExpire_date() {
      return expire_date;
   }
   public void setExpire_date(Date expire_date) {
      this.expire_date = expire_date;
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public Member getMember_no() {
      return member_no;
   }
   public void setMember_no(Member member_no) {
      this.member_no = member_no;
   }
   public int getState() {
      return state;
   }
   public void setState(int state) {
      this.state = state;
   }
   public int getAmount() {
      return amount;
   }
   public void setAmount(int amount) {
      this.amount = amount;
   }
   public Date getTrans_date() {
      return trans_date;
   }
   public void setTrans_date(Date trans_date) {
      this.trans_date = trans_date;
   }
   
   
}