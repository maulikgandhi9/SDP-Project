package entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author maulik
 */
@Entity

public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="b_id")
    private int b_id;
    
    @Column(name="b_name")
    private String b_name;
    
    @Column(name="b_desc" , length=5000)
    private String b_desc;
    
    @Column(name="b_image")
    private String b_image;
    
    @Column(name="d_email")
    private String d_email;

    @Column(name="b_dept")
    private String b_dept;
    
    @Column(name="downvotes",columnDefinition = "int default 0")
    private int downvotes;
    
    @Column(name="upvotes",columnDefinition = "int default 0")
    private int upvotes;
    
    public Book(String b_name, String b_desc, String b_image, String d_email,String b_dept) {
        this.b_name = b_name;
        this.b_desc = b_desc;
        this.b_image = b_image;
        this.d_email = d_email;
        this.b_dept=b_dept;
    }

    public Book() {
    }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getB_desc() {
        return b_desc;
    }

    public void setB_desc(String b_desc) {
        this.b_desc = b_desc;
    }

    public String getB_image() {
        return b_image;
    }

    public void setB_image(String b_image) {
        this.b_image = b_image;
    }

    public String getD_email() {
        return d_email;
    }

    public void setD_email(String d_email) {
        this.d_email = d_email;
    }

    public String getB_dept() {
        return b_dept;
    }

    public void setB_dept(String b_dept) {
        this.b_dept = b_dept;
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
    
    
    @Override
    public String toString() {
        return "Book{" + "b_id=" + b_id + ", b_name=" + b_name + ", b_desc=" + b_desc + ", b_image=" + b_image + ", d_email=" + d_email + '}';
    }
    
    
}
