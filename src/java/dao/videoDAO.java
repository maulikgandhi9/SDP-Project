/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Video;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author maulik
 */
public class videoDAO {

    private SessionFactory factory;

    public videoDAO(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveVideo(Video video) {
        boolean flag = false;

        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(video);
            tx.commit();
            session.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    public List<Video> getVideos() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Video");
        List<Video> list = query.list();
        return list;
    }
    
    public void deleteVideo(Video video) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        session.delete(video);
        tx.commit();
        session.close();
    }
}
