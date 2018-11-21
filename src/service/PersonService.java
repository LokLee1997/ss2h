package service;

import java.util.List;
import po.Person;

public interface PersonService {
	public void addPerson(Person person);
	public boolean checkPersonByName(String username);
	public boolean checkPerson(Person person);
	public boolean isPhoneEmpty(String phone);
	public boolean isEmailEmpty(String email);
	
}
