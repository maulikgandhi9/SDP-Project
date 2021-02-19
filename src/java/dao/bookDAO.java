/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Book;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author maulik
 */
public class bookDAO {

    private SessionFactory factory;

    public bookDAO(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveBook(Book book) {
        boolean flag = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(book);
            tx.commit();
            session.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    public List<Book> getBooks() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Book");
        List<Book> list = query.list();
        return list;
    }

    public void deleteBook(Book book) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        session.delete(book);
        tx.commit();
        session.close();
    }
}
