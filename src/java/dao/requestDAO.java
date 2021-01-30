/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Book;
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
public class requestDAO {

    private SessionFactory factory;

    public requestDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveRequest(Request req) {
        boolean flag = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(req);
            tx.commit();
            session.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

     public List<Request> getRequests() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Request");
        List<Request> list = query.list();
        return list;
    }
}
