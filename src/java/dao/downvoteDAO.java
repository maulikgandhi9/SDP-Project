/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Downvote;
import entities.Request;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author maulik
 */
public class downvoteDAO {

    private SessionFactory factory;

    public downvoteDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveDownvote(Downvote d) {
        boolean flag = false;
        Session session=null;
        Transaction tx=null;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            session.saveOrUpdate(d);
            tx.commit();
            
            
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        finally{
            if(!tx.wasCommitted()){
                tx.rollback();
            }
            session.flush();
            session.close();
        }
            
        return flag;
    }

     public List<Downvote> getDownvotes() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Downvote");
        List<Downvote> list = query.list();
        return list;
    }
}

