package service;

import java.util.List;

import javax.annotation.Resource;

import dao.NewDao;
import po.News;

public class NewServiceImpl implements NewService {
	@Resource private NewDao newDao;
	@Override
	public void addNews(News news) {
		// TODO �Զ����ɵķ������
		newDao.saveOrUpdateNew(news);
	}

	@Override
	public void updateNews(News news) {
		// TODO �Զ����ɵķ������
		newDao.saveOrUpdateNew(news);
	}

	@Override
	public void deleteNews(Integer id) {
		// TODO �Զ����ɵķ������
		News news = newDao.getNewsById(id);
		newDao.removeNew(news);
		
	}

	@Override
	public News getNewsById(Integer id) {
		// TODO �Զ����ɵķ������
		return newDao.getNewsById(id);
	}

	@Override
	public List<News> findAllNews() {
		// TODO �Զ����ɵķ������
		return newDao.findAllNews();
	}

	@Override
	public List<News> findNewsByKW(String keyword) {
		// TODO �Զ����ɵķ������
		return newDao.findNewsByKW(keyword);
	}

	@Override
	public List<News> findNewsByC(Integer id) {
		// TODO �Զ����ɵķ������
		return newDao.findNewsByCa(id);
	}

	@Override
	public List<News> findNewsByLastTime() {
		// TODO �Զ����ɵķ������
		return newDao.findNewsByLastTime();
	}

}
