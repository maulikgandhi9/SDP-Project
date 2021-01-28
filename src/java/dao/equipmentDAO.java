/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Book;
import entities.Equipment;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author maulik
 */
public class equipmentDAO {

    private SessionFactory factory;

    public equipmentDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveEquipment(Equipment equ) {
        boolean flag = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(equ);
            tx.commit();
            session.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }
    
    
    public List<Equipment> getEquipments() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Equipment");
        List<Equipment> list = query.list();
        return list;
    }
}
