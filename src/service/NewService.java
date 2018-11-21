package service;

import java.util.List;

import po.News;

public interface NewService {
	public void addNews(News news);
	public void updateNews(News news);
	public void deleteNews(Integer id);
	public News getNewsById(Integer id);
	public List<News> findAllNews();
	public List<News> findNewsByKW(String keyword);
	public List<News> findNewsByC(Integer id);
	public List<News> findNewsByLastTime();
}
