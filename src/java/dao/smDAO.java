/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Book;
import entities.studyMaterial;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author maulik
 */
public class smDAO {
        private SessionFactory factory;

    public smDAO(SessionFactory factory) {
        this.factory = factory;
    }
        
    public boolean saveSm(studyMaterial sm) {
        boolean flag = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(sm);
            tx.commit();
            session.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    public List<studyMaterial> getSm() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from studyMaterial");
        List<studyMaterial> list = query.list();
        return list;
    }
    
    public void deleteSm(studyMaterial sm) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        session.delete(sm);
        tx.commit();
        session.close();
    }
}
