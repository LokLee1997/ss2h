package po;

import java.util.HashSet;
import java.util.Set;
import po.News;

public class Category {
	private Integer id;
	private String categoryName;
	private Set<News> news = new HashSet<News>();
	public Set<News> getNews() {
		return news;
	}
	public void setNews(Set<News> news) {
		this.news = news;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
}
