package dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import po.Person;

public class PersonDaoImpl extends HibernateDaoSupport implements PersonDao{

	@Override
	public void saveOrUpdatePerson(Person person) {
		// TODO �Զ����ɵķ������
		getHibernateTemplate().persist(person);
	}

	

	@Override
	public List<Person> getPersonByNameAndPass(Person person) {
		// TODO �Զ����ɵķ������
		return (List<Person>) getHibernateTemplate().find("from Person where username=? and password=?", person.getUsername(),person.getPassword());
	}
	@Override
	public List<Person> getPersonByName(String username) {
		// TODO �Զ����ɵķ������
		return (List<Person>) getHibernateTemplate().find("from Person where username=?",username);
		
	}



	@Override
	public List<Person> getPhone(String phone) {
		// TODO �Զ����ɵķ������
		return (List<Person>) getHibernateTemplate().find("from Person where phone=?", phone);
	}



	@Override
	public List<Person> getEmail(String email) {
		// TODO �Զ����ɵķ������
		return (List<Person>)getHibernateTemplate().find("from Person where email=?", email);
	}
	

}
