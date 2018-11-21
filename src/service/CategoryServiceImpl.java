package service;

import java.util.List;

import javax.annotation.Resource;

import dao.CategoryDao;
import po.Category;

public class CategoryServiceImpl implements CategoryService {
	@Resource private CategoryDao categoryDao;
	@Override
	public void addCategory(Category category) {
		// TODO �Զ����ɵķ������
		categoryDao.saveOrUpdateCategory(category);
	}

	@Override
	public void updateCategory(Category category) {
		// TODO �Զ����ɵķ������
		categoryDao.saveOrUpdateCategory(category);
	}

	@Override
	public void deleteCategory(Integer id) {
		// TODO �Զ����ɵķ������
		Category category = getCategoryById(id);
		categoryDao.removeCategory(category);
	}

	@Override
	public Category getCategoryById(Integer id) {
		// TODO �Զ����ɵķ������
		return categoryDao.getCategoryById(id);
	}

	@Override
	public List<Category> findAllCategories() {
		// TODO �Զ����ɵķ������
		return categoryDao.findAllCategories();
	}

	@Override
	public boolean checkCategoryName(String categoryName) {
		// TODO �Զ����ɵķ������
		List<Category> categories = categoryDao.getCategoryByName(categoryName);
		if (categories.size()>0) {
			return true;
		}else{
		return false;
		}
	}

}
