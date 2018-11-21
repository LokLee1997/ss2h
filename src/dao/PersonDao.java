package dao;

import java.util.List;

import po.Person;

public interface PersonDao {
	public void saveOrUpdatePerson(Person person);
	public List<Person> getPersonByNameAndPass(Person person);
	public List<Person> getPersonByName(String username);
	public List<Person> getPhone(String phone);
	public List<Person> getEmail(String email);
}
