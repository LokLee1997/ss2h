package service;

import java.util.List;

import javax.annotation.Resource;

import dao.NewDao;
import po.News;

public class NewServiceImpl implements NewService {
	@Resource private NewDao newDao;
	@Override
	public void addNews(News news) {
		// TODO 自动生成的方法存根
		newDao.saveOrUpdateNew(news);
	}

	@Override
	public void updateNews(News news) {
		// TODO 自动生成的方法存根
		newDao.saveOrUpdateNew(news);
	}

	@Override
	public void deleteNews(Integer id) {
		// TODO 自动生成的方法存根
		News news = newDao.getNewsById(id);
		newDao.removeNew(news);
		
	}

	@Override
	public News getNewsById(Integer id) {
		// TODO 自动生成的方法存根
		return newDao.getNewsById(id);
	}

	@Override
	public List<News> findAllNews() {
		// TODO 自动生成的方法存根
		return newDao.findAllNews();
	}

	@Override
	public List<News> findNewsByKW(String keyword) {
		// TODO 自动生成的方法存根
		return newDao.findNewsByKW(keyword);
	}

	@Override
	public List<News> findNewsByC(Integer id) {
		// TODO 自动生成的方法存根
		return newDao.findNewsByCa(id);
	}

	@Override
	public List<News> findNewsByLastTime() {
		// TODO 自动生成的方法存根
		return newDao.findNewsByLastTime();
	}

}
