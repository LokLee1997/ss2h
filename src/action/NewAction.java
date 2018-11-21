package action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Category;
import po.News;
import service.CategoryService;
import service.NewService;

import com.opensymphony.xwork2.ActionSupport;

public class NewAction extends ActionSupport{
	@Resource private NewService newService;
	@Resource private CategoryService categoryService;
	private String keyword;
	private String result;
	private int nid;
	private int cid;
	private News news;
	private Category category;
	private List<News> newses;
	private List<Category> categories;
	Date now = new Date();
	private String title;
	private String content;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<News> getNewses() {
		return newses;
	}
	public void setNewses(List<News> newses) {
		this.newses = newses;
	}
	public List<Category> getCategories() {
		return categories;
	}
	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
	public String addNew(){
		category = categoryService.getCategoryById(cid);
		News news = new News();
		news.setTitle(title);
		news.setContent(content);
		news.setIssueTime(now);
		news.setCategory(category);
		newService.addNews(news);
		return SUCCESS;
	}
	
	public String add(){
		categories = categoryService.findAllCategories();
		return "addNews_page";
	}
	public String updateNew(){
		news = newService.getNewsById(nid);
		categories = categoryService.findAllCategories();
		return "updateNews_page";
	}
	public String updatedNew(){
		category = categoryService.getCategoryById(cid);
		news = newService.getNewsById(nid);
		System.out.println(title);
		System.out.println(content);
		news.setTitle(title);
		news.setContent(content);
		news.setIssueTime(now);
		news.setCategory(category);
		newService.updateNews(news);
		return SUCCESS;
	}
	public String deleteNew(){
		newService.deleteNews(nid);
		return SUCCESS;
	}
	public String listNew(){
		newses  = newService.findNewsByLastTime();
		categories = categoryService.findAllCategories();
		return "list";
	}
	public String showNews(){
		news = newService.getNewsById(nid);
		System.out.println(nid);
		return "showNews";
	}
	public String findByCategory(){
		newses = newService.findNewsByC(cid);
		category = categoryService.getCategoryById(cid);
		return "list";
	}
	public String findByKW(){
		categories = categoryService.findAllCategories();
		newses = newService.findNewsByKW(keyword);
		System.out.println(keyword);
		return "list";
	}
	
}
