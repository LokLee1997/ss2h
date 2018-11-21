package dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import po.News;
@Transactional
public class NewDaoImpl extends HibernateDaoSupport implements NewDao {

	@Override
	public void saveOrUpdateNew(News news) {
		// TODO 自动生成的方法存根
		getHibernateTemplate().saveOrUpdate(news);
	}

	@Override
	public void removeNew(News news) {
		// TODO 自动生成的方法存根
		getHibernateTemplate().delete(news);
	}

	@Override
	public News getNewsById(Integer id) {
		// TODO 自动生成的方法存根
		return getHibernateTemplate().get(News.class, id);
	}

	@Override
	public List<News> findAllNews() {
		// TODO 自动生成的方法存根
		List<News> news = (List<News>) getHibernateTemplate().find("from News");
		return news;
	}

	@Override
	public List<News> findNewsByKW(String keyword) {
		// TODO 自动生成的方法存根
		return (List<News>) getHibernateTemplate().find("from News where title like ? or content like ? ORDER BY issueTime desc,id desc","%"+keyword+"%","%"+keyword+"%");
	}

	@Override
	public List<News> findNewsByCa(Integer id) {
		// TODO 自动生成的方法存根
		return (List<News>) getHibernateTemplate().find("from News where c_id=? ORDER BY issueTime desc,id desc", id);
	}

	@Override
	public List<News> findNewsByLastTime() {
		// TODO 自动生成的方法存根
		return (List<News>) getHibernateTemplate().find("from News ORDER BY issueTime desc,id desc");
	}

}
