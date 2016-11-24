
package com.jwt.hibernate.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.jwt.hibernate.bean.Aggregate;
import com.jwt.hibernate.controller.aggregateController;

public class aggregateDAO {
	
	public List<Aggregate> getDetails(){
		List<Aggregate> list = null;
		
		try {
    		Configuration configuration = new Configuration().configure();
		    SessionFactory sessionFactory = configuration.buildSessionFactory();
		    Session session = sessionFactory.openSession();
		    Transaction transaction = session.beginTransaction();
            
 
            //String Max="max";
            Query<?> query = session.createQuery("from Aggregate");
         
            List<Aggregate> result = (List<Aggregate>) query.list();
                  
            
            transaction.commit();
            System.out.println("\n\n Retrieved \n");
            return result;
            
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
        }
    	
    	return list;
	}

	public aggregateDAO() {
		// TODO Auto-generated constructor stub
	}

	

}