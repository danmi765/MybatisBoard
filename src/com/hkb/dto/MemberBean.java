package com.hkb.dto;

public class MemberBean {
	private String userid;
	private String userpsw;
	private String age;
	private String sex;
	private String joindate;
	private String username;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpsw() {
		return userpsw;
	}
	public void setUserpsw(String userpsw) {
		this.userpsw = userpsw;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "MemberBean [userid=" + userid + ", userpsw=" + userpsw + ", age=" + age + ", sex=" + sex
				+ ", joindate=" + joindate + ", username=" + username + ", getUserid()=" + getUserid()
				+ ", getUserpsw()=" + getUserpsw() + ", getAge()=" + getAge() + ", getSex()=" + getSex()
				+ ", getJoindate()=" + getJoindate() + ", getUsername()=" + getUsername() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
