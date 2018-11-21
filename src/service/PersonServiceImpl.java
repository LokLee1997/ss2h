package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import dao.PersonDao;
import po.Person;
@Transactional(readOnly=false)
public class PersonServiceImpl implements PersonService {
	@Resource private PersonDao personDao;
	public PersonDao getPersonDao() {
			return personDao;
	}
	public void setPersonDao(PersonDao personDao) {
		this.personDao = personDao;
	}

	@Override
	public boolean checkPerson(Person person) {
		// TODO �Զ����ɵķ������
		List<Person> persons = personDao.getPersonByNameAndPass(person);
		if (persons.size()>0) {
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean checkPersonByName(String username) {
		// TODO �Զ����ɵķ������
		List<Person> persons = personDao.getPersonByName(username);
		if (persons.size()>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public void addPerson(Person person) {
		// TODO �Զ����ɵķ������
		personDao.saveOrUpdatePerson(person);
	}
	@Override
	public boolean isPhoneEmpty(String phone) {
		// TODO �Զ����ɵķ������
		List<Person> persons = personDao.getPhone(phone);
		if (persons.size()>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public boolean isEmailEmpty(String email) {
		// TODO �Զ����ɵķ������
		List<Person> persons = personDao.getEmail(email);
		if (persons.size()>0) {
			return true;
		}else {
			return false;
		}
	}

}
