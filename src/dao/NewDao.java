package dao;


import java.util.List;

import po.News;

public interface NewDao {

	public void saveOrUpdateNew(News news);
	public void removeNew(News news);
	public News getNewsById(Integer id);
	public List<News> findAllNews();
	public List<News> findNewsByKW(String keyword);
	public List<News> findNewsByCa(Integer id);
	public List<News> findNewsByLastTime();
}
