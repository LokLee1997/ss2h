package dao;

import java.util.List;

import po.Category;
import po.Person;

public interface CategoryDao {
	public void saveOrUpdateCategory(Category category);
	public void removeCategory(Category category);
	public Category getCategoryById(Integer id);
	public List<Category> findAllCategories();
	public List<Category> getCategoryByName(String categoryName);
}
