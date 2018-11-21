package service;

import java.util.List;

import po.Category;

public interface CategoryService {
	public void addCategory(Category category);
	public void updateCategory(Category category);
	public void deleteCategory(Integer id);
	public Category getCategoryById(Integer id);
	public List<Category> findAllCategories();
	public boolean checkCategoryName(String categoryName);
}
