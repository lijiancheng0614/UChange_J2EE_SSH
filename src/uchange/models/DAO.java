package uchange.models;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Property;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import uchange.models.HibernateSessionFactory;

/**
 * A data access object for all entities of UChange modified from
 * hibernateTest1:comm.buaa.hibernate, and provides generic search methods
 */
public class DAO {
	@SuppressWarnings("unused")
	private static final String modelPackagePrefix = "uchange.models.";
	private static final Logger log = LoggerFactory.getLogger(DAO.class);
	private SessionFactory factory;

	@SuppressWarnings("deprecation")
	public DAO() {
		Configuration cfg = new Configuration().configure();
		this.factory = cfg.buildSessionFactory();
	}

	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}

	public void update(Object transientInstance) {
		this.getSession().update(transientInstance);
	}

	public void save(Object transientInstance) {
		log.debug("saving POJO instance");
		System.out.println("saving POJO instance");
		Session s = getSession();
		Transaction t = s.beginTransaction();
		try {
			s.save(transientInstance);
			log.debug("save successful");
			System.out.println("save successful");
			t.commit();
		} catch (RuntimeException re) {
			log.error("save failed", re);
			System.out.println("save failed");
			t.rollback();
			throw re;
		} finally {
			
		}
	}

	public void delete(Object persistentInstance) {
		log.debug("deleting Testuser instance");
		Session s = getSession();
		Transaction t = s.beginTransaction();
		try {
			s.delete(persistentInstance);
			log.debug("delete successful");
			t.commit();
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			t.rollback();
			throw re;
		} finally {
			
		}
	}

	/**
	 * 窝越来越讨厌java伪泛型的类型擦除了
	 * 
	 * @param clazz
	 *            因为类型擦除所以需要把要找的类型名.class作为一个参数否则无法得知T的类型
	 * @param id
	 * @return 找到的对象
	 */
	public <T> T findById(Class<T> clazz, java.lang.Integer id) {
		log.debug("getting POJO: " + clazz.getName() + ", with id: "
				+ id.toString());
		Session s = getSession();
		try {

			T instance = (T) s.get(clazz.getName(), id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		} finally {
			
		}
	}

	public <T> List<T> findByExample(Class<T> clazz, T instance) {
		log.debug("finding POJO instance by example: " + clazz.getName());
		Session s = getSession();
		try {
			List results = s.createCriteria(clazz)
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		} finally {
			
		}
	}

	public <T> List<T> findByProperty(Class<T> clazz, String propertyName,
			Object value) {
		log.debug("finding POJO instance: " + clazz.getName()
				+ ", with property: " + propertyName + ", value: " + value);
		Session s = getSession();
		try {
			Property prop = Property.forName(propertyName);
			List results = s.createCriteria(clazz).add(prop.eq(value)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;

			// now use criteria instead
			// String queryString = "from Testuser as model where model."
			// + propertyName + "= ?";
			// Query queryObject = getSession().createQuery(queryString);
			// queryObject.setParameter(0, value);
			// return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		} finally {
			
		}
	}

	public <T> List<T> findAll(Class<T> clazz) {
		log.debug("finding all Testuser instances");
		Session s = getSession();
		try {
			String queryString = "from " + clazz.getSimpleName();
			Query queryObject = s.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		} finally {
			
		}
	}

	public <T> T merge(T detachedInstance) {
		log.debug("merging POJO instance");
		Session s = getSession();
		Transaction t = s.beginTransaction();
		try {
			T result = (T) s.merge(detachedInstance);
			log.debug("merge successful");
			t.commit();
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			t.rollback();
			throw re;
		} finally {
			
		}
	}

	public void attachDirty(Object instance) {
		log.debug("attaching dirty Testuser instance");
		Session s = getSession();
		Transaction t = s.beginTransaction();
		try {
			s.saveOrUpdate(instance);
			log.debug("attach successful");
			t.commit();
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			t.rollback();
			throw re;
		} finally {
			
		}
	}

	public void attachClean(Object instance) {
		log.debug("attaching clean Testuser instance");
		Session s = getSession();
		Transaction t = s.beginTransaction();
		try {
			s.lock(instance, LockMode.NONE);
			t.commit();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			t.rollback();
			throw re;
		} finally {
			
		}
	}

	public Session openSession() {

		Session session = this.factory.openSession();
		return session;
	}

}
