package model;

public class Users {
	private Long userID;
	private String userEmail;
	private String userPass;
	private String userRole;
	public Users(Long userID, String userEmail, String userPass, String userRole) {
		super();
		this.userID = userID;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userRole = userRole;
	}
	public Long getUserID() {
		return userID;
	}
	public void setUserID(Long userID) {
		this.userID = userID;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	 

}
