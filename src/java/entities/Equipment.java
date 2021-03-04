/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author maulik
 */
@Entity


public class Equipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="e_id")
    private int e_id;
    
    @Column(name="e_name")
    private String e_name;
    
    @Column(name="e_desc" , length=5000)
    private String e_desc;
    
    @Column(name="e_image")
    private String e_image;
    
    @Column(name="d_email")
    private String d_email;
    
    @Column(name="downvotes",columnDefinition = "int default 0")
    private int downvotes;
    
    @Column(name="upvotes",columnDefinition = "int default 0")
    private int upvotes;
    
    public Equipment(String e_name, String e_desc, String e_image, String d_email) {
        this.e_name = e_name;
        this.e_desc = e_desc;
        this.e_image = e_image;
        this.d_email = d_email;
    }

    public Equipment() {
    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public String getE_desc() {
        return e_desc;
    }

    public void setE_desc(String e_desc) {
        this.e_desc = e_desc;
    }

    public String getE_image() {
        return e_image;
    }

    public void setE_image(String e_image) {
        this.e_image = e_image;
    }

    public String getD_email() {
        return d_email;
    }

    public void setD_email(String d_email) {
        this.d_email = d_email;
    }

    public int getDownvotes() {
        return downvotes;
    }

    public void setDownvotes(int downvotes) {
        this.downvotes = downvotes;
    }

    public int getUpvotes() {
        return upvotes;
    }

    public void setUpvotes(int upvotes) {
        this.upvotes = upvotes;
    }
    
    
}
