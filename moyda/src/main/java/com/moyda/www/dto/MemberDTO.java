package com.moyda.www.dto;

public class MemberDTO {
	  private String email;
	  private String password;
	  private String name;
		
	  // getter, setter, 생성자, toString()
		
	  //생성자
	  public MemberDTO() {
	    super();
	    // TODO Auto-generated constructor stub
	  }
	  public MemberDTO(String email, String password, String name) {
	    super();
	    this.email = email;
	    this.password = password;
	    this.name = name;
	  }
		
	  // getter, setter
	  public String getemail() {
	    return email;
	  }
	  public void setemail(String email) {
	    this.email = email;
	  }
	  public String getPassword() {
	    return password;
	  }
	  public void setPassword(String password) {
	    this.password = password;
	  }
	  public String getName() {
	    return name;
	  }
	  public void setName(String name) {
	    this.name = name;
	  }
		
	  // toString()
	  @Override
	  public String toString() {
	    return "MemberDTO [email=" + email + ", password=" + password + ", name=" + name + "]";
	  }
	}