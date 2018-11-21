package action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;



import po.Person;
import service.PersonService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class PersonAction extends ActionSupport {
	@Resource  PersonService personService;
	private String name_result;
	private String phone_result;
	private String email_result;
	private String login_result;
	private List<Person> persons;
	Person person;
	private String username;
	private String password;
	private String phone;
	private String email;
	private String address;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Person> getPersons() {
		return persons;
	}
	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public String getName_result() {
		return name_result;
	}
	public void setName_result(String name_result) {
		this.name_result = name_result;
	}
	public String getPhone_result() {
		return phone_result;
	}
	public void setPhone_result(String phone_result) {
		this.phone_result = phone_result;
	}
	public String getEmail_result() {
		return email_result;
	}
	public void setEmail_result(String email_result) {
		this.email_result = email_result;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLogin_result() {
		return login_result;
	}
	public void setLogin_result(String login_result) {
		this.login_result = login_result;
	}
	
	
	
	public String list(){
		return "list";
	}
	
	public String checklogin(){
		Person person=new Person();
		person.setUsername(username);
		person.setPassword(password);
		boolean login = personService.checkPerson(person);
		if (login) {
			this.login_result="true";
			Map attibutes= ActionContext.getContext().getSession();
			attibutes.put("username",username);
		}else {
			this.login_result="false";
		}
		return SUCCESS;
	}
	public String login(){
		if(username.equals("admin")){
		return "login_success";
		}else {
			return "login_exit";
		}
		}
	public String exit(){
		ActionContext.getContext().getSession().clear();
		return "login_exit";
	}
	public String addPerson(){
		boolean name = personService.checkPersonByName(username);
		if (username!=""&&username!=null&&name==false) {
			Person person = new Person();
			person.setUsername(username);
			person.setPassword(password);
			person.setAddress(address);
			person.setPhone(phone);
			person.setEmail(email);
			personService.addPerson(person);
			return "index";
		}
		return "register";
	}

	public String checkUsername(){
		boolean flag = personService.checkPersonByName(this.username);
		if (flag==true) {
			this.name_result = "true";
		}else {
			this.name_result = "false";
		}
		return SUCCESS;
	}
	public String checkPhone(){
		boolean phone = personService.isPhoneEmpty(this.phone);
		if (phone==true) {
			this.phone_result = "true";
		}else {
			this.phone_result = "false";
		}
		return SUCCESS;
	}
	public String checkEmail(){
		boolean email = personService.isEmailEmpty(this.email);
		if (email==true) {
			this.email_result = "true";
		}else {
			this.email_result = "false";
		}
		return SUCCESS;
	}
	
}
