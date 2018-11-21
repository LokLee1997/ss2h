package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.CategoryDaoImpl;
import po.Category;
import service.CategoryService;
import service.CategoryServiceImpl;

public class CategoryAction extends ActionSupport {
	private int cid;
	private List<Category> categories;
	@Resource private CategoryService categoryService;
	private String result;
	private String cn_result;
	private String categoryName;
	private Category category;
	CategoryAction(){
		categoryService = new CategoryServiceImpl();
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCn_result() {
		return cn_result;
	}
	public void setCn_result(String cn_result) {
		this.cn_result = cn_result;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
	public String add_page(){
		return "add_page";
	}
	public String add(){
		Category category = new Category();
		category.setCategoryName(categoryName);
		categoryService.addCategory(category);
		return SUCCESS;
	}
	
	public String update_page(){
		System.out.println(cid);
		category=categoryService.getCategoryById(cid);
		return "update_page";
	}
	
	public String updated(){
		boolean flag = categoryService.checkCategoryName(this.categoryName);
		if (flag==true) {
			result = "true";
			return "false";
		}else {
			category = categoryService.getCategoryById(cid);
			System.out.println(cid);
			System.out.println(categoryName);
			category.setCategoryName(categoryName);
			categoryService.updateCategory(category);
			return SUCCESS;
		}	
	}
	
	public String delete(){
		categoryService.deleteCategory(cid);
		return SUCCESS;
	}
	
	public String listCategory(){
		categories = categoryService.findAllCategories();
		return "listCategory";
	}
	public String list() throws IOException{
		categories = categoryService.findAllCategories();
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"category"});
		JSONArray jsonArray = JSONArray.fromObject(categories,config);
		result = jsonArray.toString();
		return SUCCESS;
	}
	public String checkCategoryName(){
		boolean flag = categoryService.checkCategoryName(this.categoryName);
		if (flag==true) {
			this.cn_result = "true";
		}else {
			this.cn_result = "false";
		}
		return SUCCESS;
	}
}
