package kr.kina.domain;

import java.io.Serializable;

public class MemberVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String address;
	private int infoEmail;
	private int infoSMS;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getInfoEmail() {
		return infoEmail;
	}
	public void setInfoEmail(int infoEmail) {
		this.infoEmail = infoEmail;
	}
	public int getInfoSMS() {
		return infoSMS;
	}
	public void setInfoSMS(int infoSMS) {
		this.infoSMS = infoSMS;
	}
}
