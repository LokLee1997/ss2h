package dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import po.Category;
@Transactional
public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao {

	@Override
	public void saveOrUpdateCategory(Category category) {
		// TODO �Զ����ɵķ������
		getHibernateTemplate().saveOrUpdate(category);
	}

	@Override
	public void removeCategory(Category category) {
		// TODO �Զ����ɵķ������
		getHibernateTemplate().delete(category);
	}

	@Override
	public Category getCategoryById(Integer id) {
		// TODO �Զ����ɵķ������
		return getHibernateTemplate().get(Category.class, id);
	}

	@Override
	public List<Category> findAllCategories() {
		// TODO �Զ����ɵķ������
		return (List<Category>) getHibernateTemplate().find("from Category");
	}

	@Override
	public List<Category> getCategoryByName(String categoryName) {
		// TODO �Զ����ɵķ������
		return (List<Category>)getHibernateTemplate().find("from Category where categoryName=?", categoryName);
	}

}
