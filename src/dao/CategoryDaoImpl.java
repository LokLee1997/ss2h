package dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import po.Category;
@Transactional
public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao {

	@Override
	public void saveOrUpdateCategory(Category category) {
		// TODO 自动生成的方法存根
		getHibernateTemplate().saveOrUpdate(category);
	}

	@Override
	public void removeCategory(Category category) {
		// TODO 自动生成的方法存根
		getHibernateTemplate().delete(category);
	}

	@Override
	public Category getCategoryById(Integer id) {
		// TODO 自动生成的方法存根
		return getHibernateTemplate().get(Category.class, id);
	}

	@Override
	public List<Category> findAllCategories() {
		// TODO 自动生成的方法存根
		return (List<Category>) getHibernateTemplate().find("from Category");
	}

	@Override
	public List<Category> getCategoryByName(String categoryName) {
		// TODO 自动生成的方法存根
		return (List<Category>)getHibernateTemplate().find("from Category where categoryName=?", categoryName);
	}

}
