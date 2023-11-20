package com.myspring.kmpetition.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component("memberVO")
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private Date lastlogin;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(Date lastlogin) {
		this.lastlogin = lastlogin;
	}
	
	
	
}
